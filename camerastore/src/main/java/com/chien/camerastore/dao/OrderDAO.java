package com.chien.camerastore.dao;

import com.chien.camerastore.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Transactional
public interface OrderDAO extends JpaRepository<Order, Integer> {
    List<Order> findAllByAccount_Id(int id);

    List<Order> findAllById(int id);

    //    @Query(value = "from Order o where o.createdate BETWEEN :startDate AND :endDate")
//    public Page<Order> findAllBetweenDates(@Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);
    List<Order> findAllByCreatedateBetween(Date from, Date to);


//    @Query(value = "Select sum(price)  from order where  Year(createDate) like '2022' ",nativeQuery = true)
//    Float selectTotals();
//    @Query(value = "Select sum(price)  from order where  Month(createDate) =5 ",nativeQuery = true)
//    Float selectTotalsMonth();
}
