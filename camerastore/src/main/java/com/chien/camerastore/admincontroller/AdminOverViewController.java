package com.chien.camerastore.admincontroller;

import com.chien.camerastore.dao.OrderDAO;
import com.chien.camerastore.dao.ProductDAO;
import com.chien.camerastore.model.Order;
import com.chien.camerastore.model.OrderDetail;
import com.chien.camerastore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/admin/")
public class AdminOverViewController {
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private OrderDAO orderDAO;

    @ModelAttribute("products")
    public List<Product> products() {
        return productDAO.findAll();
    }

    @RequestMapping("overview")
    public String index(Model model, RedirectAttributes re,
                        @RequestParam(name = "type", required = false, defaultValue = "number") String type,
                        @RequestParam(name = "from", required = false, defaultValue = "2000-01-01") String fromstr,
                        @RequestParam(name = "to", required = false, defaultValue = "3000-01-01") String tostr) {
        Date from = null;
        Date to = null;
        try {
            from = new SimpleDateFormat("yyyy-MM-dd").parse(fromstr);
            to = new SimpleDateFormat("yyyy-MM-dd").parse(tostr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("\n" + type);
        System.out.println(from);
        System.out.println(to);

        List<Order> orders = orderDAO.findAllByCreatedateBetween(from, to);
        System.out.println(orders.size());
        int waiting = 0;
        int delivering = 0;
        int done = 0;
        int denied = 0;

        long doneValue = 0;
        long deliveringValue = 0;

        List<Product> products = new ArrayList<>();

        for (Order i : orders) {
            for (OrderDetail j : i.getOrderDetails()) {
                if (!products.contains(j.getProduct())) {
                    products.add(j.getProduct());
                }
            }
            switch (i.getStatus()) {
                case "denied":
                    denied++;
                    break;
                case "waiting":
                    waiting++;
                    break;
                case "delivering":
                    delivering++;
                    deliveringValue += i.getValue();
                    break;
                case "done":
                    done++;
                    doneValue += i.getValue();
                    break;
            }
        }
        Collections.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                if (p1.getSoldInOrders(orders) > p2.getSoldInOrders(orders)) {
                    return -1;
                } else if (p1.getSoldInOrders(orders) == p2.getSoldInOrders(orders)) {
                    return 0;
                } else {
                    return 1;
                }
            }
        });
        for (int i = 0; i < 3; i++) {
            if (products.size() > i) {
                System.out.println(products.get(i).getName() + products.get(i).getSoldInOrders(orders));
                model.addAttribute("top" + (i + 1), products.get(i));
                model.addAttribute("top" + (i + 1) + "num", products.get(i).getSoldInOrders(orders));
            }
        }

        model.addAttribute("total", orders.size());
        model.addAttribute("waiting", waiting);
        model.addAttribute("delivering", delivering);
        model.addAttribute("deliveringValue", deliveringValue);
        model.addAttribute("done", done);
        model.addAttribute("doneValue", doneValue);
        model.addAttribute("denied", denied);
        model.addAttribute("from", fromstr);
        if (!tostr.equals("3000-01-01")) {
            model.addAttribute("to", tostr);

        }

        return "admin/overview";
    }
}
