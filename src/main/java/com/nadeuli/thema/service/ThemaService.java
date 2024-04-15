package com.nadeuli.thema.service;

import com.nadeuli.common.search.bean.SearchDTO;
import com.nadeuli.thema.bean.CommonDTO;
import com.nadeuli.thema.bean.ThemaDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface ThemaService {
    CommonDTO getCommonItem(int no);

    ThemaDTO getThemaItem(int contentNo,int typeId);

    int themaLikeUp(String contentNo);

    void themaViewUp(String contentNo);

    List<SearchDTO> getThemaBoardList(Map<String, Object> userSelectDataMap);
}
