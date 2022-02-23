package com.chien.camerastore.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Data
@Entity
@Table
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "Tên thương hiệu không được để trống")
    private String name;
    //    @OneToMany(cascade = CascadeType.ALL , fetch = FetchType.LAZY)
    @OneToMany(mappedBy = "brand")
    private List<Product> products;
}
