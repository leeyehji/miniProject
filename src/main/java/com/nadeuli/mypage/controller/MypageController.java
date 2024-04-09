package com.nadeuli.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadeuli.mypage.dto.MemberDTO;
import com.nadeuli.mypage.service.MypageService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
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
    	//System.out.println(memId);
    	
    	MemberDTO memberDTO= mypageService.getUser(memId);
    	//System.out.println(memberDTO.getMem_joinDate());

		JSONObject jsonObj = new JSONObject();
        HashMap<String, Object> hash = new HashMap<>();
        
        Object member_id= memberDTO.getMem_id();
        Object member_name=memberDTO.getMem_name();
        Object member_phone=memberDTO.getMem_phone();
        Object member_email=memberDTO.getMem_email();
        Object member_gender=memberDTO.getMem_gender();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일'T'HH:mm:ss.SSSXXX");
        String tempDate = sdf.format(memberDTO.getMem_joinDate()); // Object 대신 String 사용
        String[] member_joinDate = tempDate.split("T"); // 'T'로 날짜와 시간 분리   
        
        hash.put("mem_id", member_id);
        hash.put("mem_name", member_name);
        hash.put("mem_phone", member_phone);
        hash.put("mem_email", member_email);
        hash.put("mem_gender", member_gender);
        hash.put("mem_joinDate", member_joinDate[0]);
        
        return hash; 
    }
    
    @GetMapping(value = "plzLogin")
    public String plzLogin() {
    	return "mypage/plzLogin";
    }
}
