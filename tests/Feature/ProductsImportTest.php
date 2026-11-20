<?php

namespace Tests\Feature;

use App\Exports\ProductsTemplateExport;
use App\Imports\ProductsImport;
use App\Models\Category;
use App\Models\Product;
use App\Models\Provider;
use App\Services\InventoryService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Validator;
use Tests\TestCase;

class ProductsImportTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_imports_a_product_using_the_real_category_and_provider_columns(): void
    {
        $category = Category::create(['nombre' => 'Papelería']);
        $provider = Provider::create([
            'document_type' => 'NIT',
            'document_number' => '900123456',
            'name' => 'Proveedor de prueba',
            'active' => true,
        ]);
        $row = [
            'nombre' => 'Cuaderno de prueba',
            'descripcion' => 'Importado desde Excel',
            'precio' => 12500,
            'stock' => 4,
            'categoria' => $category->nombre,
            'proveedor' => $provider->name,
        ];
        $import = new ProductsImport(app(InventoryService::class));

        $this->assertTrue(Validator::make($row, $import->rules())->passes());

        $import->collection(collect([$row]));

        $product = Product::where('nombre', 'Cuaderno de prueba')->firstOrFail();
        $this->assertSame(sprintf('PROD-%06d', $product->id), $product->codigo);
        $this->assertSame('Importado desde Excel', $product->descripcion);
        $this->assertSame('12500.00', $product->precio);
        $this->assertSame(4, $product->stock);
        $this->assertSame($category->id, $product->categoria_id);
        $this->assertSame($provider->id, $product->proveedor_id);

        $import->collection(collect([array_merge($row, [
            'descripcion' => 'Descripción actualizada',
            'precio' => 13000,
            'stock' => 20,
        ])]));
        $product->refresh();

        $this->assertSame('PROD-'.str_pad((string) $product->id, 6, '0', STR_PAD_LEFT), $product->codigo);
        $this->assertSame('Descripción actualizada', $product->descripcion);
        $this->assertSame(4, $product->stock);
        $this->assertSame(1, $import->created);
        $this->assertSame(1, $import->updated);
        $this->assertDatabaseHas('inventory_movements', [
            'concept' => 'inventario_inicial',
            'quantity' => 4,
        ]);
        $this->assertSame(
            ['nombre', 'descripcion', 'precio', 'stock', 'categoria', 'proveedor'],
            (new ProductsTemplateExport)->headings(),
        );
    }
}
