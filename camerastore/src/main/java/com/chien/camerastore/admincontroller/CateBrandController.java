package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.BrandDAO;
import com.chien.camerastore.dao.CategoryDAO;
import com.chien.camerastore.model.Brand;
import com.chien.camerastore.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Transactional
@RequestMapping("/admin/catebrand/")
public class CateBrandController {
    @Autowired
    private BrandDAO brandDAO;
    @Autowired
    private CategoryDAO categoryDAO;

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAllByOrderByNameAsc();
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryDAO.findAllByOrderByNameAsc();
    }

    @RequestMapping("view")
    public String view() {
        return "admin/catebrandtable";
    }

    @PostMapping("addcate")
    public String addcate(@RequestParam("name") String name, RedirectAttributes re) {
        name = name.trim();
        if (name.isEmpty()) {
            re.addFlashAttribute("message", "Tên không được trống!");
            return "redirect:/admin/catebrand/view";
        }
        Category category = new Category();
        category.setName(name);
        categoryDAO.save(category);
        re.addFlashAttribute("message", "Thêm thành công phân loại: " + name);
        return "redirect:/admin/catebrand/view";
    }

    @PostMapping("editcate/{id}")
    public String editcate(@PathVariable("id") int id, @RequestParam("name") String name, RedirectAttributes re) {
        name = name.trim();
        if (name.isEmpty()) {
            re.addFlashAttribute("message", "Tên không được trống!");
            return "redirect:/admin/catebrand/view";
        }
        Category category = categoryDAO.getById(id);
        category.setName(name);
        categoryDAO.save(category);
        re.addFlashAttribute("message", "Đã cập nhật phân loại: " + name);
        return "redirect:/admin/catebrand/view";
    }

    @PostMapping("addbrand")
    public String addbrand(@RequestParam("name") String name, RedirectAttributes re) {
        name = name.trim();
        if (name.isEmpty()) {
            re.addFlashAttribute("message", "Tên không được trống!");
            return "redirect:/admin/catebrand/view";
        }
        Brand brand = new Brand();
        brand.setName(name);
        brandDAO.save(brand);
        re.addFlashAttribute("message", "Thêm thành công hãng sản xuất: " + name);
        return "redirect:/admin/catebrand/view";
    }

    @PostMapping("editbrand/{id}")
    public String editbrand(@PathVariable("id") int id, @RequestParam("name") String name, RedirectAttributes re) {
        name = name.trim();
        if (name.isEmpty()) {
            re.addFlashAttribute("message", "Tên không được trống!");
            return "redirect:/admin/catebrand/view";
        }
        Brand brand = brandDAO.getById(id);
        brand.setName(name);
        brandDAO.save(brand);
        re.addFlashAttribute("message", "Đã cập nhật hãng sản xuất: " + name);
        return "redirect:/admin/catebrand/view";
    }

    @RequestMapping("deletecate/{id}")
    public String deletecate(@PathVariable("id") int id, RedirectAttributes re) {
        String name = categoryDAO.findById(id).getName();
        categoryDAO.deleteById(id);
        re.addFlashAttribute("message", "Xóa thành công phân loại: " + name);
        return "redirect:/admin/catebrand/view";
    }

    @RequestMapping("deletebrand/{id}")
    public String deletebrand(@PathVariable("id") int id, RedirectAttributes re) {
        String name = brandDAO.findById(id).getName();
        brandDAO.deleteById(id);
        re.addFlashAttribute("message", "Xóa thành công hãng sản xuất: " + name);
        return "redirect:/admin/catebrand/view";
    }
}
