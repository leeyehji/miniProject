package com.nadeuli.mypage.service;

import java.util.List;
import java.util.Map;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;

public interface MypageService {

	public void calWrite(CalDTO calDTO);

	public List<CalDTO> calList();

	public void calDelete(int calDTO);

	public void calUpdate(CalDTO calDTO);

	public void update(MemberDTO memberDTO);

	public MemberDTO getUser(String memId);

	public List<CalDTO> getSchedule(Map<String, Object> map);


}
