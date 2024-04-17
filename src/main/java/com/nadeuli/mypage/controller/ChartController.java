package com.nadeuli.mypage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadeuli.mypage.service.ChartService;

@Controller
@RequestMapping(value="mypage")
public class ChartController {
	@Autowired
	ChartService chartService;
	
	@GetMapping(value = "chart")
	public String chart() {
		return "mypage/chart";
	}
	
	@GetMapping(value = "showChart")
	@ResponseBody
	public List<Map<String, Object>> showChart(){
		System.out.println("차트컨트롤러");
		List<Map<String, Object>> chartListAll = chartService.chartList();   	
        System.out.println(chartListAll);
		//[{"dataValue":0,"dataName":1}] 출력됨.
        return chartListAll;
	}
}
