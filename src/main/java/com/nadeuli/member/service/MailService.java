package com.nadeuli.member.service;


import java.util.Map;

public interface MailService {

    String sendEmail(String MEM_EMAIL);

    void sendSimpleEmail(String to, String subject, String text);


    String sendPwdEmail(String MEM_EMAIL);


    String JoinVerification(String verification, String memEmail);


    String getMyPwd(Map<String,Object> map);
}
