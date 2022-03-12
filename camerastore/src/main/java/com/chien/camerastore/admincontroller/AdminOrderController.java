package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.OrderDAO;
import com.chien.camerastore.dao.ProductDAO;
import com.chien.camerastore.model.Order;
import com.chien.camerastore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Transactional
@RequestMapping("/admin/order/")
public class AdminOrderController {
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private OrderDAO orderDAO;

    @ModelAttribute("products")
    public List<Product> products() {
        return productDAO.findAll();
    }

    @ModelAttribute("orders")
    public List<Order> orders() {
        System.out.println(orderDAO.findAll().size());
        return orderDAO.findAll();
    }

    @RequestMapping("view")
    public String view() {
        return "admin/ordertable";
    }

//    @GetMapping("add")
//    public String addProduct(Model model) {
//        Product product = new Product();
//        product.setImage("resources/images/product/empty.png");
//        model.addAttribute("product", product);
//        model.addAttribute("action", "add");
//        return "admin/productform";
//    }
//
//    @PostMapping("add")
//    public String addProduct(Model model, @ModelAttribute("product") Product product, BindingResult errors,
//                             RedirectAttributes re, @RequestParam("photoinput") MultipartFile photo) throws IOException {
//        product.setName(product.getName().trim());
//        product.setDescription(product.getDescription().trim());
//        if (product.getName().isEmpty()) {
//            errors.rejectValue("name", "product", "Hãy nhập tên sản phẩm !");
//        }
////        if (photo.getOriginalFilename().isEmpty()) {
////            errors.rejectValue("photo", "product", "Hãy chọn ảnh sản phẩm !");
////        }
//        if (!errors.hasErrors()) {
//            try {
//                if (photo.getOriginalFilename().isEmpty()) {
//                    re.addFlashAttribute("message", "Hãy chọn ảnh sản phẩm !");
//                } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
//                    re.addFlashAttribute("message", "File ảnh không đúng định dạng !");
//                } else {
//                    try {
//                        String filename = StringUtils.cleanPath(product.getId() + photo.getOriginalFilename());
//                        String uploadDir = "src/main/webapp/resources/images/product/";
//                        FileUploadService.saveFile(uploadDir, filename, photo);
//                        product.setImage("resources/images/product/" + filename);
//
//                    } catch (Exception e) {
//                        re.addFlashAttribute("message", "Lỗi lưu ảnh: " + e);
//                        return "redirect:/admin/product/add";
//                    }
//                }
//                productDAO.save(product);
//                re.addFlashAttribute("message", "Thêm sản phẩm thành công !");
//                return "redirect:/admin/product/view";
//
//            } catch (Exception e) {
//                re.addFlashAttribute("message", "Thất bại!\n" + e);
//                return "redirect:/admin/product/add";
//            }
//        }
//        model.addAttribute("action", "add");
//        return "admin/productform";
//    }
//
//    @GetMapping("edit/{id}")
//    public String addProduct(Model model, @PathVariable("id") int id) {
//        model.addAttribute("product", productDAO.getById(id));
//        model.addAttribute("action", "edit");
//        return "admin/productform";
//    }
//
//    @PostMapping("edit")
//    public String editProduct(Model model, @ModelAttribute("product") Product product, BindingResult errors,
//                              RedirectAttributes re, @RequestParam("photoinput") MultipartFile photo) throws IOException {
//        product.setName(product.getName().trim());
//        product.setDescription(product.getDescription().trim());
//        product.setBrand(brandDAO.getById(product.getBrand().getId()));
//        product.setCategory(categoryDAO.getById(product.getCategory().getId()));
//        if (product.getName().isEmpty()) {
//            errors.rejectValue("name", "product", "Hãy nhập tên sản phẩm !");
//        }
//        if (!errors.hasErrors()) {
//            try {
//                if (photo.getOriginalFilename().isEmpty()) {
//                    product.setImage(productDAO.findById(product.getId()).getImage());
////                    re.addFlashAttribute("message", "Hãy chọn ảnh sản phẩm !");
//                } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
//                    re.addFlashAttribute("message", "File ảnh không đúng định dạng !");
//                } else {
//                    try {
//                        String filename = StringUtils.cleanPath(product.getId() + photo.getOriginalFilename());
//                        String uploadDir = "src/main/webapp/resources/images/product/";
//                        FileUploadService.saveFile(uploadDir, filename, photo);
//                        product.setImage("resources/images/product/" + filename);
//
//                    } catch (Exception e) {
//                        re.addFlashAttribute("message", "Lỗi lưu ảnh: " + e);
//                        return "redirect:/admin/product/add";
//                    }
//                }
//                productDAO.save(product);
//                re.addFlashAttribute("message", "Cập nhật sản phẩm thành công !");
//                return "redirect:/admin/product/view";
//
//            } catch (Exception e) {
//                re.addFlashAttribute("message", "Thất bại!\n" + e);
//                return "redirect:/admin/product/add";
//            }
//        }
//        model.addAttribute("action", "edit");
//        return "admin/productform";
//    }
//
//    @RequestMapping("delete/{id}")
//    public String deleteProduct(RedirectAttributes re, @PathVariable("id") int id) {
//        Product product = productDAO.findById(id);
////        if (product.getOrderSize() > 0) {
////            re.addFlashAttribute("message", "Không thể xóa mặt hàng này!");
////        } else {
//        try {
//            productDAO.delete(product);
//
//            if (!product.getImage().equals("resources/images/avatar/user-default.png")) {
//                File image = new File(
//                        context.getRealPath(product.getImage()));
//                if (image.delete()) {
//                    System.out.println("Deleted the file: " + image.getName());
//                } else {
//                    System.out.println("Failed to delete the file.");
//                }
//            }
//            re.addFlashAttribute("message", "Đã xóa sản phẩm: " + product.getName());
//        } catch (Exception e) {
//            re.addFlashAttribute("message", "Không thể xóa !\n" + e);
//        }
////        }
//
//        return "redirect:/admin/product/view";
//    }
}
