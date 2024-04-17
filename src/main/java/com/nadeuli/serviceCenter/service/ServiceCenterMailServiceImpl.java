package com.nadeuli.serviceCenter.service;

import com.nadeuli.member.repository.MailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class ServiceCenterMailServiceImpl implements ServiceCenterMailService {

    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private MailRepository mailRepository;

    @Override
    public MimeMessage createEmailForm(String MEM_EMAIL, String MEM_NAME, String qContent) throws MessagingException {
        String setFrom = "961020jyc@gmail.com"; // 서버 이메일 주소로 변경
        String replyTo = MEM_EMAIL; // 답장 받을 고객의 이메일 주소
        String to = "961020jyc@gmail.com"; // 관리자 이메일 주소
        String title = "나들이 고객 1:1 문의"; // 메일 제목

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom(setFrom);
        helper.setReplyTo(replyTo); // 답장 받을 주소 설정
        helper.setTo(to);
        helper.setSubject(title);


        String msgOfEmail = "<div style='margin:20px;'>"
                + "<h1>고객 1:1 문의 내용입니다.</h1>"
                + "<br>"
                + "<div id='inquiryContent' style='font-family:Arial, sans-serif;'>"
                + "<h2>고객 문의</h2>"
                + "<div>"
                + "<p><strong>이름:</strong> " + MEM_NAME + "</p>"
                + "<p><strong>고객 이메일:</strong> " + MEM_EMAIL + "</p>"
                + "<p><strong>문의 내용:</strong></p>"
                + "<p>" + qContent + "</p>"
                + "</div>"
                + "</div>"
                + "</div>";

        helper.setText(msgOfEmail, true);
        return message;
    }

    @Override
    public String sendEmail(String MEM_EMAIL) {
        return "";
    }

    @Override
    public boolean sendInquiryEmail(String MEM_EMAIL, String MEM_NAME, String qContent) {
        try {
            MimeMessage message = createEmailForm(MEM_EMAIL, MEM_NAME, qContent); // 이메일 폼 생성
            mailSender.send(message); // 생성된 메일 폼을 이용하여 메일 전송
            return true; // 이메일 전송 성공
        } catch (MessagingException e) {
            e.printStackTrace();
            return false; // 이메일 전송 실패
        }
    }
}