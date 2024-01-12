package com.ndz.api.controller;

import com.ndz.api.dto.BaseResponse;
import com.ndz.api.entity.Administrative;
import com.ndz.api.service.AdministrativeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/*
    author: NMDuc
    created_at: 1/11/2024
*/
@RestController
@RequestMapping(value = "/administrative")
public class AdministrativeController {
    @Resource
    private AdministrativeService service;

    @GetMapping(value = "/all-province")
    public BaseResponse getAllProvince() {
        return service.getAllProvince();
    }

    @GetMapping(value = "/get-by-parent/{parentId}")
    public BaseResponse getByParentId(@PathVariable("parentId") Long parentId) {
        return service.getByParentId(parentId);
    }

    @GetMapping(value = "/{id}")
    public BaseResponse getById(@PathVariable("id") Long id) {
        return service.getById(id);
    }

    @PostMapping(value = "/save")
    public BaseResponse save(@RequestBody Administrative request) {
        return service.save(request);
    }

    @DeleteMapping(value = "/{id}")
    public Boolean delete(@PathVariable("id") Long id) {
        return service.delete(id);
    }


}
