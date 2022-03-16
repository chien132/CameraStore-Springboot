package com.chien.camerastore.dao;

import com.chien.camerastore.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface CategoryDAO extends JpaRepository<Category, Integer> {
    Category findById(int id);

    List<Category> findAllByOrderByNameAsc();

//    List<Category> findAll();
//    Category deleteById(int id);
}
