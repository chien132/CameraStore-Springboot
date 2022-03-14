package com.chien.camerastore;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
public class IndexController {
    @RequestMapping("/ckfinder.html")
    public void index(HttpServletResponse response) {
        //Redirect to CKFinder's samples.
        response.setHeader("Location", "/ckfinder/static/ckfinder.html");
        response.setStatus(302);
    }
}