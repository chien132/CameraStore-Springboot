package com.chien.camerastore.dao;

import com.chien.camerastore.model.CartItem;
import com.chien.camerastore.model.CartItemId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartItemDAO extends JpaRepository<CartItem, CartItemId> {
    List<CartItem> findAllByAccount_Id(int id);

    List<CartItem> findAllByProduct_Id(int id);

    List<CartItem> findAllById(CartItemId id);

    void deleteAllByAccount_Id(int id);

}
