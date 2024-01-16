<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Service\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    private $service;
    public function __construct(ProductService $service)
    {
        $this->service = $service;
    }

    public function index(Request $request)
    {
        $input = $request->all();
        $pagedData = $this->service->paging($input);
        $categories = Category::all();
        return view('products.index',
        [
            'pagedData' => $pagedData,
            'categories' => $categories
        ]);
    }

    public function create()
    {
        $categories = Category::all();
        return view('products.form',
        [
            'categories' => $categories,
            'readonly' => false,
        ]);
    }


    public function store(Request $request)
    {
        $this->service->saveOrUpdate($request->all());
        return redirect()->route('products.index')->with('success', 'Product created successfully');
    }


    public function show($id)
    {
        $product = Product::findOrFail($id);
        $categories = Category::all();
        return view('products.form', [
            'product' => $product,
            'categories' => $categories,
            'readonly' => true,
        ]);
    }


    public function edit($id)
    {
        $product = Product::findOrFail($id);
        $categories = Category::all();
        return view('products.form', [
            'product' => $product,
            'categories' => $categories,
            'readonly' => false,
        ]);
    }

    public function update(Request $request)
    {
        $this->service->saveOrUpdate($request->all());
        return redirect()->route('products.index')->with('success', 'Product updated successfully');
    }


    public function destroy($id)
    {
        //
    }
}
