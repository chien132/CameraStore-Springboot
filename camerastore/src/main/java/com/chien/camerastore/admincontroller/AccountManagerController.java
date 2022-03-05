package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.AccountDAO;
import com.chien.camerastore.model.Account;
import com.chien.camerastore.service.SessionService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/admin/")
public class AccountManagerController {
    @Autowired
    private SessionFactory factory;
    @Autowired
    private SessionService session;
    @Autowired
    private ServletContext context;
    @Autowired
    private AccountDAO accountDAO;


    @ModelAttribute("accounts")
    public List<Account> accounts() {
        return accountDAO.findAll();
    }

    @RequestMapping("accounts")
    public String accountTable() {
        return "admin/accounttable";
    }

}
