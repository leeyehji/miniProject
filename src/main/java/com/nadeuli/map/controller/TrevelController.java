package com.nadeuli.map.controller;// ListController.java
import com.nadeuli.map.dao.MapDAO;
import com.nadeuli.map.dto.MapDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TrevelController {
    @Autowired
    private MapDAO mapDAO;

    @RequestMapping("/map")
    public String map(@RequestParam("contentTypeId") int contentTypeId, Model model) {
        List<MapDTO> mapList = mapDAO.findByContentTypeId(contentTypeId);
        model.addAttribute("mapList", mapList);
        return "map";
    }
}