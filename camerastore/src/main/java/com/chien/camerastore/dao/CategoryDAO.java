package com.chien.camerastore.dao;

import com.chien.camerastore.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

@Transactional
public interface CategoryDAO extends JpaRepository<Category, Integer> {
    Category findById(int id);
//    Category deleteById(int id);
}
