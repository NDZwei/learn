package com.ndz.api.dto;

import com.ndz.api.entity.Administrative;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/*
    author: NMDuc
    created_at: 1/19/2024
    github: https://github.com/NDZwei
*/
@Getter
@Setter
@NoArgsConstructor
public class AdministrativeDto {
    private Long id;
    private String code;
    private String name;
    private AdministrativeDto parent;
    private Long parentId;
    private List<AdministrativeDto> children;

    public AdministrativeDto(Administrative entity) {
        this.id = entity.getId();
        this.code = entity.getCode();
        this.name = entity.getName();
        if(entity.getParent() != null) {
            this.parentId = entity.getParentId();
            this.parent = new AdministrativeDto(entity.getParent());
        }
    }
}
