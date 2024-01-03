<?php

namespace App\Repositories;

use App\Models\Food;
use Exception;
use Illuminate\Support\Facades\DB;

class FoodRepository
{
    private $model;

    public function __construct(Food $model)
    {
        $this->model = $model;
    }

    public function getAll()
    {
        return $this->model->all();
    }

    public function paging(array $request)
    {
        $pageIndex = $request['page_index'] ?? 1;
        $pageSize = $request['page_size'] ?? 10;
        $data = $this->model;
        $queryData = $data?->paginate($pageSize, ['*'], 'page', $pageIndex);

        return [
            'contents' => $queryData->items(),
            'totalPages' => $queryData->lastPage(),
            'totalElements' => $queryData->total(),
        ];
    }

    public function getById(int $id)
    {
        return $this->model->where('id', $id)->first();
    }

    public function saveOrUpdate(array $request)
    {
        try {
            DB::beginTransaction();
            if (isset($request['id'])) {
                $data = $this->model->find($request['id']);
                if ($data) {
                    $data = $data->update($request);
                    DB::commit();
                    return $data;
                }
            } else {
                $data = $this->model->create($request);
                DB::commit();
                return $data;
            }
        } catch (Exception $e) {
            DB::rollBack();
            throw $e->getMessage();
        }
    }

    public function delete(int $id)
    {
        try {
            DB::beginTransaction();
            $data = $this->getById($id);
            $data->delete();
            DB::commit();
            return 'Item deleted successfully';
        } catch (Exception $e) {
            DB::rollBack();
            throw $e->getMessage();
        }
    }
}
