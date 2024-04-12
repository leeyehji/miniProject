package com.nadeuli.review.controller;

import com.nadeuli.common.object.service.ObjectStorageService;
import com.nadeuli.review.bean.CommentDTO;
import com.nadeuli.review.bean.ReviewDTO;
import com.nadeuli.review.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ObjectStorageService objectStorageService;

    @RequestMapping(value="reviewWriteForm")
    public String reviewWriteForm(){
        return "review/reviewWrite";
    }

    @PostMapping(value="reviewWrite")
    @ResponseBody
    public String reviewWrite(@ModelAttribute(value="formData") ReviewDTO reviewDTO,@RequestParam(value="imgArray") List<String> imgArray)  {


        if(!imgArray.isEmpty()) {

            String B_THUMBNAIL = objectStorageService.moveFile(imgArray);
            try {
                Thread.sleep(1000);
            }catch (InterruptedException e){
                e.printStackTrace();
            }
            reviewDTO.setB_THUMBNAIL(B_THUMBNAIL);
        }
        objectStorageService.clearTemp("admin");

        reviewService.reviewWrite(reviewDTO);

        return "쓰기 완료";
    }

    @PostMapping(value="uploadSummernoteImageFile")
    @ResponseBody
    public String uploadImage(@RequestParam(value="file") MultipartFile file,HttpSession session){
        String mem_id="admin";
        //        session.getAttribute("mem_id");
        StringBuilder folderNameBuffer = new StringBuilder();
        folderNameBuffer.append("storage/review/");
        folderNameBuffer.append(mem_id);
        folderNameBuffer.append("/temp/");

        String folderName = folderNameBuffer.toString();
        String bucketName = "miniproject";
        String fileName = objectStorageService.uploadFile(bucketName,folderName,file);

        return folderName+fileName;
    }


    @GetMapping(value="reviewList")
    public String reviewList(@RequestParam(value="pg",
            required = false, defaultValue="1") String pg, Model model){
        model.addAttribute("pg",pg);
        return "review/reviewList";
    }

    @PostMapping(value="getReviewList")
    @ResponseBody
    public Map<String, Object> getReviewList(@RequestParam(value="pg",
            required = false, defaultValue="1") String pg, HttpSession session){
        Map<String,Object> reviewListMap =reviewService.getReviewList(pg);
        session.setAttribute("totalA",reviewListMap.get("totalA"));
        return reviewListMap;
    }

    //리뷰 글 클릭 시 - B_view 조회수 +1 -> reviewView.jsp
    @GetMapping(value="reviewView")
    public String reviewView(@RequestParam(value="no") String no,Model model){
        model.addAttribute("no",no);
        reviewService.boardViewPlus(no);
        return "review/reviewView";
    }
    
    //reviewView board 정보 + comment 정보
    @PostMapping(value="getReviewView")
    @ResponseBody
    public Map<String,Object> getReviewView(@RequestParam(value="no") String no){

        Map<String,Object> reviewViewMap = new HashMap<String,Object>();
        ReviewDTO reviewDTO = reviewService.getReviewView(no);
        List<CommentDTO> commentList = reviewService.getCommentList(no);
        reviewViewMap.put("reviewDTO",reviewDTO);
        reviewViewMap.put("commentList",commentList);
        return reviewViewMap;
    }

    //ReviewView 좋아요 클릭시
    @PostMapping(value="clickLike")
    @ResponseBody
    public void clickLike(@RequestParam(value="no") String no){
        reviewService.clickLike(no);
    }


    //댓글 등록
    @PostMapping(value="commentWrite")
    @ResponseBody
    public void commentWrite(@ModelAttribute CommentDTO commentDTO){

       try {
           //comment Insertw
           reviewService.commentWrite(commentDTO);
           //BOARD commentCount Update
           reviewService.commentCountUp(commentDTO.getB_NO());
       } catch(Exception e){
           e.printStackTrace();
       }
    }
}
