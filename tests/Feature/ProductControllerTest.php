<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Product;
use App\Models\Provider;
use App\Models\User;
use Database\Seeders\RolePermissionSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ProductControllerTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        $this->withoutVite();
    }

    public function test_index_searches_by_product_name_or_description(): void
    {
        $user = $this->adminUser();
        $category = Category::create(['nombre' => 'Categoría de prueba']);
        Product::factory()->create([
            'nombre' => 'Equipo portátil',
            'descripcion' => 'Para trabajo de oficina',
            'categoria_id' => $category->id,
        ]);
        Product::factory()->create([
            'nombre' => 'Monitor de referencia',
            'descripcion' => 'Equipo complementario',
            'categoria_id' => $category->id,
        ]);
        Product::factory()->create([
            'nombre' => 'Cable de red',
            'descripcion' => 'Conexión',
            'categoria_id' => $category->id,
        ]);

        $this->actingAs($user)
            ->get(route('products.index', ['search' => 'Equipo']))
            ->assertOk()
            ->assertSee('Equipo portátil')
            ->assertSee('Monitor de referencia')
            ->assertDontSee('Cable de red');
    }

    public function test_index_filters_products_by_category(): void
    {
        $user = $this->adminUser();
        $category = Category::create(['nombre' => 'Categoría seleccionada']);
        $otherCategory = Category::create(['nombre' => 'Otra categoría']);
        Product::factory()->create([
            'nombre' => 'Producto de la categoría',
            'categoria_id' => $category->id,
        ]);
        Product::factory()->create([
            'nombre' => 'Producto de otra categoría',
            'categoria_id' => $otherCategory->id,
        ]);

        $this->actingAs($user)
            ->get(route('products.index', ['category' => $category->id]))
            ->assertOk()
            ->assertSee('Producto de la categoría')
            ->assertDontSee('Producto de otra categoría');
    }

    public function test_index_displays_trashed_products_to_users_with_delete_permission(): void
    {
        $user = $this->adminUser();
        Product::factory()->create(['nombre' => 'Producto activo']);
        $trashedProduct = Product::factory()->create(['nombre' => 'Producto en papelera']);
        $trashedProduct->delete();

        $this->actingAs($user)
            ->get(route('products.index', ['trashed' => 1]))
            ->assertOk()
            ->assertSee('Producto en papelera')
            ->assertDontSee('Producto activo');
    }

    public function test_store_records_initial_stock_as_an_inventory_movement(): void
    {
        $user = $this->adminUser();
        $category = Category::create(['nombre' => 'Categoría de inventario']);
        $provider = Provider::factory()->create();

        $this->actingAs($user)
            ->post(route('products.store'), [
                'nombre' => 'Producto con saldo inicial',
                'descripcion' => 'Registro de inventario inicial',
                'stock' => 4,
                'precio' => 100,
                'proveedor_id' => $provider->id,
                'categoria_id' => $category->id,
            ])
            ->assertRedirect(route('products.index'));

        $product = Product::where('nombre', 'Producto con saldo inicial')->firstOrFail();

        $this->assertSame(4, $product->stock);
        $this->assertDatabaseHas('inventory_movements', [
            'product_id' => $product->id,
            'type' => 'entrada',
            'concept' => 'inventario_inicial',
            'quantity' => 4,
            'balance' => 4,
        ]);
    }

    public function test_product_can_be_deleted_and_restored_with_success_messages(): void
    {
        $user = $this->adminUser();
        $product = Product::factory()->create(['nombre' => 'Producto restaurable']);

        $this->actingAs($user)
            ->delete(route('products.destroy', $product))
            ->assertRedirect(route('products.index'))
            ->assertSessionHas('success', 'Producto «Producto restaurable» enviado a la papelera.');

        $this->assertSoftDeleted($product);

        $this->actingAs($user)
            ->from(route('products.index', ['trashed' => 1]))
            ->patch(route('products.restore', $product))
            ->assertRedirect(route('products.index', ['trashed' => 1]))
            ->assertSessionHas('success', 'Producto «Producto restaurable» restaurado.');

        $this->assertNotSoftDeleted($product);
    }

    public function test_product_cannot_be_restored_before_its_trashed_category(): void
    {
        $user = $this->adminUser();
        $category = Category::create(['nombre' => 'Categoría eliminada']);
        $product = Product::factory()->create(['categoria_id' => $category->id]);
        $product->delete();
        $category->delete();

        $this->actingAs($user)
            ->from(route('products.index', ['trashed' => 1]))
            ->patch(route('products.restore', $product))
            ->assertRedirect(route('products.index', ['trashed' => 1]))
            ->assertSessionHas('error', 'Restaura primero la categoría «Categoría eliminada».');

        $this->assertSoftDeleted($product);
    }

    private function adminUser(): User
    {
        $this->seed(RolePermissionSeeder::class);
        $user = User::factory()->create();
        $user->assignRole('admin');

        return $user;
    }
}
