package com.chien.camerastore.service;

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
}
