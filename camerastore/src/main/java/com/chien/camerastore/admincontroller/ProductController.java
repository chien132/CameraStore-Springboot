package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.BrandDAO;
import com.chien.camerastore.dao.CategoryDAO;
import com.chien.camerastore.dao.ProductDAO;
import com.chien.camerastore.model.Brand;
import com.chien.camerastore.model.Category;
import com.chien.camerastore.model.Product;
import com.chien.camerastore.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/admin/product/")
public class ProductController {
    @Autowired
    private SessionService session;
    @Autowired
    private ServletContext context;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private BrandDAO brandDAO;
    @Autowired
    private CategoryDAO categoryDAO;

    @ModelAttribute("products")
    public List<Product> products() {
        return productDAO.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAll();
    }

    @RequestMapping("view")
    public String view() {
        return "admin/producttable";
    }

    @GetMapping("add")
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("action", "add");
        return "admin/productform";
    }

    @GetMapping("edit/{id}")
    public String addProduct(Model model, @PathVariable("id") int id) {
        model.addAttribute("product", productDAO.getById(id));
        model.addAttribute("action", "edit");
        return "admin/productform";
    }
}
