<?php

namespace Tests\Feature;

use App\Models\Product;
use App\Models\User;
use App\Notifications\LowStockNotification;
use Tests\TestCase;

class LowStockNotificationTest extends TestCase
{
    public function test_it_includes_the_product_name_in_the_notification_message(): void
    {
        $product = new Product([
            'nombre' => 'Diadema HyperX',
            'stock' => 5,
        ]);
        $product->id = 1;
        $notification = new LowStockNotification($product);

        $this->assertSame(
            '«Diadema HyperX» quedó con 5 unidades.',
            $notification->toArray(new User)['message'],
        );
    }
}
