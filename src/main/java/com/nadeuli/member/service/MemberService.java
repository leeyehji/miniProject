package com.nadeuli.member.service;

import com.nadeuli.member.dto.MemberRequestDTO;

public interface MemberService {


    boolean login(MemberRequestDTO memberRequestDTO);

//    아이디 유효성 검사
    public boolean checkId(String MEM_ID);


    boolean memberJoin(MemberRequestDTO memberRequestDTO);



    boolean checkEmail(String MEM_EMAIL);

    MemberRequestDTO processOAuthUser(String MEM_EMAIL, String MEM_ID);


    String findmemberid(MemberRequestDTO memberRequestDTO);


    //MemberRequestDTO processOAuthUser(String email, String id);
}
