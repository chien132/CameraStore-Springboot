package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.AccountDAO;
import com.chien.camerastore.dao.BrandDAO;
import com.chien.camerastore.dao.CategoryDAO;
import com.chien.camerastore.model.Account;
import com.chien.camerastore.model.Brand;
import com.chien.camerastore.model.Category;
import com.chien.camerastore.service.EmailService;
import com.chien.camerastore.service.MyConstants;
import com.chien.camerastore.service.SessionService;
import com.chien.camerastore.service.Utils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    @Autowired
    private EmailService emailService;
//    @Autowired
//    public JavaMailSender emailSender;

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAllByOrderByNameAsc();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAllByOrderByNameAsc();
    }

    @GetMapping("login")
    public String login(Model model) {
        model.addAttribute("account", new Account());
        return "loginform";
    }

    @GetMapping(value = "login", params = {"error"})
    public String loginFromAuthencation(@PathParam("error") String error, Model model) {
        model.addAttribute("account", new Account());
//        model.addAttribute("message", error);
        System.out.println(error);
        return "loginform";
    }

    @PostMapping("login")
    public String login(Model model, @ModelAttribute("account") Account account, BindingResult errors) throws NoSuchAlgorithmException {
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
            String inputPassword = account.getPassword();
            //Ma hoa mat khau bang SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(account.getPassword().getBytes());
            account.setPassword(DatatypeConverter.printHexBinary(messageDigest).toUpperCase());
            // System.out.println(account.getPassword());

            Account dBAccount = accountDAO.login(account.getUsername(), account.getPassword());
            if (dBAccount != null) {
                session.set("curaccount", dBAccount);
                String uri = session.get("security-uri");
                if (dBAccount.isAdmin() && uri == null) {
                    return "redirect:/admin/overview";
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
                account.setPassword(inputPassword);
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
    public String register(Model model, @ModelAttribute("account") Account account, BindingResult errors) throws NoSuchAlgorithmException {
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
            String inputPassword = account.getPassword();

            //Ma hoa mat khau bang SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(account.getPassword().getBytes());
            account.setPassword(DatatypeConverter.printHexBinary(messageDigest).toUpperCase());

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
                account.setPassword(inputPassword);
                errors.rejectValue("username", "account", "Tên đăng nhập này đã tồn tại !");
            }

        }
        return "registerform";
    }

//    @RequestMapping("/sendmail")
//    public String sendSimpleEmail() {
//
//        // Create a Simple MailMessage.
//        SimpleMailMessage message = new SimpleMailMessage();
//
//        message.setTo(MyConstants.FRIEND_EMAIL);
//        message.setSubject("Test Simple Email");
//        message.setText("Hello, Im testing Simple Email");
//
//        // Send Message!
//        this.emailSender.send(message);
//        System.out.println("Email sent!");
//        return "redirect:/";
//    }

    @PostMapping("requestpassword")
    public String sendHtmlEmail(@RequestParam("username") String username, RedirectAttributes re) throws NoSuchAlgorithmException {
        username = username.trim();
        Account account = accountDAO.findByUsername(username);
        if (username.isBlank()) {
            re.addFlashAttribute("message", "Hãy nhập username!");
        } else if (account == null) {
            re.addFlashAttribute("message", "Username " + username + " không tồn tại!");
        } else if (account.getEmail() == null) {
            re.addFlashAttribute("message", "Tài khoản " + username + " chưa cập nhật email!");
        } else {
            String inputStr = account.getUsername() + account.getPassword();
            //tao chuoi ngau nhien tu account va password bang SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(inputStr.getBytes());
            String outputStr = DatatypeConverter.printHexBinary(messageDigest).toUpperCase();
            account.setPasswordreset(outputStr);
            accountDAO.save(account);
            String htmlMsg = "<h2>CameraStore xin chào! </h2>"
                    + "<p>Bạn vừa yêu cầu đặt lại mật khẩu cho tài khoản " + account.getUsername() + "</p>"
                    + "<a href=http://localhost:8080/resetpassword?code=" + outputStr + ">Vui lòng click vào liên kết này</a> để đặt lại mật khẩu mới!";

            String subject = "CameraStore - Đặt lại mật khẩu";
            String result = emailService.sentHTMLEmail(account.getEmail(), subject, htmlMsg);
            if (result.equals("OK")) {
                re.addFlashAttribute("message", "Đã gửi email xác nhận đến " + account.getEmail());
            } else {
                re.addFlashAttribute("message", "Đã xảy ra lỗi!");
            }
        }
        return "redirect:/login";
    }

    @GetMapping(value = "resetpassword", params = {"code"})
    public String getresetpassword(@PathParam("code") String code, RedirectAttributes re, Model model) {
        Account account = accountDAO.findByPasswordreset(code);
        if (account == null) {
            re.addFlashAttribute("message", "Liên kết đã hết hiệu lực!");
            return "redirect:/login";
        } else {
            model.addAttribute("account", account);
            return "resetpassform";
        }
    }

    @PostMapping("resetpassword")
    public String postresetpassword(@ModelAttribute("account") Account account, @RequestParam("passwordconfirm") String passwordconfirm, RedirectAttributes re, Model model) throws NoSuchAlgorithmException {
        if (account.getPassword().isBlank() || passwordconfirm.isBlank()) {
            model.addAttribute("account", account);
            model.addAttribute("message", "Mật khẩu không được trống!");
            return "resetpassform";
        } else if (!account.getPassword().equals(passwordconfirm)) {
            model.addAttribute("account", account);
            model.addAttribute("message", "Mật khẩu không trùng khớp!");
            return "resetpassform";
        } else {
            Account dbAccount = accountDAO.findById(account.getId());
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(account.getPassword().getBytes());
            String outputStr = DatatypeConverter.printHexBinary(messageDigest).toUpperCase();
            dbAccount.setPasswordreset(null);
            dbAccount.setPassword(outputStr);
            accountDAO.save(dbAccount);
            re.addFlashAttribute("message", "Đặt lại mật khẩu thành công!");
            return "redirect:/login";
        }
    }
}
