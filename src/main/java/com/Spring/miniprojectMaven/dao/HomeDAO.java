package com.Spring.miniprojectMaven.dao;

import com.Spring.miniprojectMaven.dto.HomeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HomeDAO {
    @Select("SELECT * FROM TRAVEL WHERE T_THUMB_IMAGE IS NOT NULL ORDER BY T_VIEW DESC LIMIT 5")
    List<HomeDTO> selectTop5();
}
