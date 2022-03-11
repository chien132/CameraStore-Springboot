package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.*;
import com.chien.camerastore.service.SessionService;
import com.chien.camerastore.service.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/order/")
public class OrderController {

    @Autowired
    private SessionService session;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private BrandDAO brandDAO;
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private OrderDetailDAO orderDetailDAO;
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

    @ModelAttribute("orders")
    public List<Order> orders() {
        Account curAccount = session.get("curaccount");
        return orderDAO.findAllByAccount_Id(curAccount.getId());
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

    @PostMapping("addorder")
    public String addOrder(@RequestParam("payonlinecb") String payonlinecb, @ModelAttribute("order") Order order, RedirectAttributes re) {
        order.setAddress(order.getAddress().trim());
        order.setFullname(order.getFullname().trim());
        order.setPhone(order.getPhone().trim());
        order.setEmail(order.getEmail().trim());
        //check constraint
        String errormsg = "";
        if (order.getAddress().isEmpty()) {
            errormsg += "Hãy nhập địa chỉ";
        }
        if (order.getFullname().isEmpty()) {
            errormsg += " | Hãy nhập họ tên";
        }
        if (!Utils.isValidPhoneNumber(order.getPhone())) {
            errormsg += " | Số điện thoại không đúng định dạng";
        }
        if (!Utils.isValidEmail(order.getEmail())) {
            errormsg += " | Email không đúng định dạng";
        }
        if (errormsg.isEmpty()) {
            Account curAccount = session.get("curaccount");
            order.setAccount(curAccount);
            order.setConfirmed(false);
            order.setDone(false);
            order.setPaid(false);
            order.setPayonline(payonlinecb.equals("1"));
            orderDAO.save(order);
            List<CartItem> cartItems = cartItemDAO.findAllByAccount_Id(curAccount.getId());
            List<OrderDetail> orderDetails = new ArrayList<>();
            for (CartItem i : cartItems) {
                OrderDetail tmp = new OrderDetail();
                tmp.setOrder(order);
                tmp.setAmount(i.getAmount());
                tmp.setProduct(i.getProduct());
                tmp.setPrice(i.getProduct().getPrice() * (100 - i.getProduct().getDiscount()) / 100);
                orderDetails.add(tmp);
                orderDetailDAO.save(tmp);
            }
            order.setOrderDetails(orderDetails);
            orderDAO.save(order);
            cartItemDAO.deleteAllByAccount_Id(curAccount.getId());
            re.addFlashAttribute("message", "Đặt hàng thành công!");
        } else {
            re.addFlashAttribute("message", "Đặt hàng thất bại: " + errormsg);
        }
        return "redirect:/index";
    }

    @RequestMapping("viewall")
    public String viewAllOrder() {
        return "orderlist";
    }
}
