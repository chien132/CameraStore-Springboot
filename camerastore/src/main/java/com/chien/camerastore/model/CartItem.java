package com.chien.camerastore.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//import javax.persistence.*;
//import java.io.Serializable;

//@Entity
//@Table(name = "CartItem")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
//    @EmbeddedId
//    private CartItemId id;
//    private int amount;
//
//    @ManyToOne
//    @JoinColumn(name = "accountid", referencedColumnName = "id",insertable = false, updatable = false)
//    private Account account;
//
//    @ManyToOne
//    @JoinColumn(name = "productid", referencedColumnName = "id",insertable = false, updatable = false)
//    private Product product;

    private int id;
    //    private String name;
//    private String image;
//    private int quantity;
//    private double price;
//    private int discount;
    private Product product;
    private int amount;
}
