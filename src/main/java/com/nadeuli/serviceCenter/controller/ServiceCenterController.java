package com.nadeuli.serviceCenter.controller;

import com.nadeuli.serviceCenter.service.ServiceCenterService;
import com.nadeuli.serviceCenter.bean.NoticeDTO;
import com.nadeuli.serviceCenter.bean.InquiryDTO;
import com.nadeuli.serviceCenter.bean.FaqDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ServiceCenterController {

    private ServiceCenterService serviceCenterService;

    @Autowired
    public void ServiceCenterService(ServiceCenterService serviceCenterService) {
        this.serviceCenterService = serviceCenterService;
    }

    @GetMapping(value = "/serviceCenter/ServiceCenter")
    public String getServiceCenter(Model model) {
        model.addAttribute("notices", serviceCenterService.findAllNotices());
        model.addAttribute("inquiries", serviceCenterService.findAllInquiries());
        model.addAttribute("faqs", serviceCenterService.findAllFaqs());
        return "serviceCenter/ServiceCenter";
    }

    @GetMapping(value = "/NoticeDetail/{nNo}")
    public String getNoticeDetail(@PathVariable Long nNo, Model model) {
        model.addAttribute("notice", serviceCenterService.findNoticeById(nNo));
        return "serviceCenter/NoticeDetail";
    }

    @GetMapping(value = "/serviceCenter/Inquiry")
    public String getInquiry(Model model) {
        model.addAttribute("inquiries", serviceCenterService.findAllInquiries());
        return "serviceCenter/Inquiry";
    }

    @GetMapping(value = "/serviceCenter/Faq")
    public String getFaq(Model model) {
        model.addAttribute("faqs", serviceCenterService.findAllFaqs());
        return "serviceCenter/Faq";
    }

    @PostMapping("/notices")
    public ResponseEntity<NoticeDTO> insertNotice(@RequestBody NoticeDTO notice) {
        serviceCenterService.insertNotice(notice);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/notices/{nNo}")
    public ResponseEntity<NoticeDTO> findNoticeById(@PathVariable Integer nNo) {
        NoticeDTO notice = serviceCenterService.findNoticeById(nNo);
        return ResponseEntity.ok(notice);
    }

    @PutMapping("/notices")
    public ResponseEntity<NoticeDTO> updateNotice(@RequestBody NoticeDTO notice) {
        serviceCenterService.updateNotice(notice);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/notices/{nNo}")
    public ResponseEntity<NoticeDTO> deleteNotice(@PathVariable Long nNo) {
        serviceCenterService.deleteNotice(nNo);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/inquiries")
    public ResponseEntity<InquiryDTO> insertInquiry(@RequestBody InquiryDTO inquiry) {
        serviceCenterService.insertInquiry(inquiry);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/inquiries/{qNo}")
    public ResponseEntity<InquiryDTO> findInquiryById(@PathVariable Integer qNo) {
        InquiryDTO inquiry = serviceCenterService.findInquiryById(qNo);
        return ResponseEntity.ok(inquiry);
    }

    @GetMapping("/inquiries/answered/{qIsAnswered}")
    public ResponseEntity<List<InquiryDTO>> findInquiriesByAnswered(@PathVariable Integer qIsAnswered) {
        List<InquiryDTO> inquiries = serviceCenterService.findInquiriesByAnswered(qIsAnswered);
        return ResponseEntity.ok(inquiries);
    }

    @PutMapping("/inquiries")
    public ResponseEntity<InquiryDTO> updateInquiry(@RequestBody InquiryDTO inquiry) {
        serviceCenterService.updateInquiry(inquiry);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/inquiries/{qNo}")
    public ResponseEntity<InquiryDTO> deleteInquiry(@PathVariable Integer qNo) {
        serviceCenterService.deleteInquiry(qNo);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/faqs")
    public ResponseEntity<FaqDTO> insertFaq(@RequestBody FaqDTO faq) {
        serviceCenterService.insertFaq(faq);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/faqs/{faqNo}")
    public ResponseEntity<FaqDTO> findFaqByNo(@PathVariable Integer faqNo) {
        FaqDTO faq = serviceCenterService.findFaqByNo(faqNo);
        return ResponseEntity.ok(faq);
    }

    @PutMapping("/faqs")
    public ResponseEntity<FaqDTO> updateFaq(@RequestBody FaqDTO faq) {
        serviceCenterService.updateFaq(faq);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/faqs/{faqNo}")
    public ResponseEntity<FaqDTO> deleteFaq(@PathVariable Integer faqNo) {
        serviceCenterService.deleteFaq(faqNo);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/notices")
    public ResponseEntity<List<NoticeDTO>> findAllNotices() {
        List<NoticeDTO> notices = serviceCenterService.findAll();
        return ResponseEntity.ok(notices);
    }

    @GetMapping("/inquiries/answered")
    public ResponseEntity<List<InquiryDTO>> findByAnswered(@RequestParam Integer qIsAnswered) {
        List<InquiryDTO> inquiries = serviceCenterService.findByAnswered(qIsAnswered);
        return ResponseEntity.ok(inquiries);
    }
}