<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Client;
use App\Models\Product;
use App\Models\Provider;
use App\Models\User;
use App\Services\SaleService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SaleServiceTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_sells_a_product_using_the_products_schema_without_an_active_column(): void
    {
        $user = User::factory()->create();
        $client = Client::create([
            'document_type' => 'CC',
            'document_number' => '123456789',
            'name' => 'Cliente de prueba',
            'active' => true,
        ]);
        $category = Category::create(['nombre' => 'Categoría de prueba']);
        $provider = Provider::create([
            'document_type' => 'NIT',
            'document_number' => '900123456',
            'name' => 'Proveedor de prueba',
            'active' => true,
        ]);
        $product = Product::create([
            'nombre' => 'Producto de prueba',
            'stock' => 5,
            'precio' => 100,
            'proveedor_id' => $provider->id,
            'categoria_id' => $category->id,
        ]);

        $sale = app(SaleService::class)->register([
            'client_id' => $client->id,
            'sale_date' => now()->toDateString(),
            'items' => [
                ['product_id' => $product->id, 'quantity' => 2],
            ],
        ], $user->id);

        $this->assertSame('200.00', $sale->subtotal);
        $this->assertSame(3, $product->fresh()->stock);
        $this->assertDatabaseHas('sale_details', [
            'sale_id' => $sale->id,
            'product_id' => $product->id,
            'unit_price' => 100,
            'quantity' => 2,
        ]);
    }
}
