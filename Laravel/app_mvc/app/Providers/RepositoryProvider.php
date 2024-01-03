<?php

namespace App\Providers;

use App\Repositories\FoodRepository;
use Illuminate\Support\ServiceProvider;

class RepositoryProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(FoodRepository::class);
    }
}
