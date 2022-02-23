package com.chien.camerastore.dao;

import com.chien.camerastore.model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {
    List<OrderDetail> findAllByOrder_Id(int id);
}
