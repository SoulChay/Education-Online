package com.soul.educenter.service;


import com.soul.commonutils.response.R;

public interface EmailService {

    /**
     * 发送简单邮件
     * @param sendTo  收件人地址
     */
    R sendSimpleMail(String sendTo);



}
