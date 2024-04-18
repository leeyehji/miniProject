package com.nadeuli.serviceCenter.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface ServiceCenterMailService {

    // 이메일 형식을 생성하는 메서드
    MimeMessage createEmailForm(String MEM_EMAIL, String MEM_NAME, String q_Content) throws MessagingException;

    String sendEmail(String MEM_EMAIL);

    MimeMessage createEmailForm(String to, String MEM_NAME, String q_Content, boolean isCustomer) throws MessagingException;

    MimeMessage createEmailForm(String to, String MEM_NAME, String q_Content, boolean isCustomer, String MEM_EMAIL) throws MessagingException;

    boolean sendInquiryEmail(String MEM_EMAIL, String MEM_NAME, String q_Content);
}
