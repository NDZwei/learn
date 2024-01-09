<?php

namespace App\Repository;

use App\Http\Resources\ProductResource;
use App\Models\Product;

class ProductRepository {
    private $model;

    public function __construct(Product $model)
    {
        $this->model = $model;
    }

    public function paging(array $request)
    {
        $pageIndex = $request['page_index'] ?? 1;
        $pageSize = $request['page_size'] ?? 10;
        $query = $this->model;
        $buildQuery = $query->orderBy('created_at', 'asc')
                            ->paginate($pageSize, ['*'], 'page', $pageIndex);
        $pagedData = [
            'contents' => ProductResource::collection($buildQuery->items()),
            'totalPages' => $buildQuery->lastPage(),
            'totalElements' => $buildQuery->total(),
        ];
        return $pagedData;
    }
};