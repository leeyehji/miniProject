package com.nadeuli.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadeuli.mypage.dto.CalDTO;

@Mapper
public interface MyCalendarDAO {
	
	public void calWrite(CalDTO calDTO);

	public List<CalDTO> calList();

	public void calDelete(int cal_no);

	public void calUpdate(CalDTO calDTO);
}
