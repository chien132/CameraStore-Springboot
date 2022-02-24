package com.chien.camerastore.interceptor;

import com.chien.camerastore.model.Account;
import com.chien.camerastore.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class AdminInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {


//        HttpSession session = request.getSession();
//        if (session.getAttribute("user") == null) {
//            response.sendRedirect(request.getContextPath() + "/login");
//            System.out.println("Khong co user");
//            return false;
//        }else {
//            Account account = (Account) session.getAttribute("user");
//            if (!account.isAdmin()) {
//                response.sendRedirect(request.getContextPath() + "/index");
//                System.out.println("User khong phai admin");
//                return false;
//            }
//        }
//        System.out.println("hail admin");
//        return true;


        String uri = request.getRequestURI();
        Account account = session.get("curaccount");
        String error = "";
        if (account == null) {
            error = "Vui lòng đăng nhập!";
//            System.out.println(error);
//            session.set("security-uri", uri);
//            response.sendRedirect("/login?error=" + error);
        }
        else if (!account.isAdmin() && uri.startsWith("/admin")) {
            error = "Không có quyền truy cập!";
//            System.out.println(error);
//            session.set("security-uri", uri);
//            response.sendRedirect("/login?error=" + error);
        }
        if(error.length() > 0) {
            session.set("security-uri", uri);
            response.sendRedirect("/login?error=" + error);
            return false;
        }
        return true;

    }
}
