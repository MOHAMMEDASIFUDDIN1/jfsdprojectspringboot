package klu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import klu.model.Email;
import klu.model.EmailManager;

@RestController
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private EmailManager emailManager;

    @PostMapping("/send")
    public String send(@RequestBody Email email) {
        return emailManager.sendEmail(email.getFromemail(), email.getToemail(), email.getSubject(), email.getMessage());
    }
}