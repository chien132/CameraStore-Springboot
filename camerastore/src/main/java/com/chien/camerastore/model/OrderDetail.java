package com.chien.camerastore.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity
@Table(name = "OrderDetail")
public class OrderDetail {
    @EmbeddedId
    private OrderDetailId id;

    @NotNull(message = "Số lượng không được bỏ trống!")
    private int amount;
    @NotNull
    private long price;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Product product;
}
