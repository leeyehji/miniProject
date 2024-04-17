package com.nadeuli.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nadeuli.mypage.dto.TreeMap;

@Mapper
public interface ChartDAO {

	List<TreeMap> chartList();

}
