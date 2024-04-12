package com.nadeuli.common.search.service;

import com.nadeuli.common.search.dao.SearchDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AutoServiceImpl implements AutoService{

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
        System.out.println("DB 경유");
        return list;
    }


}
