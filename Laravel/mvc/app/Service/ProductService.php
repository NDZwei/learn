<?php

namespace App\Service;

use App\Http\Resources\ProductResource;
use App\Repository\ProductRepository;

class ProductService {
    private $repository;

    public function __construct(ProductRepository $repository)
    {
        $this->repository = $repository;
    }

    public function paging(array $request)
    {
        $data = $this->repository->paging($request);
        $data['contents'] = ProductResource::collection($data['contents']);
        return $data;
    }

    public function saveOrUpdate(array $input) {
        return $this->repository->saveOrUpdate($input);
    }
};
