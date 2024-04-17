package com.nadeuli.member.service;

import com.nadeuli.member.dto.MemberRequestDTO;

public interface MemberService {

//로그인 페이지
    boolean login(MemberRequestDTO memberRequestDTO);

//    아이디 유효성 검사
    public boolean checkId(String MEM_ID);

//회원가입
    boolean memberJoin(MemberRequestDTO memberRequestDTO);

    //네이버 로그인 아이디 비밀번호 유효성 검사
    boolean checkEmail(String MEM_EMAIL);

//네이버 관리
    MemberRequestDTO processOAuthUser(String MEM_EMAIL, String MEM_ID);
//아이디 찾기
    String lostId(MemberRequestDTO memberRequestDTO);



}
