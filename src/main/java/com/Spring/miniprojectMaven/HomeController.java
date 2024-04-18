package com.Spring.miniprojectMaven;


import com.Spring.miniprojectMaven.dto.HomeDTO;
import com.Spring.miniprojectMaven.dto.TreeMap;
import com.Spring.miniprojectMaven.dao.HomeDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
@RequiredArgsConstructor
public class HomeController {

	private final HomeDAO homeDAO;

	@RequestMapping(value = "/")
	public String home(Model model) {
		return "mainpage";
	}
	
	@RequestMapping(value = "/mainpage")
	public String home() {
		return "mainpage";
	}

	@GetMapping(value = "/getTop5Destinations")
	@ResponseBody
	public List<HomeDTO> getTop5Destinations() {
		List<HomeDTO> top5Destinations = homeDAO.selectTop5();
//		log.info("top5 = {}", top5Destinations);
		System.out.println("top5Destinations = " + top5Destinations);
		return top5Destinations;
	}
	
	@GetMapping(value = "/showChart")
	@ResponseBody
	public List<Map<String, Object>> showChart(){
		System.out.println("차트컨트롤러");
		//서비스가 없어서 controller에서 service 기능까지 처리하겠습니다.
		//List<Map<String, Object>> chartListAll = chartService.chartList();   	
		System.out.println("차트서비스");
		List<TreeMap> chartListAll = homeDAO.chartList();
		System.out.println(chartListAll);
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


        HashMap<String, Object> hash = new HashMap<>();
        for (int i = 0; i < chartListAll.size(); i++) {
        	hash.put("dataName", sigungu.get( chartListAll.get(i).getT_SIGUNGU() ) );
        	hash.put("dataValue", chartListAll.get(i).getDataValue());
        	//System.out.println("name: "+chartListAll.get(i).getT_SIGUNGU());
        	//System.out.println("value: "+chartListAll.get(i).getDataValue());
        	jsonObj = JSONObject.fromObject(hash);
            jsonArr.add(jsonObj);
        }
        return jsonArr;
	}
	
	@GetMapping(value = "/showChart2")
	@ResponseBody
	public List<Map<String, Object>> showChart2(){
		System.out.println("차트2컨트롤러");
		//서비스가 없어서 controller에서 service 기능까지 처리하겠습니다.
		//List<Map<String, Object>> chartListAll = chartService.chartList();   	
		System.out.println("차트2서비스");
		//t_sigungu, dataValue : 도별 이름(contentTypeId), T_Like
		List<TreeMap> chartListAll = homeDAO.chartList2();	
		//System.out.println(chartListAll);
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		
        Map<Integer, String> contentType = new HashMap<>();
        contentType.put(12, "관광지");
        contentType.put(14, "문화시설");
        contentType.put(15, "축제공연행사");
        contentType.put(25, "여행코스");
        contentType.put(28, "레포츠");
        contentType.put(32, "숙박");
        contentType.put(38, "쇼핑");
        contentType.put(39, "음식점");
                
        HashMap<String, Object> hash = new HashMap<>();
        for (int i = 0; i < chartListAll.size(); i++) {
        	hash.put("dataName", contentType.get( chartListAll.get(i).getT_SIGUNGU() ) );
        	hash.put("dataValue", chartListAll.get(i).getDataValue());
        	//System.out.println("name"+  chartListAll.get(i).getT_SIGUNGU() +": "+hash.get("dataName"));
        	//System.out.println("value2: "+chartListAll.get(i).getDataValue());
        	jsonObj = JSONObject.fromObject(hash);
            jsonArr.add(jsonObj);
        }
        return jsonArr;
	}
}
