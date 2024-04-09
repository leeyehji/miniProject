package com.nadeuli.serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceCenterController {

    @GetMapping(value = "ServiceCenter")
    public String getServiceCenter() {return "serviceCenter/ServiceCenter"; }
}
