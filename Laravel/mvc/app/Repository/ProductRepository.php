<?php

namespace App\Repository;

use App\Http\Resources\ProductResource;
use App\Models\Product;
use Exception;

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
        $buildQuery = $query->orderBy('created_at', 'desc')
                            ->paginate($pageSize, ['*'], 'page', $pageIndex);
        $pagedData = [
            'contents' => ProductResource::collection($buildQuery->items()),
            'totalPages' => $buildQuery->lastPage(),
            'totalElements' => $buildQuery->total(),
        ];
        return $pagedData;
    }

    public function saveOrUpdate(array $input)
    {
        try {
            if (isset($input['id'])) {
                $modelById = $this->model->find($input['id']);
                if ($modelById) {
                    return $modelById->update($input);
                }
            } else {
                return $this->model->create($input);
            }
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
};
