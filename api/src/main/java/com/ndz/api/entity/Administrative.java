package com.ndz.api.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.util.CollectionUtils;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/*
    author: NMDuc
    created_at: 1/11/2024
*/
@Entity
@Table(name = "tbl_administrative")
@NoArgsConstructor
@Getter
@Setter
public class Administrative {
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "code", unique = true)
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "level")
    private Integer level;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Administrative parent;

    @Column(name = "parent_id", insertable = false, updatable = false)
    private Long parentId;

    @OneToMany(mappedBy = "parent", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("name asc")
    private List<Administrative> childrens = new ArrayList<>();

    public Administrative(Administrative entity, boolean getChildren) {
        this.id = entity.getId();
        this.code = entity.getCode();
        this.name = entity.getName();
        this.level = entity.getLevel();
        if(entity.getParent() != null) {
            this.parent = new Administrative(entity.getParent(), false);
            this.parentId = entity.getParent().getId();
        }
        if(getChildren && !CollectionUtils.isEmpty(entity.getChildrens())) {
            entity.getChildrens().forEach(child -> {
                this.childrens.add(new Administrative(child, false));
            });
        }

    }
}
