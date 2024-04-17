package com.nadeuli.member.service;



public interface MailService {

    String sendEmail(String MEM_EMAIL);

    void sendSimpleEmail(String to, String subject, String text);

//    String Emailcheck(String memEmail, String authCode, String authok);
}
