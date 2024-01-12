package com.ndz.api.service;

import com.ndz.api.dto.BaseResponse;
import org.springframework.http.HttpStatus;

/*
    author: NMDuc
    created_at: 1/11/2024
*/
public abstract class BaseService {
    protected BaseResponse getResponse200(Object data) {
        BaseResponse rs = new BaseResponse();
        rs.setStatus(String.valueOf(HttpStatus.OK.value()));
        rs.setMessage(HttpStatus.OK.name());
        rs.setData(data);
        return rs;
    }

    protected BaseResponse getResponse400(String message) {
        BaseResponse rs = new BaseResponse();
        rs.setStatus(String.valueOf(HttpStatus.BAD_REQUEST.value()));
        rs.setMessage(message);
        rs.setData(null);
        return rs;
    }

    protected BaseResponse getResponse500(String message) {
        BaseResponse rs = new BaseResponse();
        rs.setStatus(String.valueOf(HttpStatus.INTERNAL_SERVER_ERROR.value()));
        rs.setMessage(message);
        rs.setData(null);
        return rs;
    }
}
