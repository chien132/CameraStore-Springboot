package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.*;
import com.chien.camerastore.service.FileUploadService;
import com.chien.camerastore.service.SessionService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import java.util.Collections;
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
    @Autowired
    private CartItemDAO cartItemDAO;

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAll();
    }

//    @ModelAttribute("products")
//    public List<Product> products() {
//        return productDAO.findAll();
//    }

    @ModelAttribute("cartitems")
    public List<CartItem> cartItems() {
        Account curAccount = session.get("curaccount");
        if (curAccount != null)
            return cartItemDAO.findAllByAccount_Id(curAccount.getId());
        else return Collections.emptyList();
    }

    @ModelAttribute("cartcount")
    public int cartCount() {
        Account curAccount = session.get("curaccount");
        int size = 0;
        if (curAccount != null) {
            List<CartItem> list = cartItemDAO.findAllByAccount_Id(curAccount.getId());
            for (CartItem i : list) {
                size += i.getAmount();
            }
        }
        return size;
    }

    @ModelAttribute("cartcountmoney")
    public int cartCountMoney() {
        Account curAccount = session.get("curaccount");
        int money = 0;
        if (curAccount != null) {
            List<CartItem> list = cartItemDAO.findAllByAccount_Id(curAccount.getId());
            for (CartItem i : list) {
                money += i.getAmount() * i.getProduct().getPrice() * (100 - i.getProduct().getDiscount()) / 100;
            }
        }
        return money;
    }

    @RequestMapping("")
    public String root() {
        return "redirect:/index";
    }

    @RequestMapping("index")
    public String index(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                        @RequestParam(name = "size", required = false, defaultValue = "12") Integer size,
                        @RequestParam(name = "sort", required = false, defaultValue = "ASC") String sort,
                        @RequestParam(name = "category", required = false, defaultValue = "none") String category,
                        @RequestParam(name = "brand", required = false, defaultValue = "none") String brand) {
        System.out.println(brand);
        System.out.println(category);
        System.out.println(sort);
        Sort sortable = null;
        if (sort.equals("ASC")) {
            sortable = Sort.by("id").ascending();
        }
        if (sort.equals("DESC")) {
            sortable = Sort.by("id").descending();
        }
        Pageable pageable = PageRequest.of(page, size, sortable);
        Page<Product> productPage;
        if (!brand.equals("none") && category.equals("none")) {
            productPage = productDAO.findByBrandId(Integer.parseInt(brand), pageable);
            model.addAttribute("brand", brand);
        } else if (brand.equals("none") && !category.equals("none")) {
            productPage = productDAO.findByCategoryId(Integer.parseInt(category), pageable);
            model.addAttribute("category", category);
        } else if (!brand.equals("none") && !category.equals("none")) {
            productPage = productDAO.findByBrandIdAndCategoryId(Integer.parseInt(brand), Integer.parseInt(category), pageable);
            model.addAttribute("brand", brand);
            model.addAttribute("category", category);
        } else {
            productPage = productDAO.findProducts(pageable);
        }
        model.addAttribute("products", productPage);
        model.addAttribute("sort", sort);

        return "index";
    }

    @RequestMapping("cart/view")
    public String viewCart() {
        return "cart";
    }


//    @PostMapping("uploadimg")
//    public String uploadimg(@RequestParam("image")MultipartFile image) throws IOException{
//        String filename= StringUtils.cleanPath(image.getOriginalFilename());
//        String uploadDir="src/main/webapp/resources/images/product/"+"u3";
//        FileUploadService.saveFile(uploadDir, filename, image);
//        return ("redirect:/index");
//    }
}
