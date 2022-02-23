package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.AccountDAO;
import com.chien.camerastore.model.Account;
import com.chien.camerastore.service.SessionService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

@Transactional
@Controller
public class AccountController {
    @Autowired
    SessionFactory factory;
    @Autowired
    SessionService session;
    @Autowired
    ServletContext context;
    @Autowired
    AccountDAO dao;

    @GetMapping("login")
    public String login(Model model) {
        model.addAttribute("account", new Account());
        return "login";
    }

    @PostMapping("login")
    public String login(Model model, @ModelAttribute("account") Account account, BindingResult errors) {
        account.setUsername(account.getUsername().trim());
        account.setPassword(account.getPassword().trim());

        if (account.getUsername().isEmpty()) {
            errors.rejectValue("username", "account", "Hãy nhập username !");
        } else if (account.getUsername().contains(" ") || account.getUsername().contains("'")) {
            errors.rejectValue("username", "account", "Username không được chứa ký tự đặc biệt !");
        }
        if (account.getPassword().isEmpty()) {
            errors.rejectValue("password", "account", "Hãy nhập mật khẩu !");
        } else if (account.getPassword().contains(" ") || account.getPassword().contains("'")) {
            errors.rejectValue("password", "account", "Mật khẩu không được chứa ký tự đặc biệt !");
        }
        if (!errors.hasErrors()) {

            Account dBAccount = dao.findByUsername(account.getUsername());
            System.out.println(dBAccount.getUsername() + " " + dBAccount.getPassword());
            if (dBAccount != null && dBAccount.getPassword().equals(account.getPassword())) {
                session.set("account", dBAccount);
                if (dBAccount.isAdmin()) {
                    return "redirect:/admin/index";
                }
                return "redirect:/index";
            } else {

                errors.rejectValue("password", "account", "Tài khoản không đúng !");
                return "login";
            }
        }
        return "login";
    }
}
