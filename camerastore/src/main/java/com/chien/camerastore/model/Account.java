package com.chien.camerastore.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table
public class Account implements Serializable {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "Username không được trống!")
    private String username;
    @NotBlank(message = "Mật khẩu không được trống!")
    private String password;
    private String email;
    private String fullname;
    private String photo;
    private String phone;
    @NotNull
    private boolean admin;

@OneToMany(mappedBy = "account")
    private List<Order> orders;
}
