package com.chien.camerastore.dao;

import com.chien.camerastore.model.OrderDetail;
import com.chien.camerastore.model.OrderDetailId;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface OrderDetailDAO extends JpaRepository<OrderDetail, OrderDetailId> {
    List<OrderDetail> findAllByOrder_Id(int id);
}
