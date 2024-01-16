<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{

    public function run()
    {
        $categories = Category::all();
        Product::factory(35)->create([
            'category_id' => function () use ($categories) {
                return $categories->random()->id;
            },
        ]);
    }
}
