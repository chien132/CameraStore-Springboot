package com.chien.camerastore.dao;

import com.chien.camerastore.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface ProductDAO extends JpaRepository<Product, Integer> {
    List<Product> findAllByCategoryId(int id);

    Product findById(int id);

    Product deleteById(int id);

    Product findAllById(int id);

    @Query("SELECT e FROM Product e")
    Page<Product> findProducts(Pageable pageable);

    //       @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
    Page<Product> findByNameLike(String keywords, Pageable pageable);

    Page<Product> findByCategoryId(int id, Pageable pageable);

    Page<Product> findByBrandId(int id,Pageable pageable);

    Page<Product> findByBrandIdAndCategoryId(int brand, int cate, Pageable pageable);

    Page<Product> findByPriceBetween(double a, double b, Pageable pageable);
//       Page<Product> allProductsSortedByName = productRepository.findAll(Sort.by("name"));
//@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
//        + " FROM Product o "
//        + " GROUP BY o.category"
//        + " ORDER BY sum(o.price) DESC")
//List<Report> getInventoryByCategory();
//       @Query(value = "  Select TOP(10) * from products where discount >0" , nativeQuery = true)
//       List<Product> selectTop10();
}
