package com.nadeuli.member.controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.nadeuli.member.dto.MemberRequestDTO;
import com.nadeuli.member.service.NaverLoginService;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class NaverController {

@Autowired
    private NaverLoginService naverLoginService;

    // 네이버 로그인 창으로 이동
    @GetMapping("/naverLogin")
    @ResponseBody
    public String naverLogin(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
        model.addAttribute("url", naverAuthUrl);
        return naverAuthUrl; // 네이버 로그인 페이지 URL을 포함한 로그인 페이지로 이동
    }

    // 네이버 로그인 성공 후 callback 처리
    @RequestMapping("/callback")
    public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        System.out.println("callback controller");

        try {
            OAuth2AccessToken accessToken = naverLoginService.getAccessToken(session, code, state);
            String apiResult = naverLoginService.getUserProfile(accessToken);

            System.out.println(apiResult);
            JSONObject jsonObj = new JSONObject(apiResult);
            JSONObject responseObj = jsonObj.getJSONObject("response");

            //임시 비밀번호 설정


            String email = responseObj.getString("email");
            String name= responseObj.getString("name");
            String gender= responseObj.getString("gender");
            String mobile = responseObj.getString("mobile");
            String id = responseObj.get("email").toString().split("@")[0];

//            NaverMemberDTO naverMemberDTO = new NaverMemberDTO();
//            //정보 받은거 셋팅
//             naverMemberDTO.setId(id);
//             naverMemberDTO.setEmail(email);
//             naverMemberDTO.setName(name);
//             naverMemberDTO.setGender(gender);
//             naverMemberDTO.setMobile(mobile);

             MemberRequestDTO memberDTO = new MemberRequestDTO();
             memberDTO.setMEM_ID(id);
             memberDTO.setMEM_NAME(name);
             memberDTO.setMEM_EMAIL(email);
             memberDTO.setMEM_PHONE(mobile);
             if (gender.equals("M")){
                memberDTO.setMEM_GENDER(1);
            }else{
                memberDTO.setMEM_GENDER(0);
            }


            MemberRequestDTO memberRequestDTO = naverLoginService.processOAuthUser(memberDTO);
             session.setAttribute("MEM_ID", memberRequestDTO.getMEM_ID());
            System.out.println("memberRequestDTO = " + memberRequestDTO.getMEM_ID());
//            mav.addObject("memberEmail", mem_email);
            mav.setViewName("redirect:/"); // 로그인 후 리다이렉트할 페이지 설정
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "로그인 과정에서 문제가 발생했습니다. 다시 시도해주세요."); // 사용자에게 보여줄 에러 메시지
            mav.setViewName("error"); // 에러 페이지로 리다이렉트
        }

        return mav;
    }
}
