package com.nadeuli.common.search.controller;


import com.nadeuli.common.search.bean.SearchDTO;
import com.nadeuli.common.search.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private SearchService searchService;

    @PostMapping(value="autoComplete")
    @ResponseBody
    public Map<String, Object> autoComplete(@RequestParam Map<String, Object> paramMap) throws Exception {
        List<Map<String, Object>> resultList = searchService.autoComplete(paramMap);
        paramMap.put("resultList", resultList);
        return paramMap;
    }

    @GetMapping(value="searchResultForm")
    public String searchResultForm(@RequestParam(value="keyword") String keyword,Model model){

        model.addAttribute("keyword",keyword);

        return "thema/searchResultForm";
    }

    @PostMapping(value="searchResult")
    @ResponseBody
    public List<SearchDTO> searchResult(@RequestParam(value="keyword") String keyword,@RequestParam(value="pg",
            required = false, defaultValue="1") String pg){


        return searchService.searchResult(keyword,pg);
    }


}
