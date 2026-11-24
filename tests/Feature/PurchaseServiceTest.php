<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Client;
use App\Models\Product;
use App\Models\Provider;
use App\Models\User;
use App\Services\PurchaseService;
use App\Services\SaleService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Validation\ValidationException;
use Tests\TestCase;

class PurchaseServiceTest extends TestCase
{
    use RefreshDatabase;

    private User $user;

    private Provider $provider;

    private Category $category;

    private Product $product;

    private Client $client;

    protected function setUp(): void
    {
        parent::setUp();

        $this->user = User::factory()->create();
        $this->client = Client::create([
            'document_type' => 'CC',
            'document_number' => '123456789',
            'name' => 'Cliente de prueba',
            'active' => true,
        ]);
        $this->category = Category::create(['nombre' => 'Categoría de prueba']);
        $this->provider = Provider::create([
            'document_type' => 'NIT',
            'document_number' => '900123456',
            'name' => 'Proveedor de prueba',
            'active' => true,
        ]);
        $this->product = Product::create([
            'nombre' => 'Producto de prueba',
            'stock' => 5,
            'precio' => 100,
            'proveedor_id' => $this->provider->id,
            'categoria_id' => $this->category->id,
        ]);
    }

    private function createPurchase(int $quantity = 5)
    {
        return app(PurchaseService::class)->register([
            'provider_id' => $this->provider->id,
            'purchase_date' => now()->toDateString(),
            'items' => [
                [
                    'product_id' => $this->product->id,
                    'quantity' => $quantity,
                    'unit_cost' => 80,
                ],
            ],
        ], $this->user->id);
    }

    public function test_partial_receipt_keeps_order_partial_and_increases_stock(): void
    {
        $purchase = $this->createPurchase();
        $detail = $purchase->details()->first();

        app(PurchaseService::class)->receive($purchase, [
            $detail->id => 2,
        ]);

        $this->assertSame('parcial', $purchase->fresh()->status);
        $this->assertSame(7, $this->product->fresh()->stock);
    }

    public function test_receiving_more_than_pending_throws_validation_exception(): void
    {
        $purchase = $this->createPurchase();
        $detail = $purchase->details()->first();

        $this->expectException(ValidationException::class);

        app(PurchaseService::class)->receive($purchase, [
            $detail->id => 6,
        ]);
    }

    public function test_receipt_with_all_zero_quantities_throws_validation_exception(): void
    {
        $purchase = $this->createPurchase();
        $detail = $purchase->details()->first();

        $this->expectException(ValidationException::class);

        app(PurchaseService::class)->receive($purchase, [
            $detail->id => 0,
        ]);
    }

    public function test_cancelling_order_with_received_merchandise_throws_validation_exception(): void
    {
        $purchase = $this->createPurchase();
        $detail = $purchase->details()->first();
        $purchase = app(PurchaseService::class)->receive($purchase, [
            $detail->id => 1,
        ]);
        $this->assertSame('parcial', $purchase->status);

        $this->expectException(ValidationException::class);

        app(PurchaseService::class)->cancel($purchase);
    }

    public function test_receipt_that_completes_order_marks_it_received(): void
    {
        $purchase = $this->createPurchase();
        $detail = $purchase->details()->first();

        app(PurchaseService::class)->receive($purchase, [
            $detail->id => 5,
        ]);

        $this->assertSame('recibida', $purchase->fresh()->status);
        $this->assertSame(10, $this->product->fresh()->stock);
    }

    public function test_cancelling_sale_twice_fails(): void
    {
        $sale = app(SaleService::class)->register([
            'client_id' => $this->client->id,
            'sale_date' => now()->toDateString(),
            'items' => [
                ['product_id' => $this->product->id, 'quantity' => 1],
            ],
        ], $this->user->id);

        app(SaleService::class)->cancel($sale);

        $this->expectException(ValidationException::class);

        app(SaleService::class)->cancel($sale);
    }
}
