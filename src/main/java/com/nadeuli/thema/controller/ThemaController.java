package com.nadeuli.thema.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.nadeuli.common.search.bean.SearchDTO;
import com.nadeuli.thema.bean.CommonDTO;
import com.nadeuli.thema.bean.ThemaDTO;
import com.nadeuli.thema.service.ThemaService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="thema")
public class ThemaController {
    @Autowired
    private ThemaService themaService;

    @GetMapping(value="themaDetailPage")
    public String themaDetailPage(@RequestParam("contentNo") String contentNo,@RequestParam("typeId") String typeId, Model model){
        model.addAttribute("T_CONTENTNO",contentNo);
        model.addAttribute("T_CONTENTTYPEID",typeId);
        themaService.themaViewUp(contentNo);
        return "thema/themaDetailPage";
    }

    @PostMapping(value="getThemaItem")
    @ResponseBody
    public ThemaDTO getThemaItem(@RequestParam(value="contentNo") String contentNo,@RequestParam(value="typeId") String typeId){
        int T_CONTENTNO = Integer.parseInt(contentNo);
        int T_CONTENTTYPEID = Integer.parseInt(typeId);
//        Map<String,Object> themaMap = new HashMap<>();
//        CommonDTO commonDTO = themaService.getCommonItem(T_CONTENTNO);
//        int typeId = commonDTO.getT_CONTENTTYPEID();
//        themaMap.put("common",commonDTO);
//        themaMap.put("typeId",typeId);
//        themaMap.put("thema",themaDTO);
        return themaService.getThemaItem(T_CONTENTNO,T_CONTENTTYPEID);
    }


    @PostMapping(value="themaLikeUp")
    @ResponseBody
    public String themaLikeUp(@RequestParam(value="contentNo") String contentNo){
        return themaService.themaLikeUp(contentNo)+ "";

    }

    @RequestMapping(value="themaBoardList")
    public String themaBoardList(){
        return "thema/themaBoardList";
    }

    @PostMapping(value="getThemaBoardList")
    @ResponseBody
    public List<SearchDTO> getThemaBoardList(@RequestBody Map<String,Object> userSelectDataMap){

        return themaService.getThemaBoardList(userSelectDataMap);
    }
}
