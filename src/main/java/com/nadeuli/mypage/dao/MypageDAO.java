package com.nadeuli.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;

@Mapper
public interface MypageDAO {

	public void calWrite(CalDTO calDTO);

	public List<CalDTO> calList();

	public void calDelete(int cal_no);

	public void calUpdate(CalDTO calDTO);

	public void memberUpdate(MemberDTO memberDTO);

	public MemberDTO getUser(String memId);

	public List<CalDTO> getSchedule(Map<String, Object> map);

}
