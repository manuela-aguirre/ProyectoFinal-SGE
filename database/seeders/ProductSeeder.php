<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Product;
use App\Models\Provider;
use App\Services\InventoryService;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(InventoryService $inventory): void
    {
        $computacion = Category::firstOrCreate(['nombre' => 'Computación'], ['codigo' => 'CAT-COM']);
        $accesorios = Category::firstOrCreate(['nombre' => 'Accesorios'], ['codigo' => 'CAT-ACC']);
        $providerId = Provider::query()->firstOrFail()->id;
        $products = [
            ['codigo' => 'PRD-0001', 'nombre' => 'Laptop Lenovo', 'precio' => 4500000, 'stock' => 10, 'categoria_id' => $computacion->id],
            ['codigo' => 'PRD-0002', 'nombre' => 'Mouse Logitech', 'precio' => 120000, 'stock' => 30, 'categoria_id' => $accesorios->id],
            ['codigo' => 'PRD-0003', 'nombre' => 'Teclado Mecánico', 'precio' => 250000, 'stock' => 15, 'categoria_id' => $accesorios->id],
            ['codigo' => 'PRD-0004', 'nombre' => 'Monitor Samsung', 'precio' => 850000, 'stock' => 4, 'categoria_id' => $computacion->id],
            ['codigo' => 'PRD-0005', 'nombre' => 'Diadema HyperX', 'precio' => 320000, 'stock' => 8, 'categoria_id' => $accesorios->id],
        ];
        foreach ($products as $product) {
            $model = Product::firstOrCreate(
                ['codigo' => $product['codigo']],
                $product + ['proveedor_id' => $providerId],
            );
            // Clase 12: saldo inicial en el kardex (si el producto aún no tiene movimientos)
            $inventory->opening($model);
        }
    }
}
