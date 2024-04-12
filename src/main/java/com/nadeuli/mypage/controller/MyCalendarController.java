package com.nadeuli.mypage.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.service.MypageService;

@Controller
@RequestMapping(value = "mypage")
public class MyCalendarController {
	@Autowired
	private MypageService mypageService;

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
	public void write(@ModelAttribute CalDTO calDTO) {
		mypageService.calWrite(calDTO);
	}
	
	@PostMapping(value = "calList")
	@ResponseBody
	public List<Map<String, Object>> calList() {
		List<Map<String, Object>> listAll = mypageService.calList();   	
        return listAll;
	}
	
	@PostMapping("calUpdate")
	@ResponseBody
	public void calUpdate(@ModelAttribute CalDTO calDTO)  {
		mypageService.calUpdate(calDTO);
	}
	
	@PostMapping("calDelete")
	@ResponseBody
	public void calDelete(@RequestBody List<Map<String, Object>> param) throws ParseException {
		int cal_no=Integer.parseInt((String) param.get(0).get("cal_no"));
		mypageService.calDelete(cal_no);
	}
	
	@PostMapping(value = "myCalendarTxt")
	@ResponseBody
	public List<Map<String, Object>> myCalendarTxt(@RequestBody Map<String, Object> map){
	    List<Map<String, Object>> jsonArr = mypageService.getSchedule(map);//memId, selectDate
        return jsonArr;
	}
	
}
