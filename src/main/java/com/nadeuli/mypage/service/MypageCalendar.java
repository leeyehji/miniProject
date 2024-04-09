package com.nadeuli.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadeuli.mypage.dao.MypageDAO;
import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;

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
	
	@Override
	public void update(MemberDTO memberDTO) {
		mypageDAO.memberUpdate(memberDTO);
	}
	
	@Override
	public MemberDTO getUser(String memId) {
		return mypageDAO.getUser(memId);
	}
	
	@Override
	public List<CalDTO> getSchedule(Map<String, Object> map) {
		return mypageDAO.getSchedule(map);
	}
}
