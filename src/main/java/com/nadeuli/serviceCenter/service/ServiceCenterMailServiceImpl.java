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

    // 관리자 이메일 주소를 상수로 선언합니다.
    private static final String ADMIN_EMAIL = "961020jyc@gmail.com";

    @Override
    public MimeMessage createEmailForm(String to, String MEM_NAME, String q_Content, boolean isCustomer, String MEM_EMAIL) throws MessagingException {
        String setFrom = isCustomer ? ADMIN_EMAIL : MEM_EMAIL; // 발신자 이메일 주소 변경
        String title = isCustomer ? "나들이 고객 1:1 문의 확인" : "나들이 고객 1:1 문의"; // 메일 제목

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom(setFrom);
        helper.setTo(to);
        helper.setSubject(title);

        String msgOfEmail;
        if (isCustomer) {
            // 고객에게 보낼 이메일 내용
            msgOfEmail = "<div style='margin:20px;'>"
                    + "<h1>귀하의 문의가 접수되었습니다.</h1>"
                    + "<br>"
                    + "<div style='font-family:Arial, sans-serif;'>"
                    + "<p>문의 내용:</p>"
                    + "<p>" + q_Content + "</p>"
                    + "</div>"
                    + "</div>";
        } else {
            // 관리자에게 보낼 이메일 내용
            msgOfEmail = "<div style='margin:20px;'>"
                    + "<h1>고객 1:1 문의 내용입니다.</h1>"
                    + "<br>"
                    + "<div id='inquiryContent' style='font-family:Arial, sans-serif;'>"
                    + "<h2>고객 문의</h2>"
                    + "<div>"
                    + "<p><strong>이름:</strong> " + MEM_NAME + "</p>"
                    + "<p><strong>고객 이메일:</strong> " + MEM_EMAIL + "</p>" // 'to' 대신 'MEM_EMAIL' 사용
                    + "<p><strong>문의 내용:</strong></p>"
                    + "<p>" + q_Content + "</p>"
                    + "</div>"
                    + "</div>"
                    + "</div>";
        }

        helper.setText(msgOfEmail, true);
        return message;
    }

    @Override
    public boolean sendInquiryEmail(String MEM_EMAIL, String MEM_NAME, String q_Content) {
        try {
            // 관리자에게 이메일 전송
            MimeMessage messageToAdmin = createEmailForm(ADMIN_EMAIL, MEM_NAME, q_Content, false, MEM_EMAIL);
            mailSender.send(messageToAdmin);

            // 고객에게 이메일 전송
            MimeMessage messageToCustomer = createEmailForm(MEM_EMAIL, MEM_NAME, q_Content, true, MEM_EMAIL);
            mailSender.send(messageToCustomer);

            return true; // 이메일 전송 성공
        } catch (MessagingException e) {
            e.printStackTrace();
            return false; // 이메일 전송 실패
        }
    }

    @Override
    public MimeMessage createEmailForm(String MEM_EMAIL, String MEM_NAME, String q_Content) throws MessagingException {
        return null;
    }

    @Override
    public String sendEmail(String MEM_EMAIL) {
        // 구현되지 않은 메서드
        return "";
    }

    @Override
    public MimeMessage createEmailForm(String to, String MEM_NAME, String q_Content, boolean isCustomer) throws MessagingException {
        return null;
    }
}