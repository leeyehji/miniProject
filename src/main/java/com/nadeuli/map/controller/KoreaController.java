package com.nadeuli.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class KoreaController {
    @GetMapping("/map/korea")
    public String getKorea(){
        return "map/korea";
    }
}
