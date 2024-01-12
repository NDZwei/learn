package com.ndz.api.service;

/*
    author: NMDuc
    created_at: 1/11/2024
*/

import com.ndz.api.dto.BaseResponse;
import com.ndz.api.entity.Administrative;
import com.ndz.api.repository.AdministrativeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service
public class AdministrativeService extends BaseService {
    @Resource
    private AdministrativeRepository repository;

    public BaseResponse getAllProvince() {
        List<Administrative> results = repository.getAllProvince();
        return getResponse200(results);
    }

    public BaseResponse getByParentId(Long parentId) {
        if(parentId == null) {
            return getResponse500("Id null");
        }
        List<Administrative> results = repository.getByParentId(parentId);
        return getResponse200(results);
    }

    public BaseResponse getById(Long id) {
        if(id == null) {
            return getResponse500("Id null");
        }
        Administrative administrative = repository.findById(id).orElse(null);
        if(administrative == null) {
            return getResponse200(null);
        }
        return getResponse200(new Administrative(administrative, true));
    }

    public BaseResponse save(Administrative request) {
        if(request == null) {
            return getResponse500("Administrative null");
        }
        Administrative administrative = null;
        if(request.getId() != null) {
            administrative = repository.findById(request.getId()).orElse(null);
        }
        if(administrative == null) {
            administrative = new Administrative();
        }
        administrative.setCode(request.getCode());
        administrative.setName(request.getName());
        administrative.setLevel(request.getLevel());
        Administrative parent = null;
        if(request.getParentId() != null) {
            parent = repository.findById(request.getParentId()).orElse(null);
        }
        administrative.setParent(parent);
        administrative = repository.save(administrative);
        return getResponse200(new Administrative(administrative, false));
    }

    public Boolean delete(Long id) {
        if(id != null) {
            Administrative administrative = repository.findById(id).orElse(null);
            if (administrative != null) {
                repository.deleteById(id);
                return true;
            }
            return false;
        }
        return false;
    }


}
