package com.nadeuli.mypage.service;

import java.util.List;
import java.util.Map;

import com.nadeuli.mypage.dto.CalDTO;

public interface MyCalendarService {
	
	public void calWrite(CalDTO calDTO);

	public List<Map<String, Object>> calList(String memId);

	public void calDelete(int calDTO);

	public void calUpdate(CalDTO calDTO);
}
