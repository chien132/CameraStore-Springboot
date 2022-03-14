package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.AccountDAO;
import com.chien.camerastore.dao.BrandDAO;
import com.chien.camerastore.dao.CategoryDAO;
import com.chien.camerastore.model.Account;
import com.chien.camerastore.model.Brand;
import com.chien.camerastore.model.Category;
import com.chien.camerastore.service.SessionService;
import com.chien.camerastore.service.Utils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Transactional
@Controller
public class AccountController {
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

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAll();
    }

    @GetMapping("login")
    public String login(Model model) {
        model.addAttribute("account", new Account());
        return "loginform";
    }

    @GetMapping(value = "login", params = {"error"})
    public String loginFromAuthencation(@PathParam("error") String error, Model model) {
        model.addAttribute("account", new Account());
        model.addAttribute("message", error);
        System.out.println(error);
        return "loginform";
    }

    @PostMapping("login")
    public String login(Model model, @ModelAttribute("account") Account account, BindingResult errors) {
        account.setUsername(account.getUsername().trim());
        account.setPassword(account.getPassword().trim());

        if (account.getUsername().isEmpty()) {
            errors.rejectValue("username", "account", "Hãy nhập username !");
        } else if (!Utils.isValidUsername(account.getUsername())) {
            errors.rejectValue("username", "account", "Username không được chứa ký tự đặc biệt !");
        }
        if (account.getPassword().isEmpty()) {
            errors.rejectValue("password", "account", "Hãy nhập mật khẩu !");
        } else if (account.getPassword().contains(" ") || account.getPassword().contains("'")) {
            errors.rejectValue("password", "account", "Mật khẩu không được chứa ký tự đặc biệt !");
        }
        if (!errors.hasErrors()) {

            Account dBAccount = accountDAO.login(account.getUsername(), account.getPassword());
            if (dBAccount != null) {
                session.set("curaccount", dBAccount);
                String uri = session.get("security-uri");
                if (dBAccount.isAdmin() && uri == null) {
                    return "redirect:/admin/index";
                } else if (dBAccount.isAdmin() && uri != null) {
                    session.remove("security-uri");
                    return "redirect:" + uri;
                } else if (uri != null && !uri.startsWith("/admin")) {
                    session.remove("security-uri");
                    return "redirect:" + uri;
                } else {
                    return "redirect:/index";
                }
            } else {

                errors.rejectValue("password", "account", "Tài khoản không đúng !");
                return "loginform";
            }
        }
        return "loginform";
    }

    @RequestMapping("logout")
    public String logout() {
        Account account = session.get("curaccount");
        session.remove("curaccount");
        if (session.get("security-uri") != null) session.remove("security-uri");
        return "redirect:/index";
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("account", new Account());
        return "registerform";
    }

    @PostMapping("register")
    public String register(Model model, @ModelAttribute("account") Account account, BindingResult errors) {
        account.setUsername(account.getUsername().trim());
        account.setPassword(account.getPassword().trim());
        account.setEmail(account.getEmail().trim());
        account.setPhone(account.getPhone().trim());
        account.setFullname(account.getFullname().trim());
        if (account.getUsername().trim().isEmpty()) {
            errors.rejectValue("username", "account", "Hãy nhập username !");
        } else if (account.getUsername().length() > 100) {
            errors.rejectValue("username", "account", "Username quá dài !");
        } else if (!Utils.isValidUsername(account.getUsername())) {
            errors.rejectValue("username", "account", "Username chỉ được chứa chữ cái và số !");
        }
        if (account.getPassword().trim().isEmpty()) {
            errors.rejectValue("password", "account", "Hãy nhập mật khẩu !");
        } else if (account.getPassword().length() > 100) {
            errors.rejectValue("password", "account", "Mật khẩu quá dài !");
        } else if (account.getPassword().trim().contains(" ") || account.getPassword().contains("'")) {
            errors.rejectValue("password", "account", "Mật khẩu không được chứa ký tự đặc biệt !");
        }
        if (!account.getEmail().isEmpty() && !Utils.isValidEmail(account.getEmail())) {
            errors.rejectValue("email", "account", "Email không đúng định dạng !");
        } else if (account.getEmail().length() > 100) {
            errors.rejectValue("email", "account", "Email quá dài !");
        }
        if (!account.getPhone().isEmpty() && !Utils.isValidPhoneNumber(account.getPhone())) {
            errors.rejectValue("email", "account", "Số điện thoại không đúng định dạng !");
        }
        if (!errors.hasErrors()) {
            account.setPhoto("resources/images/avatar/user-default.png");
            Account dbAccount = accountDAO.findByUsername(account.getUsername());
            if (dbAccount == null) {
                account.setAdmin(false);
                try {
                    accountDAO.save(account);
                    model.addAttribute("message", "Đăng ký thành công !");
                    session.set("curaccount", account);
                    return "redirect:/index";
                } catch (Exception e) {
                    model.addAttribute("message", "Thất bại!\n" + e);
                    return "redirect:/register";
                }
            } else {
                errors.rejectValue("username", "account", "Tên đăng nhập này đã tồn tại !");
            }

        }
        return "registerform";
    }

}
