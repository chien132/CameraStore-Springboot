package com.chien.camerastore.customercontroller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

//@Controller
//public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {
//    @RequestMapping("/error")
//    public String handleError(HttpServletRequest request, RedirectAttributes re) {
//        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
//
//        if (status != null) {
//            Integer statusCode = Integer.valueOf(status.toString());
//
//            if (statusCode == HttpStatus.NOT_FOUND.value()) {
//                re.addFlashAttribute("message", "Trang bạn yêu cầu không tồn tại!");
//                return "redirect:/index";
//            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
//                return "error-500";
//            }
//
//        }
//        return "error";
//    }
//}
