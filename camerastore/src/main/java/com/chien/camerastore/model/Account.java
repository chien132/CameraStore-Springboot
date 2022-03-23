package com.chien.camerastore.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Entity
@Table
public class Account implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "Username không được trống!")
    @Column(unique = true)
    private String username;
    @NotBlank(message = "Mật khẩu không được trống!")
    private String password;
    private String email;
    private String fullname;
    private String photo;
    private String phone;
    private String address;
    @NotNull
    private boolean admin;
    private String passwordreset;

    @OneToMany(mappedBy = "account")
    private List<Order> orders;

    @OneToMany(mappedBy = "account")
//    @JoinColumns({
//            @JoinColumn(name = "account_id",referencedColumnName = "id"),
//            @JoinColumn(name = "product_id",referencedColumnName = "id")
//    })
    List<CartItem> cartItem;

    public int getOrderSize() {
        int size = 0;
        for (Order i : orders) {
            size++;
        }
        return size;
    }
}
