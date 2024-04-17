package com.nadeuli.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nadeuli.mypage.dto.CalDTO;
import com.nadeuli.mypage.dto.MemberDTO;
import com.nadeuli.review.bean.ReviewDTO;

@Mapper
public interface MypageDAO {
	public void memberUpdate(MemberDTO memberDTO);

	public MemberDTO getUser(String memId);

	public List<CalDTO> getSchedule(Map<String, Object> map);

	public void setProfileImg(MemberDTO memberDTO);

	public void deleteFile(MemberDTO memberDTO);

	public List<ReviewDTO> getMyBoardList(Map<String, Object> map);

	public int getTotalA(String id);
}
