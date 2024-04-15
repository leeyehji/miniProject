package com.nadeuli.map.controller;

import com.nadeuli.map.dao.MapDAO;
import com.nadeuli.map.dto.MapDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ChungnamController {
    @Autowired
    private MapDAO mapDAO;

    @GetMapping("/map/chungnam/{region}")
    public String getRegionData(@PathVariable String region){
        return "map/chungnam/" + region;
    }

    @GetMapping("/map/chungnam/coordinates/{contentTypeId}")
    @ResponseBody
    public List<MapDTO> getCoordinates(@PathVariable int contentTypeId) {
        return mapDAO.findCoordinatesByContentTypeIdOfChungnam(contentTypeId);
    }
}
