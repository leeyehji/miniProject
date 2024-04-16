package com.nadeuli.serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceCenterController {

    @GetMapping(value = "ServiceCenter")
    public String getServiceCenter() {





        return "serviceCenter/ServiceCenter"; }

    @GetMapping(value = "NoticeDetail")
    public String getNoticeDetail() {return "serviceCenter/NoticeDetail"; }

    @GetMapping(value = "Inquiry")
    public String getInquiry() {return "serviceCenter/Inquiry"; }

    @GetMapping(value = "Faq")
    public String getFaq() {return "serviceCenter/Faq"; }

}

