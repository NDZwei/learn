<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;


class ProductFactory extends Factory
{

    protected $model = Product::class;

    public function definition()
    {
        return [
            'code' => $this->faker->unique()->text(5),
            'name' => $this->faker->text(10),
            'quantity' => $this->faker->randomNumber(2),
            'price' => $this->faker->randomFloat(2, 10, 1000),
            'expiry_date' => $this->faker->date(),
        ];
    }
}
