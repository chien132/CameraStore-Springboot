package com.chien.camerastore.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "CartItem")
@Getter
@Setter
public class CartItem implements Serializable {
    @EmbeddedId
    private CartItemId id;
    private int amount;

    @ManyToOne
    @JoinColumn(name = "accountid", referencedColumnName = "id",insertable = false, updatable = false)
    private Account account;

    @ManyToOne
    @JoinColumn(name = "productid", referencedColumnName = "id",insertable = false, updatable = false)
    private Product product;
}
