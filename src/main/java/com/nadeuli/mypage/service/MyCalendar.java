package com.nadeuli.mypage.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadeuli.mypage.dao.MyCalendarDAO;
import com.nadeuli.mypage.dto.CalDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class MyCalendar implements MyCalendarService {
	@Autowired
	private MyCalendarDAO myCalendarDAO;
	
	@Override
	public void calWrite(CalDTO calDTO) {
		myCalendarDAO.calWrite(calDTO);
	}//write
	
	@Override
	public List<Map<String, Object>> calList() {
		List<CalDTO> listAll= myCalendarDAO.calList();
		
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		
        HashMap<String, Object> hash = new HashMap<>();
        
        //System.out.println("MyCalendarController calList");
        for (int i = 0; i < listAll.size(); i++) {
        	//System.out.println("title:"+listAll.get(i).getCal_title());
        	//2022-02-19T03:05:49.275+00:00 형식이 되도록
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        	//SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        	Object start=sdf.format(listAll.get(i).getCal_startDate()); 
        	
        	Object end=sdf.format(listAll.get(i).getCal_endDate()); 
        	Object color = listAll.get(i).getCal_color();
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
        //log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr;
	}
	
	@Override
	public void calDelete(int cal_no) {
		myCalendarDAO.calDelete(cal_no);	
	}
	
	@Override
	public void calUpdate(CalDTO calDTO) {
		myCalendarDAO.calUpdate(calDTO);
	}

}
