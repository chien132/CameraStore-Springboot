package com.chien.camerastore.dao;

import com.chien.camerastore.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface OrderDAO extends JpaRepository<Order,Integer> {
    List<Order> findAllByAccount_Id(int id);
    List<Order> findAllById(int id);

//    @Query(value = "Select sum(price)  from order where  Year(createDate) like '2022' ",nativeQuery = true)
//    Float selectTotals();
//    @Query(value = "Select sum(price)  from order where  Month(createDate) =5 ",nativeQuery = true)
//    Float selectTotalsMonth();
}
