package com.nadeuli.member.repository;


import com.nadeuli.member.dto.MemberRequestDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;


@Mapper
@Repository
public interface MailRepository {


    void authMailSave(@Param(value="email") String MEM_EMAIL,@Param(value="authstr") String authstr);

    void findpwdemail(@Param(value = "email")String MEM_Email, @Param(value="pwdemail") String pwdemail);

    String findJoinEmail(@Param(value = "email") String email, @Param(value = "verification")String verification);

    String getMyPwd(Map<String,Object> map);
}
