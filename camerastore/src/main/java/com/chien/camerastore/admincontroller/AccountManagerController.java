package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.AccountDAO;
import com.chien.camerastore.model.Account;
import com.chien.camerastore.service.FileUploadService;
import com.chien.camerastore.service.SessionService;
import com.chien.camerastore.service.Utils;
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
import javax.xml.bind.DatatypeConverter;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/admin/account/")
public class AccountManagerController {
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

    @RequestMapping("view")
    public String view() {
        return "admin/accounttable";
    }

    @GetMapping("add")
    public String addAccount(ModelMap model) {
        Account account = new Account();
        account.setPhoto("resources/images/avatar/user-default.png");
        model.addAttribute("account", account);
        model.addAttribute("action", "add");
        return "admin/accountform";
    }

    @PostMapping("add")
    public String addAccount(ModelMap model, @ModelAttribute("account") Account account, BindingResult errors, RedirectAttributes re,
                             HttpServletRequest request, @RequestParam("photoinput") MultipartFile photo) throws IOException, NoSuchAlgorithmException {
        account.setAdmin(request.getParameter("admincb") != null);
        account.setAdmin(request.getParameter("admincb") != null);
        account.setUsername(account.getUsername().trim());
        account.setPassword(account.getPassword().trim());
        account.setEmail(account.getEmail().trim());
        account.setPhone(account.getPhone().trim());
        account.setFullname(account.getFullname().trim());
        if (account.getUsername().isEmpty()) {
            errors.rejectValue("username", "account", "Hãy nhập username !");
        } else if (!Utils.isValidUsername(account.getUsername())) {
            errors.rejectValue("username", "account", "Username chỉ được chứa chữ cái và số !");
        }
        if (account.getPassword().isEmpty()) {
            errors.rejectValue("password", "account", "Hãy nhập mật khẩu !");
        } else if (account.getPassword().contains(" ") || account.getPassword().contains("'")) {
            errors.rejectValue("password", "account", "Mật khẩu không được chứa ký tự đặc biệt !");
        }
        if (!account.getEmail().isEmpty() && !Utils.isValidEmail(account.getEmail())) {
            errors.rejectValue("email", "account", "Email không đúng định dạng !");
        }
        if (!account.getPhone().isEmpty() && !Utils.isValidPhoneNumber(account.getPhone())) {
            errors.rejectValue("phone", "account", "Số điện thoại không hợp lệ !");
        }
        if (!errors.hasErrors()) {
            String inputPassword = account.getPassword();

            //Ma hoa mat khau bang SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(account.getPassword().getBytes());
            account.setPassword(DatatypeConverter.printHexBinary(messageDigest).toUpperCase());

            Account dbAccount = accountDAO.findByUsername(account.getUsername());
            if (dbAccount == null) {
                try {
                    if (photo.getOriginalFilename().isEmpty()) {
//                        account.setPhoto("resources/images/avatar/user-default.png");
                    } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
                        re.addFlashAttribute("message", "File ảnh không đúng định dạng !");
                    } else {
                        try {
                            String filename = StringUtils.cleanPath(account.getId() + photo.getOriginalFilename().replaceAll("\\s", ""));
                            String uploadDir = "src/main/webapp/resources/images/avatar/";
                            FileUploadService.saveFile(uploadDir, filename, photo);
                            account.setPhoto("resources/images/avatar/" + filename);
                        } catch (Exception e) {
                            re.addFlashAttribute("message", "Lỗi lưu ảnh: " + e);
                            return "redirect:/admin/account/add";
                        }
                    }
                    accountDAO.save(account);
                    re.addFlashAttribute("message", "Thêm tài khoản thành công !");
                    return "redirect:/admin/account/view";
                } catch (Exception e) {
                    re.addFlashAttribute("message", "Thất bại!\n" + e);
                    return "redirect:/admin/account/add";
                }
            } else {
                account.setPassword(inputPassword);
                errors.rejectValue("username", "account", "Tên đăng nhập này đã tồn tại !");
            }

        }
        model.addAttribute("action", "add");
        return "admin/accountform";
    }

    @GetMapping("edit/{id}")
    public String editAccount(Model model, @PathVariable("id") int id) {
        model.addAttribute("account", accountDAO.findById(id));
        model.addAttribute("action", "edit");
        return "admin/accountform";
    }

    @PostMapping("edit")
    public String editAccount(ModelMap model, @ModelAttribute("account") Account account, BindingResult errors, RedirectAttributes re,
                              HttpServletRequest request, @RequestParam("photoinput") MultipartFile photo) throws IOException, NoSuchAlgorithmException {
        account.setAdmin(request.getParameter("admincb") != null);
        account.setUsername(account.getUsername().trim());
//        account.setPassword(account.getPassword().trim());
        account.setEmail(account.getEmail().trim());
        account.setPhone(account.getPhone().trim());
        account.setFullname(account.getFullname().trim());
        if (account.getUsername().isEmpty()) {
            errors.rejectValue("username", "account", "Hãy nhập username !");
        } else if (!Utils.isValidUsername(account.getUsername())) {
            errors.rejectValue("username", "account", "Username chỉ được chứa chữ cái và số !");
        }
//        if (account.getPassword().isEmpty()) {
//            errors.rejectValue("password", "account", "Hãy nhập mật khẩu !");
//        } else if (account.getPassword().contains(" ") || account.getPassword().contains("'")) {
//            errors.rejectValue("password", "account", "Mật khẩu không được chứa ký tự đặc biệt !");
//        }
        if (!account.getEmail().isEmpty() && !Utils.isValidEmail(account.getEmail())) {
            errors.rejectValue("email", "account", "Email không đúng định dạng !");
        }
        if (!account.getPhone().isEmpty() && !Utils.isValidPhoneNumber(account.getPhone())) {
            errors.rejectValue("phone", "account", "Số điện thoại không hợp lệ !");
        }
        if (!errors.hasErrors()) {

            //Ma hoa mat khau bang SHA-256
//            MessageDigest md = MessageDigest.getInstance("SHA-256");
//            byte[] messageDigest = md.digest(account.getPassword().getBytes());
//            account.setPassword(DatatypeConverter.printHexBinary(messageDigest).toUpperCase());

            Account dbAccount = accountDAO.findByUsername(account.getUsername());
//            account.setId(dbAccount.getId());
            if (dbAccount != null) {
                try {
                    if (photo.getOriginalFilename().isEmpty()) {
//                        account.setPhoto("resources/images/avatar/user-default.png");
                    } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
                        re.addFlashAttribute("message", "File ảnh không đúng định dạng !");
                    } else {
                        try {
                            String filename = StringUtils.cleanPath(account.getId() + photo.getOriginalFilename().replaceAll("\\s", ""));
                            String uploadDir = "src/main/webapp/resources/images/avatar/";
                            FileUploadService.saveFile(uploadDir, filename, photo);
                            if (!dbAccount.getPhoto().equals("resources/images/avatar/user-default.png")) {
                                File image = new File(
                                        context.getRealPath(dbAccount.getPhoto()));
                                if (image.delete()) {
                                    System.out.println("Deleted the file: " + image.getName());
                                } else {
                                    System.out.println("Failed to delete the file.");
                                }
                            }
                            account.setPhoto("resources/images/avatar/" + filename);
                        } catch (Exception e) {
                            re.addFlashAttribute("message", "Save file error: " + e);
                            return "redirect:/admin/account/edit/" + account.getId();
                        }
                    }
                    //Khong cho sua mat khau nua
                    account.setPassword(dbAccount.getPassword());
                    accountDAO.save(account);
                    re.addFlashAttribute("message", "Chỉnh sửa tài khoản thành công !");
                    return "redirect:/admin/account/view";
                } catch (Exception e) {
                    re.addFlashAttribute("message", "Thất bại!\n" + e);
                    return "redirect:/admin/account/edit/" + account.getId();
                }
            } else {
                errors.rejectValue("username", "account", "Tên đăng nhập này đã tồn tại !");
            }

        }
        model.addAttribute("action", "edit");
        return "admin/accountform";
    }

    @RequestMapping("delete/{id}")
    public String deleteaccount(RedirectAttributes re, @PathVariable("id") int id) {
        Account curAccount = (Account) session.get("curaccount");
        if (curAccount.getId() != id) {
            Account account = accountDAO.findById(id);
            if (account.getOrderSize() > 0) {
                re.addFlashAttribute("message", "Không thể xóa tài khoản này!");
            } else {
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
            }
        } else {
            re.addFlashAttribute("message", "Không thể xóa tài khoản của chính bạn!");
        }
        return "redirect:/admin/account/view";
    }

    @RequestMapping("myaccount")
    public String viewaccount() {
        return "admin/accountview";
    }

    @PostMapping("myaccount/editusername")
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
        return "redirect:/admin/account/myaccount";
    }

    @PostMapping("myaccount/editfullname")
    public String editfullname(@RequestParam("name") String fullname, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (fullname.isBlank()) {
            re.addFlashAttribute("message", "Tên không đúng định dạng!");
        } else {
            account.setFullname(fullname.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/admin/account/myaccount";
    }

    @PostMapping("myaccount/editphone")
    public String editphone(@RequestParam("name") String phone, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (phone.isBlank() || !Utils.isValidPhoneNumber(phone)) {
            re.addFlashAttribute("message", "Số điện thoại không đúng định dạng!");
        } else {
            account.setPhone(phone.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/admin/account/myaccount";
    }

    @PostMapping("myaccount/editemail")
    public String editemail(@RequestParam("name") String email, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (email.isBlank() || !Utils.isValidEmail(email)) {
            re.addFlashAttribute("message", "Email không đúng định dạng!");
        } else {
            account.setEmail(email.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/admin/account/myaccount";
    }

    @PostMapping("myaccount/editaddress")
    public String editaddress(@RequestParam("name") String address, RedirectAttributes re) {
        Account account = session.get("curaccount");
        if (address.isBlank()) {
            re.addFlashAttribute("message", "Địa chỉ không đúng định dạng!");
        } else {
            account.setAddress(address.trim());
            accountDAO.save(account);
            re.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/admin/account/myaccount";
    }

    @PostMapping("myaccount/editpassword")
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
        return "redirect:/admin/account/myaccount";
    }

    @PostMapping("myaccount/editavatar")
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
        return "redirect:/admin/account/myaccount";
    }

}
