package com.nadeuli.map.controller;

import com.nadeuli.map.dao.MapDAO;
import com.nadeuli.map.dto.MapDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SigunguController {
    @Autowired
    private MapDAO mapDAO;

    @GetMapping("/map/seoul/{region}")
    public String getRegionData(@PathVariable String region, Model model){
        return getMapData("map/seoul/" + region, model);
    }
    @GetMapping("/map/gyeonggi/{region}")
    public String getRegionData2(@PathVariable String region, Model model){
        return getMapData("map/gyeonggi/" + region, model);
    }
    @GetMapping("/map/incheon/{region}")
    public String getRegionData3(@PathVariable String region, Model model){
        return getMapData("map/incheon/" + region, model);
    }
    @GetMapping("/map/gangwon/{region}")
    public String getRegionData4(@PathVariable String region, Model model){
        return getMapData("map/gangwon/" + region, model);
    }
    @GetMapping("/map/chungbuk/{region}")
    public String getRegionData5(@PathVariable String region, Model model){
        return getMapData("map/chungbuk/" + region, model);
    }
    @GetMapping("/map/chungnam/{region}")
    public String getRegionData6(@PathVariable String region, Model model){
        return getMapData("map/chungnam/" + region, model);
    }
    @GetMapping("/map/jeonbuk/{region}")
    public String getRegionData7(@PathVariable String region, Model model){
        return getMapData("map/jeonbuk/" + region, model);
    }
    @GetMapping("/map/jeonnam/{region}")
    public String getRegionData8(@PathVariable String region, Model model){
        return getMapData("map/jeonnam/" + region, model);
    }
    @GetMapping("/map/gyeongbuk/{region}")
    public String getRegionData9(@PathVariable String region, Model model){
        return getMapData("map/gyeongbuk/" + region, model);
    }
    @GetMapping("/map/gyeongnam/{region}")
    public String getRegionData10(@PathVariable String region, Model model){
        return getMapData("map/gyeongnam/" + region, model);
    }
    @GetMapping("/map/jeju/{region}")
    public String getRegionData11(@PathVariable String region, Model model){
        return getMapData("map/jeju/" + region, model);
    }
    @GetMapping("/map/daegu/{region}")
    public String getRegionData12(@PathVariable String region, Model model){
        return getMapData("map/daegu/" + region, model);
    }
    @GetMapping("/map/ulsan/{region}")
    public String getRegionData13(@PathVariable String region, Model model){
        return getMapData("map/ulsan/" + region, model);
    }
    @GetMapping("/map/busan/{region}")
    public String getRegionData14(@PathVariable String region, Model model){
        return getMapData("map/busan/" + region, model);
    }
    @GetMapping("/map/gwangju/{region}")
    public String getRegionData15(@PathVariable String region, Model model){
        return getMapData("map/gwangju/" + region, model);
    }
    @GetMapping("/map/daejeon/{region}")
    public String getRegionData16(@PathVariable String region, Model model){
        return getMapData("map/daejeon/" + region, model);
    }
    @GetMapping("/map/sejong/{region}")
    public String getRegionData17(@PathVariable String region, Model model){
        return getMapData("map/sejong/" + region, model);
    }

    private String getMapData(String viewName, Model model) {
        List<MapDTO> mapList = mapDAO.findByContentTypeId(12); // replace 1 with actual contentTypeId
        model.addAttribute("mapList", mapList);
        return viewName;
    }
    @GetMapping("/map/coordinates/{contentTypeId}")
    @ResponseBody
    public List<MapDTO> getCoordinates(@PathVariable int contentTypeId) {
        return mapDAO.findCoordinatesByContentTypeId(contentTypeId);
    }
}
