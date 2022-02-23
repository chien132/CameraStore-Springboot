package com.chien.camerastore.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
@Table
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotNull(message = "Số lượng không được bỏ trống!")
    private int amount;

    @ManyToOne @JoinColumn(name = "order_id")
    private Order order;
    @ManyToOne @JoinColumn(name = "product_id")
    private Product product;
}
