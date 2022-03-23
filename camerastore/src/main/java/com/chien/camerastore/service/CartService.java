package com.chien.camerastore.service;

import com.chien.camerastore.model.CartItem;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
@SessionScope
public class CartService implements CartServiceinterface {

    private Map<Integer, CartItem> map = new HashMap<>();

    @Override
    public CartItem findById(int id) {
        CartItem existed = map.get(id);
        if (existed != null) {
            return existed;
        } else
            return null;
    }

    @Override
    public void add(CartItem item, int amount) {
        CartItem existed = map.get(item.getId());
        if (existed != null) {
            existed.setAmount(item.getAmount() + amount);
        } else
            map.put((int) item.getId(), item);
    }

    @Override
    public void remove(int id) {
        map.remove(id);
    }

    @Override
    public Collection<CartItem> getCartItems() {
        return map.values();
    }

    @Override
    public void clear() {
        map.clear();
    }

    @Override
    public void update(int id, int amount) {
        CartItem item = map.get(id);
        item.setAmount(amount);
        if (item.getAmount() <= 0) {
            map.remove(id);
        }
    }

    @Override
    public double getValue() {
        return map.values().stream().mapToDouble(item -> item.getProduct().getPrice() * item.getAmount() * ((100 - item.getProduct().getDiscount()) * 0.01)).sum();
        //  map.values().stream().mapToDouble(item->item.getQuantity() * item.getPrice()).sum();
    }

    @Override
    public int getCount() {
//        if(map.isEmpty()){
//            return 0;
//        }
        return map.values().size();
    }
}


