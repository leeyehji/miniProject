package com.Spring.miniprojectMaven.dao;

import com.Spring.miniprojectMaven.dto.HomeDTO;
import com.Spring.miniprojectMaven.dto.TreeMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HomeDAO {
    @Select("SELECT * FROM TRAVEL WHERE T_THUMB_IMAGE IS NOT NULL ORDER BY T_VIEW DESC LIMIT 5")
    List<HomeDTO> selectTop5();
    
    @Select("SELECT SUM(T_VIEW) as \"dataValue\", T_SIGUNGU FROM TRAVEL WHERE T_SIDO = '서울'  GROUP BY T_SIGUNGU ORDER BY \"dataValue\" DESC limit 6")
	List<TreeMap> chartList();
    
    @Select("SELECT SUM(T_VIEW) as \"dataValue\", T_CONTENTTYPEID AS \"T_SIGUNGU\" FROM TRAVEL GROUP BY T_CONTENTTYPEID ")
	List<TreeMap> chartList2();
}

