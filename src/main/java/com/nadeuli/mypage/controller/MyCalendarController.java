package com.nadeuli.mypage.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.service.MyCalendarService;

@Controller
@RequestMapping(value = "mypage")
public class MyCalendarController {
	@Autowired
	private MyCalendarService myCalendarService;

    @PostConstruct
    public void started() {
    	//GMT -> KST
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
        System.out.println(new Date());
    }
    
	@GetMapping(value = "myCalendar")
	public String myCalendar() {
		return "mypage/myCalendar";
	}
	
	@GetMapping(value = "myCalendarWrite")
	public String myCalendarWrite() {
		return "mypage/myCalendarWrite";
	}
	
	@PostMapping(value = "calWrite")
	@ResponseBody
	public void write(@ModelAttribute CalDTO calDTO, HttpSession session) {
		String memId = (String) session.getAttribute("MEM_ID");
		calDTO.setMem_id(memId);
		myCalendarService.calWrite(calDTO);
	}
	
	@PostMapping(value = "calList")
	@ResponseBody
	public List<Map<String, Object>> calList(HttpSession session) {
		String memId = (String) session.getAttribute("MEM_ID");
		List<Map<String, Object>> listAll = myCalendarService.calList(memId);   	
        return listAll;
	}
	
	@PostMapping("calUpdate")
	@ResponseBody
	public void calUpdate(@ModelAttribute CalDTO calDTO)  {
		myCalendarService.calUpdate(calDTO);
	}
	
	@PostMapping("calDelete")
	@ResponseBody
	public void calDelete(@RequestBody List<Map<String, Object>> param) throws ParseException {
		int cal_no=Integer.parseInt((String) param.get(0).get("cal_no"));
		myCalendarService.calDelete(cal_no);
	}
	
	
}
