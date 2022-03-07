package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.ProductDAO;
import com.chien.camerastore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminIndexController {

    @Autowired
    private ProductDAO productDAO;

    @ModelAttribute("products")
    public List<Product> products() {
        return productDAO.findAll();
    }

    @RequestMapping("index")
    public String index() {
        return "admin/index";
    }
}
