<?php

namespace App\Service;

use App\Repositories\FoodRepository;

class FoodService
{
    private $repository;

    public function __construct(FoodRepository $repository)
    {
        $this->repository = $repository;
    }

    public function getAll()
    {
        return $this->repository->getAll();
    }

    public function paging(array $request)
    {
        return $this->repository->paging($request);
    }

    public function getById(int $id)
    {
        return $this->repository->getById($id);
    }

    public function saveOrUpdate(array $request)
    {
        return $this->repository->saveOrUpdate($request);
    }

    public function delete(int $id)
    {
        return $this->repository->delete($id);
    }
}
