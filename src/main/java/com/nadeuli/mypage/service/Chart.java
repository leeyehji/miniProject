package com.nadeuli.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadeuli.mypage.dao.ChartDAO;
import com.nadeuli.mypage.dto.TreeMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class Chart implements ChartService {
	@Autowired
	ChartDAO chartDAO;
	
	@Override
	public List<Map<String, Object>> chartList() {
		System.out.println("차트서비스");
		List<TreeMap> chartListAll = chartDAO.chartList();
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		
        ArrayList<String> sigungu = new ArrayList<String>();
        sigungu.add("없는지역");
        sigungu.add("강남구");
        sigungu.add("강동구");
        sigungu.add("강북구");
        sigungu.add("강서구");
        sigungu.add("관악구");
        sigungu.add("광진구");
        sigungu.add("구로구");
        sigungu.add("금천구");
        sigungu.add("노원구");
        sigungu.add("도붕구");//code=10, index=10
        sigungu.add("동대문구");
        sigungu.add("동작구");
        sigungu.add("마포구");
        sigungu.add("서대문구");
        sigungu.add("서초구");
        sigungu.add("성동구");
        sigungu.add("성북구");
        sigungu.add("송파구");
        sigungu.add("양천구");
        sigungu.add("영등포구");
        sigungu.add("용산구");
        sigungu.add("은평구");
        sigungu.add("종로구");
        sigungu.add("중구");
        sigungu.add("중랑구");//code=25, index=25


        
        System.out.println(sigungu.get(0));
        
        HashMap<String, Object> hash = new HashMap<>();
        for (int i = 0; i < chartListAll.size(); i++) {
        	hash.put("dataName", sigungu.get( chartListAll.get(i).getT_SIGUNGU() ) );
        	hash.put("dataValue", chartListAll.get(i).getDataValue());
        	System.out.println("name: "+chartListAll.get(i).getT_SIGUNGU());
        	System.out.println("value: "+chartListAll.get(i).getDataValue());
        	jsonObj = JSONObject.fromObject(hash);
            jsonArr.add(jsonObj);
        }
        return jsonArr;
	}
}
