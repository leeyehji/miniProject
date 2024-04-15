package com.nadeuli.common.search.dao;

import com.nadeuli.common.search.bean.SearchDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SearchDAO {
    List<Map<String, Object>> autocomplete(Map<String, Object> paramMap) throws Exception;
    List<SearchDTO> searchResult(Map<String,Object> searchMap);
}