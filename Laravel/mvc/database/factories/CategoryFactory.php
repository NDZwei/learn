<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;


class CategoryFactory extends Factory
{
    protected $model = Category::class;

    public function definition()
    {
        return [
            'code' => $this->faker->unique()->text(5),
            'name' => $this->faker->text(10)
        ];
    }
}
