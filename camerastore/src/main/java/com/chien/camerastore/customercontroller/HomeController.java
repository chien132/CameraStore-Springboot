package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.*;
import com.chien.camerastore.service.FileUploadService;
import com.chien.camerastore.service.SessionService;
import com.chien.camerastore.service.Utils;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;
import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.List;

@Controller
@Transactional
public class HomeController {
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
    private CartItemDAO cartItemDAO;

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAllByOrderByNameAsc();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAllByOrderByNameAsc();
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
    public String index(Model model, RedirectAttributes re, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                        @RequestParam(name = "search", required = false, defaultValue = "-666") String search,
                        @RequestParam(name = "size", required = false, defaultValue = "8") Integer size,
                        @RequestParam(name = "sort", required = false, defaultValue = "default") String sort,
                        @RequestParam(name = "category", required = false, defaultValue = "none") String category,
                        @RequestParam(name = "brand", required = false, defaultValue = "none") String brand) {
//        System.out.println("\n" + brand);
//        System.out.println(category);
//        System.out.println(sort);
//        System.out.println(page);
//        System.out.println(search);

        Page<Product> productPage;
        search = search.trim();
        if (!search.equals("-666") && !search.isBlank()) {
            Pageable pageable = PageRequest.of(page, size);
            productPage = productDAO.findByNameLike(search, pageable);
        } else {
            Sort sortable = null;
            if (sort.equals("default")) {
                sortable = Sort.by("id").descending();
            } else if (sort.equals("priceASC")) {
                sortable = Sort.by("price").ascending();
            } else if (sort.equals("priceDESC")) {
                sortable = Sort.by("price").descending();
            } else if (sort.equals("discountDESC")) {
                sortable = Sort.by("discount").descending();
            }
            Pageable pageable = PageRequest.of(page, size, sortable);
            if (!brand.equals("none") && category.equals("none")) {
                productPage = productDAO.findByBrandId(Integer.parseInt(brand), pageable);
            } else if (brand.equals("none") && !category.equals("none")) {
                productPage = productDAO.findByCategoryId(Integer.parseInt(category), pageable);
            } else if (!brand.equals("none") && !category.equals("none")) {
                productPage = productDAO.findByBrandIdAndCategoryId(Integer.parseInt(brand), Integer.parseInt(category), pageable);
            } else {
                productPage = productDAO.findProducts(pageable);
            }
        }
        if (productPage.getTotalElements() == 0) {
            re.addFlashAttribute("message", "Không tìm thấy sản phẩm nào");
            return "redirect:/index";
        }
        model.addAttribute("products", productPage);
        model.addAttribute("sort", sort);
        model.addAttribute("category", category);
        model.addAttribute("brand", brand);
        model.addAttribute("size", size);
        model.addAttribute("search", search);
        return "index";
    }


    @RequestMapping("account")
    public String viewaccount() {
        return "accountview";
    }

    @PostMapping("account/editusername")
    public String editusername(@RequestParam("name") String username, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (!Utils.isValidUsername(username) || username.isBlank()) {
            re.addFlashAttribute("message", "Username không đúng định dạng!");
        } else if (accountDAO.findByUsername(username) != null) {
            re.addFlashAttribute("message", "Tên đăng nhập này đã được dùng, hãy chọn tên khác!");
        } else {
            account.setUsername(username.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/account";
    }

    @PostMapping("account/editfullname")
    public String editfullname(@RequestParam("name") String fullname, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (fullname.isBlank()) {
            re.addFlashAttribute("message", "Tên không đúng định dạng!");
        } else {
            account.setFullname(fullname.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/account";
    }

    @PostMapping("account/editphone")
    public String editphone(@RequestParam("name") String phone, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (phone.isBlank() || !Utils.isValidPhoneNumber(phone)) {
            re.addFlashAttribute("message", "Số điện thoại không đúng định dạng!");
        } else {
            account.setPhone(phone.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/account";
    }

    @PostMapping("account/editemail")
    public String editemail(@RequestParam("name") String email, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (email.isBlank() || !Utils.isValidEmail(email)) {
            re.addFlashAttribute("message", "Email không đúng định dạng!");
        } else {
            account.setEmail(email.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/account";
    }

    @PostMapping("account/editaddress")
    public String editaddress(@RequestParam("name") String address, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (address.isBlank()) {
            re.addFlashAttribute("message", "Địa chỉ không đúng định dạng!");
        } else {
            account.setAddress(address.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/account";
    }

    @PostMapping("account/editpassword")
    public String editpassword(@RequestParam("name") String password, RedirectAttributes re) throws NoSuchAlgorithmException {
        Account account = session.get("curaccount");
        if (password.isBlank()) {
            re.addFlashAttribute("message", "Mật khẩu không đúng định dạng!");
        } else {
            //Ma hoa mat khau bang SHA-256
            password = password.trim();
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(password.getBytes());
            account.setPassword(DatatypeConverter.printHexBinary(messageDigest).toUpperCase());

            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/account";
    }

    @PostMapping("account/editavatar")
    public String editpassword(@RequestParam("image") MultipartFile photo, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (photo.getOriginalFilename().isEmpty()) {
            re.addFlashAttribute("message", "Hãy chọn một ảnh!");
        } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
            re.addFlashAttribute("message", "File ảnh không đúng định dạng !");
        } else {
            try {
                String filename = StringUtils.cleanPath(account.getId() + photo.getOriginalFilename().replaceAll("\\s", ""));
                String uploadDir = "src/main/webapp/resources/images/avatar/";
                FileUploadService.saveFile(uploadDir, filename, photo);
                if (!account.getPhoto().equals("resources/images/avatar/user-default.png")) {
                    File image = new File(
                            context.getRealPath(account.getPhoto()));
                    if (image.delete()) {
                        System.out.println("Deleted the file: " + image.getName());
                    } else {
                        System.out.println("Failed to delete the file.");
                    }
                }
                account.setPhoto("resources/images/avatar/" + filename);
                accountDAO.save(account);
                re.addFlashAttribute("message", "Cập nhật thành công!");
            } catch (Exception e) {
                re.addFlashAttribute("message", "Save file error: " + e);
                return "redirect:/admin/account/edit/" + account.getId();
            }
        }
        return "redirect:/account";
    }
}
