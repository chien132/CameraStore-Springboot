package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.AccountDAO;
import com.chien.camerastore.model.Account;
import com.chien.camerastore.service.FileUploadService;
import com.chien.camerastore.service.SessionService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    @GetMapping("addaccount")
    public String addAccount(ModelMap model) {
        Account account = new Account();
        account.setPhoto("resources/images/avatar/user-default.png");
        model.addAttribute("account", account);
        model.addAttribute("action", "add");
        return "admin/accountform";
    }

    @PostMapping("addaccount")
    public String addAccount(ModelMap model, @ModelAttribute("account") Account account, BindingResult errors, RedirectAttributes re,
                             HttpServletRequest request, @RequestParam("photoinput") MultipartFile photo) throws IOException {
        account.setAdmin(request.getParameter("admincb") != null);
        System.out.println(account.isAdmin());
        if (account.getUsername().trim().isEmpty()) {
            errors.rejectValue("username", "account", "Hãy nhập username !");
        } else {
            Pattern VALID_USERNAME_REGEX = Pattern.compile("^[a-zA-Z0-9]+$",
                    Pattern.CASE_INSENSITIVE);
            Matcher matcher = VALID_USERNAME_REGEX.matcher(account.getUsername());
            if (!matcher.find()) {
                errors.rejectValue("username", "account", "Username chỉ được chứa chữ cái và số !");
            }

        }
        if (account.getPassword().trim().isEmpty()) {
            errors.rejectValue("password", "account", "Hãy nhập mật khẩu !");
        } else if (account.getPassword().trim().contains(" ") || account.getPassword().contains("'")) {
            errors.rejectValue("password", "account", "Mật khẩu không được chứa ký tự đặc biệt !");
        }
        if (!account.getEmail().isEmpty()) {
            Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
                    Pattern.CASE_INSENSITIVE);
            Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(account.getEmail());
            if (!matcher.find()) {
                errors.rejectValue("email", "account", "Email không đúng định dạng !");
            }
        }
        if (!account.getPhone().trim().isEmpty()) {
            Pattern VALID_PHONE_NUMBER_REGEX = Pattern.compile("(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\\b",
                    Pattern.CASE_INSENSITIVE);
            Matcher matcher = VALID_PHONE_NUMBER_REGEX.matcher(account.getPhone());
            Pattern VALID_ID_NUMBER_REGEX = Pattern.compile("([0-9]{9,12})\\b", Pattern.CASE_INSENSITIVE);
            Matcher matcher2 = VALID_ID_NUMBER_REGEX.matcher(account.getPhone());
            if (!matcher.find() || !matcher2.find()) {
                errors.rejectValue("phone", "account", "Số điện thoại không hợp lệ !");
            }
        }
//        else {
//            errors.rejectValue("phone", "account", "Hãy nhập số điện thoại !");
//        }
        if (!errors.hasErrors()) {
            System.out.println("no error");
            Account dbAccount = accountDAO.findByUsername(account.getUsername());
            if (dbAccount == null) {
                try {
                    if (photo.getOriginalFilename().isEmpty()) {
//                        account.setPhoto("resources/images/avatar/user-default.png");
                    } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
                        re.addFlashAttribute("message", "File ảnh không đúng định dạng !");
                    } else {
                        try {
                            String filename = StringUtils.cleanPath(photo.getOriginalFilename());
                            String uploadDir = "src/main/webapp/resources/images/avatar/";
                            FileUploadService.saveFile(uploadDir, filename, photo);
                            account.setPhoto("resources/images/avatar/" + filename);
                        } catch (Exception e) {
                            re.addFlashAttribute("message", "Save file error: " + e);
                            return "redirect:/admin/addaccount";
                        }
                    }
                    accountDAO.save(account);
                    model.addAttribute("message", "Thêm tài khoản thành công !");
                    return "redirect:/admin/accounts";
                } catch (Exception e) {
                    model.addAttribute("message", "Thất bại!\n" + e);
                    return "redirect:/admin/addaccount";
                }
            } else {
                errors.rejectValue("username", "account", "Tên đăng nhập này đã tồn tại !");
            }

        }
        model.addAttribute("action", "add");
        return "admin/accountform";
    }

    @GetMapping("editaccount/{id}")
    public String editAccount(Model model, @PathVariable("id") int id) {
        model.addAttribute("account", accountDAO.findById(id));
        model.addAttribute("action", "edit");
        return "admin/accountform";
    }

    @RequestMapping("deleteaccount/{id}")
    public String deleteaccount(RedirectAttributes re, @PathVariable("id") int id) {
        Account curAccount = (Account) session.get("curaccount");
        if (curAccount.getId() != id) {
            Account account = accountDAO.findById(id);
            try {
                accountDAO.delete(account);

                if (!account.getPhoto().equals("resources/images/avatar/user-default.png")) {
                    File avatar = new File(
                            context.getRealPath(account.getPhoto()));
                    if (avatar.delete()) {
                        System.out.println("Deleted the file: " + avatar.getName());
                    } else {
                        System.out.println("Failed to delete the file.");
                    }
                }
                re.addFlashAttribute("message", "Đã xóa tài khoản " + account.getUsername());
            } catch (Exception e) {
                re.addFlashAttribute("message", "Không thể xóa !\n" + e);
            }
        } else {
            re.addFlashAttribute("message", "Không thể xóa tài khoản của chính bạn!");
        }
        return "redirect:/admin/accounts";
    }
}
