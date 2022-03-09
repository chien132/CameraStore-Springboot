package com.chien.camerastore.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String address;
    @NotNull
    @Temporal(TemporalType.DATE)
    Date createdate = new Date();
    @NotNull
    private boolean done;

    @ManyToOne @JoinColumn(name = "account_id")
    private Account account;

    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;

}
