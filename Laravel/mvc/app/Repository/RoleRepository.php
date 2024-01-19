<?php

namespace App\Repository;

use App\Models\Role;

class RoleRepository {
    private $model;

    public function __construct(Role $model)
    {
        $this->model = $model;
    }

};
