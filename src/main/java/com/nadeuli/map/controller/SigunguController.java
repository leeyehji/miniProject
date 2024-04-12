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
    public String getRegionData(@PathVariable String region){
        return "map/seoul/" + region;
    }
    @GetMapping("/map/gyeonggi/{region}")
    public String getRegionData2(@PathVariable String region){
        return "map/gyeonggi/" + region;
    }
    @GetMapping("/map/incheon/{region}")
    public String getRegionData3(@PathVariable String region){
        return "map/incheon/" + region;
    }
    @GetMapping("/map/gangwon/{region}")
    public String getRegionData4(@PathVariable String region){
        return "map/gangwon/" + region;
    }
    @GetMapping("/map/chungbuk/{region}")
    public String getRegionData5(@PathVariable String region){
        return "map/chungbuk/" + region;
    }
    @GetMapping("/map/chungnam/{region}")
    public String getRegionData6(@PathVariable String region){
        return "map/chungnam/" + region;
    }
    @GetMapping("/map/jeonbuk/{region}")
    public String getRegionData7(@PathVariable String region){
        return "map/jeonbuk/" + region;
    }
    @GetMapping("/map/jeonnam/{region}")
    public String getRegionData8(@PathVariable String region){
        return "map/jeonnam/" + region;
    }
    @GetMapping("/map/gyeongbuk/{region}")
    public String getRegionData9(@PathVariable String region){
        return "map/gyeongbuk/" + region;
    }
    @GetMapping("/map/gyeongnam/{region}")
    public String getRegionData10(@PathVariable String region){
        return "map/gyeongnam/" + region;
    }
    @GetMapping("/map/jeju/{region}")
    public String getRegionData11(@PathVariable String region){
        return "map/jeju/" + region;
    }
    @GetMapping("/map/ulsan/{region}")
    public String getRegionData12(@PathVariable String region){
        return "map/ulsan/" + region;
    }
    @GetMapping("/map/daegu/{region}")
    public String getRegionData13(@PathVariable String region){
        return "map/daegu/" + region;
    }
    @GetMapping("/map/busan/{region}")
    public String getRegionData14(@PathVariable String region){
        return "map/busan/" + region;
    }
    @GetMapping("/map/gwangju/{region}")
    public String getRegionData15(@PathVariable String region){
        return "map/gwangju/" + region;
    }
    @GetMapping("/map/sejong/{region}")
    public String getRegionData16(@PathVariable String region){
        return "map/sejong/" + region;
    }
    @GetMapping("/map/daejeon/{region}")
    public String getRegionData17(@PathVariable String region){
        return "map/daejeon/" + region;
    }

    @GetMapping("/map/coordinates/{contentTypeId}")
    @ResponseBody
    public List<MapDTO> getCoordinates(@PathVariable int contentTypeId) {
        return mapDAO.findCoordinatesByContentTypeId(contentTypeId);
    }
}
