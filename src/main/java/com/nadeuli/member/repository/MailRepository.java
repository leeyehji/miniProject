package com.nadeuli.member.repository;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



@Mapper
@Repository
public interface MailRepository {


    void authMailSave(@Param(value="email") String MEM_EMAIL,@Param(value="authstr") String authstr);

    void findpwdemail(@Param(value = "email")String MEM_Email, @Param(value="pwdemail") String pwdemail);
}
