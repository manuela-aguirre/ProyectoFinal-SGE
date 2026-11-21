<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Product;
use App\Models\Provider;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Product>
 */
class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'nombre' => fake()->words(3, true),
            'descripcion' => fake()->sentence(),
            'stock' => fake()->numberBetween(1, 100),
            'precio' => fake()->randomFloat(2, 1000, 100000),
            'codigo' => fake()->unique()->bothify('PROD-####'),
            'proveedor_id' => Provider::factory(),
            'categoria_id' => fn () => Category::create([
                'nombre' => fake()->unique()->word(),
            ])->id,
        ];
    }
}
