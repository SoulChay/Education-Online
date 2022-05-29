package com.soul.educenter.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


/**
 * @version 1.0
 * @create 04-16-16:01
 */

@Component
public class EmailConfig {

    @Value("${spring.mail.username}")
    private String emailFrom;

    public String getEmailFrom() {
        return emailFrom;
    }



}


