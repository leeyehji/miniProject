package com.nadeuli.mypage.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nadeuli.mypage.dto.MemberDTO;
import com.nadeuli.mypage.service.MypageService;
import com.nadeuli.review.bean.ReviewDTO;


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
    public String mypage(HttpSession session) {
		System.out.println("mypage 접근 - 아이디: "+session.getAttribute("MEM_ID"));
    	return "mypage/mypage";
    }
    
    @GetMapping(value="memberUpdate")
    public String memberUpdate() {
    	return "mypage/memberUpdate";
    }
    
    /*내가 작성한 글*/
    @GetMapping(value="myBoard")
    public String myBoard(HttpServletRequest request,HttpSession session) { //id 내놔
    	return "review/reviewList";
    }
    
    
    /* mypage 내 로그인 여부 검사용*/
    @PostMapping(value = "getMemId")
    @ResponseBody
    public String getMemId(HttpSession session) {
    	String mem_id = (String) session.getAttribute("MEM_ID");
    	return mem_id;
    }
    
    /*내가 작성한 글 목록 보여주기*/
    @PostMapping(value="getReviewList")
    @ResponseBody
    public Map<String, Object> getMyBoardList(@RequestParam(value="pg",
            required = false, defaultValue="1") String pg, HttpSession session){
    	String mem_id = (String) session.getAttribute("MEM_ID");
    	System.out.println(mem_id + ", "+pg);
        Map<String,Object> myBoardListMap =mypageService.getMyBoardList(pg, mem_id);
        session.setAttribute("totalA",myBoardListMap.get("totalA"));
        
        return myBoardListMap;
    }
    
    /* board 클릭 시 대표 글로 결정. */
    @GetMapping(value ="reviewView")
    public String setBestReview(@RequestParam(value="no")String no, HttpSession session){
    	System.out.println("대표글 클릭 no: "+no);
    	String mem_id = (String) session.getAttribute("MEM_ID");
    	mypageService.setBestReview(no, mem_id);
    	return "mypage/mypage";
    }
    
    @PostMapping(value="memberUpdateForm")
    @ResponseBody
    public void memberUpdateDB(@ModelAttribute MemberDTO memberDTO) {
    	System.out.println(memberDTO);
    	mypageService.update(memberDTO);
    }
    
    @PostMapping(value = "getUser")
    @ResponseBody
    public Map<String, Object> getUser(HttpSession session) {   
    	String memId = (String) session.getAttribute("MEM_ID");
    	HashMap<String, Object> hash = mypageService.getUser(memId);
        return hash; 
    }
    
    @GetMapping(value = "plzLogin")
    public String plzLogin() {
    	return "mypage/plzLogin";
    }
    
    @PostMapping(value = "getProfile")
    @ResponseBody
    public MemberDTO getProfile(HttpSession session){
    	String memId = (String) session.getAttribute("MEM_ID");
    	return mypageService.getUserDTO(memId);
    }
    
    @PostMapping(value = "uploadProfile")
    @ResponseBody
    public void uploadProfile(HttpSession session
    						,@RequestParam MultipartFile img){
    	String memId = (String) session.getAttribute("MEM_ID");
    	MemberDTO memberDTO = mypageService.getUserDTO(memId);
    	//기존 프로필 사진 ncp에서 삭제
    	mypageService.deleteProfile(memberDTO);
    	mypageService.setProfileImg(memberDTO, session, img);
    }
    
    @PostMapping(value = "deleteProfile")
    @ResponseBody
    public void deleteProfile(HttpSession session) {
    	String memId = (String) session.getAttribute("MEM_ID");
    	MemberDTO memberDTO = mypageService.getUserDTO(memId);
    	mypageService.deleteProfile(memberDTO);
    }
    
    @PostMapping(value = "myCalendarTxt")
	@ResponseBody
	public List<Map<String, Object>> myCalendarTxt(@RequestBody Map<String, Object> map, HttpSession session){
    	String memId = (String) session.getAttribute("MEM_ID");
    	map.put("memId", memId);
	    List<Map<String, Object>> jsonArr = mypageService.getSchedule(map);//memId, selectDate
        return jsonArr;
	}
    
    @PostMapping(value = "getMyBest")
    @ResponseBody
    public ReviewDTO myBest(HttpSession session){
    	String memId = (String) session.getAttribute("MEM_ID");
    	return mypageService.getMyBest(memId);
    }
    
    @PostMapping(value = "deleteMyBoard")
    @ResponseBody
    public void deleteMyBoard(HttpSession session) {
    	String memId = (String) session.getAttribute("MEM_ID");
    	mypageService.deleteMyBoard(memId);
    }
}
