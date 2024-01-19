<?php

namespace App\Repository;

use App\Models\User;
use Exception;

class UserRepository {
    private $model;

    public function __construct(User $model)
    {
        $this->model = $model;
    }

    public function saveOrUpdateItem(array $request)
    {
        try {
            $model = null;
            if (isset($request['id'])) {
                $model = $this->model->find($request['id']);
                if($model != null) {
                    $model->update($request);
                }
            } else {
                $model = $this->model->create($request);
            }
            return $model;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }

};
