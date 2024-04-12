package com.nadeuli.mypage.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nadeuli.mypage.dto.MemberDTO;
import com.nadeuli.mypage.service.MypageService;


@Controller
@RequestMapping(value = "mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;

	@PostConstruct
    public void started() {
    	//GMT -> KST
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
        System.out.println(new Date());
    }
	
	@GetMapping(value = "mypage")
    public String mypage() {
    	return "mypage/mypage";
    }
    
    @GetMapping(value="memberUpdate")
    public String memberUpdate() {
    	return "mypage/memberUpdate";
    }
    
    @PostMapping(value="memberUpdateForm")
    @ResponseBody
    public void memberUpdateDB(@ModelAttribute MemberDTO memberDTO) {
    	System.out.println(memberDTO);
    	mypageService.update(memberDTO);
    }
    
    @PostMapping(value = "getUser")
    @ResponseBody
    public Map<String, Object> getUser(@RequestParam String memId) {    	
    	HashMap<String, Object> hash = mypageService.getUser(memId);
        return hash; 
    }
    
    @GetMapping(value = "plzLogin")
    public String plzLogin() {
    	return "mypage/plzLogin";
    }
    
    @PostMapping(value = "getProfile")
    @ResponseBody
    public MemberDTO getProfile(@RequestParam String memId){
    	return mypageService.getUserDTO(memId);
    }
    
    @PostMapping(value = "uploadProfile")
    @ResponseBody
    public void uploadProfile(@RequestParam String memId
    						,HttpSession httpSession
    						,@RequestParam MultipartFile img){
    	
    	MemberDTO memberDTO = mypageService.getUserDTO(memId);
    	//기존 프로필 사진 ncp에서 삭제
    	mypageService.deleteProfile(memberDTO);
    	//파일 용량 제한
    	
    	//DB에는 파일 이름만 저장.
    	mypageService.setProfileImg(memberDTO, httpSession, img);
    }
    
    @PostMapping(value = "deleteProfile")
    @ResponseBody
    public void deleteProfile(@RequestParam String memId) {
    	MemberDTO memberDTO = mypageService.getUserDTO(memId);
    	mypageService.deleteProfile(memberDTO);
    }
}
