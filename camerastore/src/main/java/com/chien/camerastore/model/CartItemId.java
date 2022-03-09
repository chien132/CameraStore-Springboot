package com.chien.camerastore.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CartItemId implements Serializable {
    @Column(name = "accountid")
    private int accountid;

    @Column(name = "productid")
    private int productid;

    public CartItemId() {
    }

    public CartItemId(int accountid, int productid) {
        this.accountid = accountid;
        this.productid = productid;
    }

    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    @Override
    public boolean equals(Object o) {
//        return super.equals(obj);
        if (this == o) return true;
        if (!(o instanceof CartItemId)) return false;
        CartItemId that = (CartItemId) o;
        return Objects.equals(getAccountid(), that.getAccountid()) &&
                Objects.equals(getProductid(), that.getProductid());
    }
}
