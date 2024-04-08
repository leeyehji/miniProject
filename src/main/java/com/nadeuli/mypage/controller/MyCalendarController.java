package com.nadeuli.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.service.MypageService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "mypage")
public class MyCalendarController {
	@Autowired
	private MypageService mypageService;
    private static final Logger log = LoggerFactory.getLogger(MyCalendarController.class);

    
	@GetMapping(value = "myCalendar")
	public String myCalendar() {
		//DB
		
		return "mypage/myCalendar";
	}
	@GetMapping(value = "myCalendarWrite")
	public String myCalendarWrite() {
		//DB
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
		List<CalDTO> listAll = mypageService.calList();
    	
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		
        HashMap<String, Object> hash = new HashMap<>();
        
        System.out.println("MyCalendarController calList");
        for (int i = 0; i < listAll.size(); i++) {
        	//System.out.println("title:"+listAll.get(i).getCal_title());
        	//2022-02-19T03:05:49.275+00:00 형식이 되도록
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        	//SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        	Object start=sdf.format(listAll.get(i).getCal_startDate()); 
        	//System.out.println("start:"+start);
        	
        	Object end=sdf.format(listAll.get(i).getCal_endDate()); 
        	//System.out.println("end:"+end);
        	Object color = listAll.get(i).getCal_color();
        	//System.out.println(color);
        	Object id = listAll.get(i).getCal_no();
            hash.put("title", listAll.get(i).getCal_title());
            hash.put("start", start);
            hash.put("end", end);
            hash.put("description",listAll.get(i).getCal_memo() );
            hash.put("color", color);//borderColor, backgroundColor 동일하게
            hash.put("id", id);
            //textColor
            jsonObj = JSONObject.fromObject(hash);;
            jsonArr.add(jsonObj);
        }
        log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr;
	}
	
	@PostMapping("calUpdate")
	@ResponseBody
	public void calUpdate(@ModelAttribute CalDTO calDTO)  {
		//System.out.println(calDTO.getCal_color());
		mypageService.calUpdate(calDTO);
	}
	
	@PostMapping("calDelete")
	@ResponseBody
	public void calDelete(@RequestBody List<Map<String, Object>> param) throws ParseException {
		for (int i = 0; i < param.size(); i++) {//배열로 가져오긴 했지만 한번에 하나씩만 삭제 가능하게 할 듯.
			int cal_no=Integer.parseInt((String) param.get(i).get("cal_no"));
			mypageService.calDelete(cal_no);
		}
	}
	
}
