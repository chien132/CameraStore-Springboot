package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.Brand;
import com.chien.camerastore.model.Category;
import com.chien.camerastore.service.SessionService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import java.util.List;

@Controller
@Transactional
public class HomeController {
    @Autowired
    SessionFactory factory;
    @Autowired
    SessionService session;
    @Autowired
    ServletContext context;
    @Autowired
    AccountDAO accountDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    BrandDAO brandDAO;
    @Autowired
    OrderDAO orderDAO;
    @Autowired
    OrderDetailDAO orderDetailDAO;

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAll();
    }

    @RequestMapping("index")
    public String index(){
        return "index";
    }
}
