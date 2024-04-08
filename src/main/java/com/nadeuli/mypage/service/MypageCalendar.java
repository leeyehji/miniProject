package com.nadeuli.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadeuli.mypage.dao.MypageDAO;
import com.nadeuli.mypage.dto.CalDTO;

@Service
public class MypageCalendar implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public void calWrite(CalDTO calDTO) {
		mypageDAO.calWrite(calDTO);
	}//write
	
	@Override
	public List<CalDTO> calList() {
		List<CalDTO> calList= mypageDAO.calList();
		return calList;
	}
	@Override
	public void calDelete(int cal_no) {
		mypageDAO.calDelete(cal_no);
		
	}
	@Override
	public void calUpdate(CalDTO calDTO) {
		mypageDAO.calUpdate(calDTO);
		
	}
	
}
