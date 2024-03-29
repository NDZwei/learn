<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('welcome');
});
Route::resource('/categories', CategoryController::class);
// Route::prefix('/categories')->group(function () {
//     Route::get('/all', [CategoryController::class, 'all'])->name('categories.all');
// });
Route::resource('/products', ProductController::class);
