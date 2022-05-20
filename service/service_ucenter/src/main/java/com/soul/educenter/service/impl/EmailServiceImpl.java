package com.soul.educenter.service.impl;


import com.soul.commonutils.response.R;
import com.soul.educenter.config.EmailConfig;
import com.soul.educenter.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailConfig emailConfig;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;


    @Override
    public R sendSimpleMail(String sendTo) {
        SimpleMailMessage message = new SimpleMailMessage();

        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            code.append((int)(Math.random()*9));
        }

        String title = "登录验证";
        String content = "您好，您的验证码为 : " + code;
        String email = emailConfig.getEmailFrom();

        message.setFrom(email);
        message.setTo(sendTo);
        message.setSubject(title);
        message.setText(content);

        mailSender.send(message);//发送邮件

        //存到redis中
        redisTemplate.opsForValue().set(email,code.toString(),5, TimeUnit.MINUTES);

        return R.ok().message("验证码已发送，5分钟内有效");

    }


}
