package com.nadeuli.member.controller;


import com.nadeuli.member.dto.MemberRequestDTO;
import com.nadeuli.member.service.MailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Member;
import java.util.Map;

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

    /**
     * 회원정보 확인하기
     */
    @ResponseBody
    @PostMapping("passwordEmail")
    public String passwordEmail(@RequestParam(value = "MEM_EMAIL") String MEM_EMAIL, @RequestParam(value = "verification") String verification) {

        System.out.println("MEM_EMAIL = " + MEM_EMAIL);
        System.out.println(verification);
        String verificationCode = mailService.JoinVerification(verification, MEM_EMAIL);
        System.out.println("MEM_EMAIL = " + MEM_EMAIL + ", verification = " + verification);

        return verificationCode;
    }

    /*
    * 비밀번호 찾기
//    * */

    @ResponseBody
    @PostMapping("lostPwd")
    public String lostPwd(@RequestBody Map<String,Object> map) {
        System.out.println(map.get("verification"));
        String MEM_EMAIL = (String) map.get("MEM_EMAIL");
        String MEM_ID = (String) map.get("MEM_ID");
        String MEM_NAME = (String) map.get("MEM_NAME");
        System.out.println("MEM_NAME = " + MEM_NAME);

        String myPwd = mailService.getMyPwd(map);

        System.out.println(myPwd);

        return myPwd;
    }

    @PostMapping("findPwd")
    public String findPwd(@ModelAttribute MemberRequestDTO memberRequestDTO){
        String findPWdCod = mailService.sendPwdEmail(memberRequestDTO.getMEM_EMAIL());
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