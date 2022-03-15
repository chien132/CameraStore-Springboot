package com.chien.camerastore.customercontroller;

import com.chien.camerastore.dao.*;
import com.chien.camerastore.model.*;
import com.chien.camerastore.service.SessionService;
import com.chien.camerastore.service.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
        Account curAccount = session.get("curaccount");
        List<CartItem> cartItems = cartItemDAO.findAllByAccount_Id(curAccount.getId());
        if (cartItems.size() < 1) {
            re.addFlashAttribute("message", "Giỏ hàng trống, hãy thêm sản phẩm!");
            return "redirect:/index";
        }

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
            order.setAccount(curAccount);
            order.setConfirmed(false);
            order.setDone(false);
            order.setPaid(false);
            order.setPayonline(payonlinecb.equals("1"));
            orderDAO.save(order);
            List<OrderDetail> orderDetails = new ArrayList<>();
            for (CartItem i : cartItems) {
                OrderDetailId tmpid = new OrderDetailId();
                tmpid.setOrder_id(order.getId());
                tmpid.setProduct_id(i.getProduct().getId());
                OrderDetail tmp = new OrderDetail();
                tmp.setId(tmpid);
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
            return "redirect:/cart/view";
        }
        return "redirect:/order/viewall";
    }

    @RequestMapping("viewall")
    public String viewAllOrder() {
        return "orderlist";
    }

    @RequestMapping("view/{id}")
    public String viewOrder(Model model, @PathVariable("id") int id, RedirectAttributes re) {
        if (orderDAO.findAllById(id).size() < 1) {
            re.addFlashAttribute("message", "Đơn hàng không tồn tại!!??");
            return "redirect:/order/viewall";
        }
        Order order = orderDAO.getById(id);
        Account curAccount = session.get("curaccount");
        if (curAccount.getId() != order.getAccount().getId()) {
            re.addFlashAttribute("message", "Bạn không có quyền xem đơn hàng này!");
            return "redirect:/order/viewall";
        }
        model.addAttribute("order", order);
        return "orderdetail";
    }

    @RequestMapping("confirm/{id}")
    public String confirmOrder(@PathVariable("id") int id, RedirectAttributes re) {
        if (orderDAO.findAllById(id).size() < 1) {
            re.addFlashAttribute("message", "Đơn hàng không tồn tại!");
            return "redirect:/admin/order/viewall";
        }
        Order order = orderDAO.getById(id);
        Account curAccount = session.get("curaccount");
        if (curAccount.getId() != order.getAccount().getId()) {
            re.addFlashAttribute("message", "Đơn hàng này không phải của bạn!");
            return "redirect:/admin/order/viewall";
        }
        order.setDone(true);
        orderDAO.save(order);
        re.addFlashAttribute("message", "Đã hoàn thành đơn hàng!");
        return "redirect:/order/view/" + id;
    }
}
