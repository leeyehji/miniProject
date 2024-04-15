package com.nadeuli.thema.dao;

import com.nadeuli.common.search.bean.SearchDTO;
import com.nadeuli.thema.bean.CommonDTO;
import com.nadeuli.thema.bean.ThemaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
@Mapper
public interface ThemaDAO {
    CommonDTO getCommonItem(int no);

    ThemaDTO getThemaItem(@Param(value="table") String table,@Param(value="T_CONTENTNO") int contentNo);

    int themaLikeUp(int tContentno);

    void themaViewUp(int tContentno);

    List<SearchDTO> getThemaBoardList(Map<String, Object> userSelectDataMap);
}
