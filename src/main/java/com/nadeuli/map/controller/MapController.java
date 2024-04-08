package com.nadeuli.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
    @GetMapping("/map/map")
    public String getMap(){
        return "map/map";
    }
}
