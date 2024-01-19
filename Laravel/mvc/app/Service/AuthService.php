<?php

namespace App\Service;

use App\Repository\RoleRepository;
use App\Repository\UserRepository;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthService {
    private $userRepository;
    private $roleRepository;

    public function __construct(UserRepository $userRepository,
                                RoleRepository $roleRepository)
    {
        $this->userRepository = $userRepository;
        $this->roleRepository = $roleRepository;
    }

    public function register(array $request) {
        try {
            DB::beginTransaction();
            $user = $this->userRepository->saveOrUpdateItem($request);
            $user->roles->attach(1, ['created_at' => now(), 'updated_at' => now()]);
            Auth::login($user);
            try {
                $user->sendMailVerifyAccount();
            } catch (Exception $e) {
                return "Can't send email verification";
            }
            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
        }
    }
};
