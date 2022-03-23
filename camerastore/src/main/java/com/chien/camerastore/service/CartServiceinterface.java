package com.chien.camerastore.service;

import com.chien.camerastore.model.CartItem;

import java.util.Collection;

public interface CartServiceinterface {

    CartItem findById(int id);

    void add(CartItem item, int amount);

    void remove(int id);

    Collection<CartItem> getCartItems();

    void clear();

    void update(int id, int quantity);

    double getValue();

    int getCount();
}
