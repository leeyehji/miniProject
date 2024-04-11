package com.nadeuli.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;

public interface MypageService {

	public void calWrite(CalDTO calDTO);

	public List<Map<String, Object>> calList();

	public void calDelete(int calDTO);

	public void calUpdate(CalDTO calDTO);

	public void update(MemberDTO memberDTO);

	public HashMap<String, Object> getUser(String memId);

	public List<Map<String, Object>> getSchedule(Map<String, Object> map);

	public void setProfileImg(MemberDTO memberDTO
								,HttpSession httpSession
								,MultipartFile img);

	public void deleteProfile(MemberDTO memberDTO);

	MemberDTO getUserDTO(String memId);


}
