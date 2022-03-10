package com.chien.camerastore.dao;

import com.chien.camerastore.model.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

@Transactional
public interface BrandDAO extends JpaRepository<Brand, Integer> {
    Brand findById(int id);
    Brand findByNameLike(String name);
//    Brand deleteById(int id);
}
