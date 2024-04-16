package com.nadeuli.member.repository;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;



@Mapper
@Repository
public interface MailRepository {


    void authMailSave(String MEM_EMAIL, String authstr);
}
