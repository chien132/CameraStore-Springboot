package com.chien.camerastore.model;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Objects;

public class OrderDetailId implements Serializable {
    @Column(name = "order_id")
    private int order_id;

    @Column(name = "product_id")
    private int product_id;

    public OrderDetailId() {
    }

    public OrderDetailId(int order_id, int product_id) {
        this.order_id = order_id;
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public boolean equals(Object o) {
//        return super.equals(obj);
        if (this == o) return true;
        if (!(o instanceof OrderDetailId)) return false;
        OrderDetailId that = (OrderDetailId) o;
        return Objects.equals(getOrder_id(), that.getOrder_id()) &&
                Objects.equals(getProduct_id(), that.getProduct_id());
    }
}
