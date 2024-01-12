package com.ndz.api.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

/*
    author: NMDuc
    created_at: 1/11/2024
*/
@Getter
@Setter
@NoArgsConstructor
public class BaseResponse implements Serializable {
    private String status;
    private String message;
    private Object data;

    public BaseResponse(String status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }
}
