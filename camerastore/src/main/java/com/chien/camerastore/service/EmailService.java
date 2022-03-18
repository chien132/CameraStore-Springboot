package com.chien.camerastore.service;

import com.chien.camerastore.model.Order;
import com.chien.camerastore.model.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {
    @Autowired
    public JavaMailSender emailSender;

    public String sentHTMLEmail(String to, String subject, String htmlMsg) {
        MimeMessage message = emailSender.createMimeMessage();

        boolean multipart = true;

        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(message, multipart, "utf-8");
            message.setContent(htmlMsg, "text/html; charset=UTF-8");
            helper.setTo(to);
            helper.setSubject(subject);
        } catch (MessagingException e) {
            return "Failed: " + e.getMessage();
        }
        this.emailSender.send(message);
        return "OK";
    }

    public String sentOrderEmail(Order order) {
        String htmlMsg = "<h2>CameraStore xin chào! </h2>"
                + "<p>Chúng tôi đã nhận được <a href=http://localhost:8080/order/view/" + order.getId()
                + ">đơn đặt hàng</a> của bạn, nhân viên cửa hàng sẽ sớm kiểm tra và xác nhận đơn hàng, dưới đây là thông tin đơn hàng</p>"
                + MyConstants.ORDER_TABLE_HEADER;
        for (OrderDetail o : order.getOrderDetails()) {
            htmlMsg += "<tr>\n" +
                    "      <td>" + o.getProduct().getName() + "</td>\n" +
                    "      <td>" + o.getPrice() + "</td>\n" +
                    "      <td>" + o.getAmount() + "</td>\n" +
                    "      <td>" + o.getAmount() * o.getPrice() + "</td>\n" +
                    "    </tr>";
        }
        htmlMsg += MyConstants.ORDER_TABLE_FOOTER;

        String subject = "CameraStore - Đã nhận đơn hàng #" + order.getId();
        return this.sentHTMLEmail(order.getAccount().getEmail(), subject, htmlMsg);
    }
}
