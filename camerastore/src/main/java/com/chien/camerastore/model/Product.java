package com.chien.camerastore.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@Entity
@Table
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "Tên sản phẩm không được để trống!")
    private String name;
    @Min(0)
    private long price;
    private String description;
    private String image;
    private int discount;
    @NotBlank
    @Min(0)
    private int quantity;

    @ManyToOne @JoinColumn(name = "cate_id")
    private Category category;
    @ManyToOne @JoinColumn(name = "brand_id")
    private Brand brand;


}
