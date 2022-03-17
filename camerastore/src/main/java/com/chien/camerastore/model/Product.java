package com.chien.camerastore.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Getter
@Setter
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
    @Min(0)
    private int quantity;

    @ManyToOne
    @JoinColumn(name = "cate_id", referencedColumnName = "id")
    private Category category;
    @ManyToOne
    @JoinColumn(name = "brand_id", referencedColumnName = "id")
    private Brand brand;

    @OneToMany(mappedBy = "product")
    private List<CartItem> cartItems;

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;

    public int getSoldAmount() {
        int count = 0;
        for (OrderDetail i : orderDetails) {
            count += i.getAmount();
        }
        return count;
    }

    public boolean isChosen() {
        return cartItems.size() > 0;
    }

    public int getSoldInOrders(List<Order> orders) {
        int count = 0;
        for (Order o : orders) {
            for (OrderDetail d : o.getOrderDetails()) {
                if (d.getProduct().getId() == this.getId()) {
                    count += d.getAmount();
                }
            }
        }
        return count;
    }
}
