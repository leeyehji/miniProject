package com.nadeuli.common.search.service;

import com.nadeuli.common.search.bean.SearchDTO;
import com.nadeuli.common.search.dao.SearchDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<Map<String, Object>> autoComplete(Map<String, Object> paramMap) throws Exception {
        List<Map<String, Object>> list = null;
        try {
           list = searchDAO.autocomplete(paramMap);
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<SearchDTO> searchResult(String keyword,String pg) {

        int startNum = Integer.parseInt(pg)*20 - 20;

        Map<String,Object> searchMap = new HashMap<>();

        searchMap.put("keyword",keyword);
        searchMap.put("startNum",startNum);

        List<SearchDTO> list = searchDAO.searchResult(searchMap);

        for(SearchDTO searchDTO : list){
            String T_CONTENTNAME =
                    searchDTO.getT_CONTENTNAME().replace(keyword,"<span class='bold'>"+keyword+"</span>");
            searchDTO.setT_CONTENTNAME(T_CONTENTNAME);

            String T_INFORMATION=
                    searchDTO.getT_INFORMATION().replace(keyword,"<span class='bold'>"+keyword+"</span>");
            searchDTO.setT_INFORMATION(T_INFORMATION);

        }

        return list;
    }


}
