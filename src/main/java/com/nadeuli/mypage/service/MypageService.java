package com.nadeuli.mypage.service;

import java.util.List;

import com.nadeuli.mypage.dto.CalDTO;

public interface MypageService {

	public void calWrite(CalDTO calDTO);

	public List<CalDTO> calList();

	public void calDelete(int calDTO);

	public void calUpdate(CalDTO calDTO);


}
