package com.nadeuli.thema.service;

import com.nadeuli.common.search.bean.SearchDTO;
import com.nadeuli.thema.bean.CommonDTO;
import com.nadeuli.thema.bean.ThemaDTO;
import com.nadeuli.thema.dao.ThemaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ThemaServiceImpl implements ThemaService {
    @Autowired
    private ThemaDAO themaDAO;

    @Override
    public CommonDTO getCommonItem(int no) {

        return themaDAO.getCommonItem(no);
    }

    @Override
    public ThemaDTO getThemaItem(int contentNo,int typeId) {
        String table = "";
        if(typeId == 12){
            table="type12";
        }else if(typeId == 14){
            table="type14";
        }else if(typeId == 15){
            table="type15";
        }else if(typeId == 28){
            table="type28";
        }else if(typeId == 32){
            table="type32";
        }else if(typeId == 38){
            table="type38";
        }else if(typeId == 39){
            table="type39";
        }
        System.out.println("ThemaServiceImpl.getThemaItem");
        ThemaDTO themaDTO = themaDAO.getThemaItem(table,contentNo);
        System.out.println("ThemaServiceImpl DAO 경유");
        return themaDTO;

    }

    @Override
    public int themaLikeUp(String contentNo) {
        int T_CONTENTNO = Integer.parseInt(contentNo);
       return themaDAO.themaLikeUp(T_CONTENTNO);
    }

    @Override
    public void themaViewUp(String contentNo) {
        int T_CONTENTNO = Integer.parseInt(contentNo);
        themaDAO.themaViewUp(T_CONTENTNO);
    }

    @Override
    public List<SearchDTO> getThemaBoardList(Map<String, Object> userSelectDataMap) {

        return themaDAO.getThemaBoardList(userSelectDataMap);
    }
}
