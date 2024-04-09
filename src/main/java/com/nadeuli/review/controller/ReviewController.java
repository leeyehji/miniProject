package com.nadeuli.review.controller;

import com.nadeuli.common.object.service.ObjectStorageService;
import com.nadeuli.review.bean.ReviewDTO;
import com.nadeuli.review.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping(value="review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ObjectStorageService objectStorageService;
    private String bucketName = "miniproject";

    @RequestMapping(value="reviewWriteForm")
    public String reviewWriteForm(){
        return "review/reviewWrite";
    }

    @PostMapping(value="reviewWrite")
    @ResponseBody
    public String reviewWrite(@ModelAttribute ReviewDTO reviewDTO){

        reviewService.reviewWrite(reviewDTO);


        return "쓰기 완료";
    }

    @PostMapping(value="uploadSummernoteImageFile")
    @ResponseBody
    public String uploadImage(@RequestParam(value="file") MultipartFile file){
        return  objectStorageService.uploadFile(bucketName,"storage/",file);
    }


    @GetMapping(value="reviewList")
    public String reviewList(@RequestParam(value="pg") String pg, Model model){
        model.addAttribute("pg",pg);

        return "review/reviewList";
    }

    @PostMapping(value="getReviewList")
    @ResponseBody
    public List<ReviewDTO> getReviewList(){
        return reviewService.getReviewList();
    }


    @GetMapping(value="reviewView")
    public String reviewView(@RequestParam(value="no") String no,Model model){
        model.addAttribute("no",no);

        return "review/reviewView";
    }

    @PostMapping(value="getReviewView")
    @ResponseBody
    public ReviewDTO getReviewView(@RequestParam(value="no") String no){

        return reviewService.getReviewView(no);
    }

}
