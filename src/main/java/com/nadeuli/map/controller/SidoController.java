package com.nadeuli.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class SidoController {

    @GetMapping("/map/sido/{region}")
    public String getRegionData(@PathVariable String region){
        return "map/sido/" + region;
    }
}