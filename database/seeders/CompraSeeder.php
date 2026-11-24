<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\Purchase;
use App\Models\User;
use App\Services\PurchaseService;
use Illuminate\Database\Seeder;

class CompraSeeder extends Seeder
{
    public function run(): void
    {
        if (Purchase::withTrashed()->exists()) {
            return;
        }

        $service = app(PurchaseService::class);
        $user = User::where('email', 'admin@test.com')->firstOrFail();

        $compras = [
            // [días atrás, código producto, cantidad pedida, costo unitario, cantidad que llega]
            [28, 'PRD-0001', 20, 48000, 20],
            [26, 'PRD-0003', 50, 11000, 50],
            [21, 'PRD-0005', 5, 150000, 5],
            [15, 'PRD-0002', 30, 15000, 30],
            [12, 'PRD-0004', 40, 4800, 40],
            [9, 'PRD-0001', 10, 22000, 4],   // parcial
            [7, 'PRD-0003', 30, 12000, 15],  // parcial
            [5, 'PRD-0002', 24, 9500, 0],    // pendiente (stock crítico)
            [4, 'PRD-0004', 40, 8200, 0],    // pendiente (stock crítico)
            [2, 'PRD-0005', 6, 320000, 0],   // pendiente
        ];

        foreach ($compras as [$dias, $codigo, $cantidad, $costo, $llega]) {
            $producto = Product::where('codigo', $codigo)->firstOrFail();

            $purchase = $service->register([
                'provider_id' => $producto->proveedor_id,
                'purchase_date' => now()->subDays($dias)->toDateString(),
                'items' => [['product_id' => $producto->id, 'quantity' => $cantidad, 'unit_cost' => $costo]],
            ], $user->id);

            if ($llega > 0) {
                $service->receive($purchase, [$purchase->details()->first()->id => $llega]);
            }
        }
    }
}
