package com.nadeuli.member.service;

import com.nadeuli.member.repository.MailRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
 // 생성자 주입을 위한 Lombok 어노테이션
class MailServiceImpl implements MailService {

    @Autowired
    private  JavaMailSender mailSender;
    @Autowired
    private MailRepository mailRepository;

    //난수 발생 시키기
    public String createCode() {
        char[] chars = {
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd',
                'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
                '8', '9', '!', '@', '$'
        };
        Random random = new Random();
        StringBuilder key = new StringBuilder();
        int codeLength = 10; // 코드 길이를 상수로 설정하여 가독성을 높임
        for (int i = 0; i < codeLength; i++) {
            int index = random.nextInt(chars.length);
            key.append(chars[index]);
        }
        return key.toString();
    }

    // 이메일 형식을 생성하는 메서드
    public MimeMessage createEmailForm(String MEM_EMAIL, String authstr) throws MessagingException {

        String setFrom = "inhwan3596@gmail.com"; // 보내는 사람의 이메일 주소
        String title = "나들이 회원가입 인증 코드"; // 메일 제목

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom(setFrom); // 보내는 사람 설정
        helper.setTo(MEM_EMAIL); // email
        helper.setSubject(title); // 제목 설정

        // 메일 내용 설정
        String msgOfEmail = "<div style='margin:20px;'>"
                + "<h1> 회원가입 인증 코드 입니다 . . </h1>"
                + "<br>"
                + "<p>아래 코드를 입력해주세요<p>"
                + "<br>"
                + "<p>감사합니다.<p>"
                + "<br>"
                + "<div align='center' style='border:1px solid black; font-family:verdana';>"
                + "<h3 style='color:blue;'>나들이 인증 코드입니다.</h3>"
                + "<div style='font-size:130%'>"
                + "CODE : <strong>" + authstr + "</strong><div><br/> "
                + "</div>";

        helper.setText(msgOfEmail, true); // 메일 내용을 HTML 형식으로 설정
        return message;
    }

    // 이메일을 전송하는 메서드
    public String sendEmail(String MEM_EMAIL) {
        String authstr = createCode(); // 인증 코드 생성
        try {
            MimeMessage emailForm = createEmailForm(MEM_EMAIL, authstr);

            mailSender.send(emailForm); //
            mailRepository.authMailSave(MEM_EMAIL, authstr);
        } catch (MessagingException e) {
            e.printStackTrace();
            return null;
        }
        return authstr;
    }

    // 단순 텍스트 이메일을 전송하는 메서드
    public void sendSimpleEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to); // 수신자 설정
        message.setSubject(subject); // 제목 설정
        message.setText(text); // 본문 내용 설정
        mailSender.send(message); // 이메일 전송
    }


    /*****************************************
     * 이메일 찾기 코드
     */

    @Override
    public String sendPwdEmail(String MEM_EMAIL) {
        String pwdemail = createCode();
        try {
            MimeMessage emailForm = createEmailForm1(MEM_EMAIL, pwdemail);

            mailSender.send(emailForm); //
            mailRepository.findpwdemail(MEM_EMAIL, pwdemail);
        } catch (MessagingException e) {
            e.printStackTrace();
            return null;
        }
        return pwdemail;

    }
    public MimeMessage createEmailForm1(String MEM_EMAIL, String authstr) throws MessagingException {

        String setFrom = "inhwan3596@gmail.com"; // 보내는 사람의 이메일 주소
        String title = "나들이 비밀번호 찾기 코드입니다 . "; // 메일 제목

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom(setFrom); // 보내는 사람 설정
        helper.setTo(MEM_EMAIL); // email
        helper.setSubject(title); // 제목 설정

        // 메일 내용 설정
        String msgOfEmail = "<div style='margin:20px;'>"
                + "<h1> 비밀번호 찾기 코드 입니다 .  </h1>"
                + "<br>"
                + "<p>아래 코드를 입력해주세요<p>"
                + "<br>"
                + "<p>감사합니다.<p>"
                + "<br>"
                + "<div align='center' style='border:1px solid black; font-family:verdana';>"
                + "<h3 style='color:blue;'>나들이 인증 코드입니다.</h3>"
                + "<div style='font-size:130%'>"
                + "CODE : <strong>" + authstr + "</strong><div><br/> "
                + "</div>";

        helper.setText(msgOfEmail, true); // 메일 내용을 HTML 형식으로 설정
        return message;
    }

}


