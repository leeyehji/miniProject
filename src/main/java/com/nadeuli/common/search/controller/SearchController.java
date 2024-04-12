package com.nadeuli.common.search.controller;


import com.nadeuli.common.search.service.AutoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private AutoService autoService;

    @PostMapping(value="autoComplete")
    @ResponseBody
    public Map<String, Object> autoComplete(@RequestParam Map<String, Object> paramMap) throws Exception {
        List<Map<String, Object>> resultList = autoService.autoComplete(paramMap);
        System.out.println("콘트롤러 도착");
        paramMap.put("resultList", resultList);
        return paramMap;
    }

}
