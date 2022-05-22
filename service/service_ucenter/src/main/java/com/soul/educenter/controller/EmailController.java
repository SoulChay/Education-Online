package com.soul.educenter.controller;

import com.soul.commonutils.response.R;
import com.soul.educenter.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/educenter")
public class EmailController {

    @Autowired
    private EmailService emailService;

    @GetMapping("email/{sendTo}")
    public R send(@PathVariable String sendTo){
        return emailService.sendSimpleMail(sendTo);
    }

}
