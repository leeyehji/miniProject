package com.nadeuli.member.controller;


import com.nadeuli.member.service.MailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/member")
public class MailController {
    @Autowired
    private MailService mailService;

    //회원가입 이메일 발송
    @PostMapping("/sendAuthCode")
    @ResponseBody
    public String sendAuthCode(@RequestParam String MEM_EMAIL) {
        System.out.println("MEM_EMAIL = " + MEM_EMAIL);
        String authCode = mailService.sendEmail(MEM_EMAIL);
        if (authCode != null) {
            return "인증 코드가 전송되었습니다: " + authCode;
        } else {
            return "이메일 전송에 실패하였습니다.";
        }
    }

    @PostMapping("findPwd")
    public String findPwd(@RequestParam String MEM_EMAIL){
        String findPWdCod = mailService.sendPwdEmail(MEM_EMAIL);
        if(findPWdCod != null){
            return findPWdCod;
        }return "email 전송 실패 ";
    }




//단순 이메일 발송
    @PostMapping("/sendSimpleEmail")
    public String sendSimpleEmail(@RequestParam String to, @RequestParam String subject, @RequestParam String text) {
        try {
            mailService.sendSimpleEmail(to, subject, text);
            return "이메일이 성공적으로 전송되었습니다.";
        } catch (Exception e) {
            return "이메일 전송에 실패하였습니다.";
        }
    }

}