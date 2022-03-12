package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.*;
import com.chien.camerastore.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.transaction.Transactional;
import javax.websocket.server.PathParam;
import java.util.Collections;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/cart/")
public class CartController {
    @Autowired
    private SessionService session;
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
        return categoryDAO.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> brands() {
        return brandDAO.findAll();
    }

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


    @RequestMapping("view")
    public String viewCart(Model model, RedirectAttributes re) {
        Account curAccount = session.get("curaccount");
        if (cartItemDAO.findAllByAccount_Id(curAccount.getId()).isEmpty()) {
            re.addFlashAttribute("message", "Giỏ hàng trống, hãy thêm sản phẩm!");
            return "redirect:/index";
        }
        Order order = new Order();
        order.setAccount(curAccount);
        order.setAddress(curAccount.getAddress());
        order.setEmail(curAccount.getEmail());
        order.setFullname(curAccount.getFullname());
        order.setPhone(curAccount.getPhone());
        model.addAttribute("order", order);
        model.addAttribute("action", "add");
        return "cart";
    }

    @RequestMapping(value = "additem/{id}/{amount}", params = {"ret"})
    public String addItem(Model model, @PathVariable("id") int id, @PathVariable("amount") int amount, @PathParam("ret") String ret, RedirectAttributes re) {
        Account curAccount = session.get("curaccount");
        Product product = productDAO.findById(id);
        if (product == null) {
            re.addFlashAttribute("message", "Sản phẩm không tồn tại");
            return "redirect:/" + ret;
        }
        if (product.getQuantity() < amount) {
            re.addFlashAttribute("message", String.format("%s chỉ còn lại %d sản phẩm", product.getName(), product.getQuantity()));
            return "redirect:/" + ret;
        }
        CartItemId cartItemId = new CartItemId(curAccount.getId(), product.getId());
        try {
            List<CartItem> olditems = cartItemDAO.findAllById(cartItemId);
            if (olditems.size() == 1) {
                CartItem olditem = olditems.get(0);
                if (product.getQuantity() < amount + olditem.getAmount()) {
                    re.addFlashAttribute("message", String.format("%s chỉ còn lại %d sản phẩm", product.getName(), product.getQuantity()));
                    return "redirect:/" + ret;
                }
                olditem.setAmount(olditem.getAmount() + amount);
                if (olditem.getAmount() > 0) {
                    cartItemDAO.save(olditem);
//                    if (amount > 0) {
                    if (!ret.equals("cart/view")) {
                        re.addFlashAttribute("dontshowmessage", "cart");
                    } else {
                        re.addFlashAttribute("dontshowmessage", "");
                    }
                    re.addFlashAttribute("message", String.format("Đã thêm %d %s vào giỏ hàng", amount, product.getName()));
//                    }
                } else {
                    cartItemDAO.delete(olditem);
                }
            } else if (olditems.size() == 0) {
                CartItem cartItem = new CartItem();
                cartItem.setId(cartItemId);
                cartItem.setAccount(curAccount);
                cartItem.setProduct(product);
                cartItem.setAmount(amount);
                cartItemDAO.save(cartItem);
                re.addFlashAttribute("message", String.format("Đã thêm %d %s vào giỏ hàng", amount, product.getName()));
            }

        } catch (Exception e) {
            System.out.println("loi them cart item" + e);
        }
        return "redirect:/" + ret;
    }

    @RequestMapping(value = "deleteitem/{id}", params = {"ret"})
    public String deleteItem(@PathVariable("id") int pid, @PathParam("ret") String ret) {
        Account curAccount = session.get("curaccount");
        cartItemDAO.deleteById(new CartItemId(curAccount.getId(), pid));
        return "redirect:/" + ret;
    }

    @RequestMapping(value = "deleteall", params = {"ret"})
    public String deleteall(@PathParam("ret") String ret) {
        Account curAccount = session.get("curaccount");
        cartItemDAO.deleteAllByAccount_Id(curAccount.getId());
        return "redirect:/" + ret;
    }
}
