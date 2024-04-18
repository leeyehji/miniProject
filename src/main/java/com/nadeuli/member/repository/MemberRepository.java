package com.nadeuli.member.repository;

import com.nadeuli.member.dto.MemberRequestDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberRepository {


     MemberRequestDTO login(MemberRequestDTO memberRequestDTO);

    void memberJoin(MemberRequestDTO memberRequestDTO);

    MemberRequestDTO checkId(String MEM_ID);

    MemberRequestDTO chekcEmail(String MEM_EMAIL);


    MemberRequestDTO findByEmailAndMemId(@Param(value="MEM_ID") String id,@Param(value="MEM_EMAIL") String email);

    void save(MemberRequestDTO memberDTO);

    /**
     * 아이디 찾기
     */

    String findMemberIdByNameAndEmail(@Param("MEM_NAME") String MEM_NAME,@Param("MEM_EMAIL") String MEM_EMAIL);
    boolean existsByMEM_NAME(String MEM_NAME);

    boolean existsByMEM_EMAIL(String MEM_EMAIL);


    /**
     * 비밀번호 찾기
     */
    boolean existsByMEM_IDANDNAME(@Param("MEM_ID")String MEM_ID);

    boolean existsByMEM_PHONE( @Param("MEM_PHONE")String MEM_PHONE);

    boolean existsByMEM_IDANDEMAIL(@Param("MEMEMAIL") String MEMEMAIL);


    String findPasswordByNameEmailIdPhone(@Param("MEM_NAME")String MEM_NAME,@Param("MEMEMAIL") String MEMEMAIL
            ,@Param("MEM_ID") String MEM_ID, @Param("MEM_PHONE")String MEM_PHONE);
}
