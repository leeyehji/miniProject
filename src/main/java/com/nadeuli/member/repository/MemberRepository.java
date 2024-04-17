package com.nadeuli.member.repository;

import com.nadeuli.member.dto.MemberRequestDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberRepository {


     MemberRequestDTO login(MemberRequestDTO memberRequestDTO);

    int memberJoin(MemberRequestDTO memberRequestDTO);

    MemberRequestDTO checkId(String MEM_ID);

    MemberRequestDTO chekcEmail(String MEM_EMAIL);


    MemberRequestDTO findByEmailAndMemId(@Param(value="MEM_ID") String id,@Param(value="MEM_EMAIL") String email);

    void save(MemberRequestDTO memberDTO);



    MemberRequestDTO findmemberid(String MEM_NAME, String MEM_EMAIL);
}
