package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.Brand;
import com.chien.camerastore.model.Category;
import com.chien.camerastore.model.Product;
import com.chien.camerastore.service.FileUploadService;
import com.chien.camerastore.service.SessionService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;

@Controller
@Transactional
public class HomeController {
    @Autowired
    private SessionFactory factory;
    @Autowired
    private SessionService session;
    @Autowired
    private ServletContext context;
    @Autowired
    private AccountDAO accountDAO;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private BrandDAO brandDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAll();
    }

    @ModelAttribute("products")
    public List<Product> products() {
        return productDAO.findAll();
    }

    @RequestMapping("")
    public String root() {
        return "redirect:/index";
    }

    @RequestMapping("index")
    public String index() {
        return "index";
    }


//    @PostMapping("uploadimg")
//    public String uploadimg(@RequestParam("image")MultipartFile image) throws IOException{
//        String filename= StringUtils.cleanPath(image.getOriginalFilename());
//        String uploadDir="src/main/webapp/resources/images/product/"+"u3";
//        FileUploadService.saveFile(uploadDir, filename, image);
//        return ("redirect:/index");
//    }
}
