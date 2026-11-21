<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Product;
use App\Models\Provider;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Pagination\LengthAwarePaginator;
use Spatie\Permission\Models\Permission;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    use RefreshDatabase;

    public function test_the_products_index_handles_missing_relations(): void
    {
        $user = User::factory()->create();
        $proveedor = Provider::create([
            'document_number' => '900123456',
            'name' => 'Proveedor de prueba',
        ]);
        $categoria = Category::create(['nombre' => 'Categoría de prueba']);

        $producto = Product::create([
            'nombre' => 'Producto de prueba',
            'descripcion' => 'Debe renderizar sin romper la vista.',
            'stock' => 4,
            'codigo' => '9780000000000',
            'proveedor_id' => $proveedor->id,
            'categoria_id' => $categoria->id,
        ]);

        $producto->setRelation('proveedor', null);
        $producto->setRelation('category', null);

        $this->actingAs($user)
            ->view('products.index', [
                'products' => new LengthAwarePaginator([$producto], 1, 10),
                'categories' => collect(),
                'showTrashed' => false,
                'trashedCount' => 0,
            ])
            ->assertSee('Producto de prueba')
            ->assertSee('—');
    }

    public function test_dashboard_shows_practical_kpis_for_analysis(): void
    {
        $user = User::factory()->create();
        $user->givePermissionTo(Permission::findOrCreate('ver-productos', 'web'));

        $this->actingAs($user)
            ->get('/dashboard')
            ->assertOk()
            ->assertSee('Productos activos')
            ->assertSee('Stock bajo')
            ->assertSee('Valor del inventario');
    }
}
