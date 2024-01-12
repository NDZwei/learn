package com.ndz.api.repository;

import com.ndz.api.entity.Administrative;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
    author: NMDuc
    created_at: 1/11/2024
*/
@Repository
public interface AdministrativeRepository extends JpaRepository<Administrative, Long> {
    @Query(value = "select e from Administrative e where e.parent is null")
    List<Administrative> getAllProvince();

    @Query(value = "select e from Administrative e where e.parentId = :parentId")
    List<Administrative> getByParentId(Long parentId);
}
