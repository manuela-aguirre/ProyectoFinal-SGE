<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            RolePermissionSeeder::class,
            TestUserSeeder::class,
            CategoriaSeeder::class,
            ProviderSeeder::class,
            ProductSeeder::class,
            ClientSeeder::class,
            CompraSeeder::class,
            SaleSeeder::class,
        ]);
    }
}
