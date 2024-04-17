package com.nadeuli.member.controller;

import com.nadeuli.member.dto.MemberRequestDTO;
import com.nadeuli.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    /**
     * 회원가입 form
     */
    @GetMapping("/memberJoinForm")
    public String memberJoinForm() {
        return "member/memberJoin";
    }

    /**
     * 아이디 유효성 검사
     */
    @ResponseBody
    @PostMapping("/checkId")
    public Map<String, String> checkId(@RequestBody Map<String, String> requestData) {
        String MEM_ID = requestData.get("MEM_ID");
        System.out.println("MemberController.checkId");
        System.out.println("MEM_ID = " + MEM_ID);

        Map<String, String> response = new HashMap<>();
        boolean checkIdResult = memberService.checkId(MEM_ID);

        if (checkIdResult) {
            response.put("status", "exist");
        } else {
            response.put("status", "non_exist");
        }
        return response;
    }

    /**
     * 이메일 휴효성 검사
     */
    @ResponseBody
    @PostMapping("/emailCheck")
    public Map<String, String> chekcEmail(@RequestBody Map<String, Object> map) {



        String MEM_EMAIL = (String) map.get("MEM_EMAIL");
        Map<String, String> EmailResult = new HashMap<>();
        boolean ChekcEmailResult = memberService.checkEmail(MEM_EMAIL);

        if (ChekcEmailResult) {
            EmailResult.put("status", "true");
        } else {
            EmailResult.put("status", "false");
        }
        return EmailResult;
    }

    /**
     * 회원가입
     */



    @ResponseBody
    @PostMapping("/memberJoin")
    public String memberJoin(@ModelAttribute MemberRequestDTO memberRequestDTO) {
        boolean memberJoinResult = memberService.memberJoin(memberRequestDTO);
        System.out.println("memberRequestDTO = " + memberRequestDTO);
        System.out.println("memberJoinResult = " + memberJoinResult);
        if (memberJoinResult) {
            return "가입성공";
        } else {
            return "가입실패";
        }
    }

    /*로그인 로직 */
    /*로그인 폼으로 가기*/
    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    /**
     * 로그인 기능
     */
    @ResponseBody
    @PostMapping("/login")
    public Map<String, Object> login(@ModelAttribute MemberRequestDTO memberRequestDTO,
                                     HttpSession session) {
        System.out.println(memberRequestDTO + " member login");
        session.removeAttribute("MEM_ID");
        // 새 세션 생성
        //session.invalidate(); -> 이 경우에는 httpresponse  사용 해야 한다 .
        //HttpSession newSession =response.getSession(true);

        boolean loginResult = memberService.login(memberRequestDTO);
        System.out.println(memberRequestDTO + " member login");

        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("loginResult", loginResult);
        System.out.println("loginResult = " + loginResult);
        if (loginResult) {
            // 로그인 성공 시, 새로운 세션에 사용자 ID 저장
            session.setAttribute("MEM_ID", memberRequestDTO.getMEM_ID());
            responseMap.put("MEM_ID", memberRequestDTO.getMEM_ID());
        }
        // 로그인 실패 시, 세션에 사용자 ID를 저장하지 않음
        System.out.println(session);
        return responseMap;
    }

    /**
     * // * 로그아웃 세션 없애기
     * // *
     */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 제거
        }
        return "redirect:/index";
    }

    /**
     * 아이디 찾기 로직
     */
    @GetMapping("/findId")
    public String findIdForm() {
        return "member/findId";
    }

    /**
     * 아이디 찾기
     */

    @PostMapping("/lostId")
    @ResponseBody
    public String lostId(@RequestBody MemberRequestDTO memberRequestDTO) {
        // 이름과 이메일을 사용하여 아이디 찾기
        String result = memberService.lostId(memberRequestDTO);
        return result;
    }




















    /**
     * 비밀번호 찾기 로직
     */
    @GetMapping("/findPwd")
    public String findPwdForm() {
        return "member/findPwd";
    }






    @GetMapping("/mailWindow")
    public String mailWidowForm(){
        return "/member/mailWindow";
    }

}






