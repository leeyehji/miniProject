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
    public String reviewWriteForm(HttpSession session){
        if(session.getAttribute("MEM_ID")==null) {
            return "member/loginForm";
        }else return "review/reviewWrite";
    }

    @PostMapping(value="reviewWrite")
    @ResponseBody
    public String reviewWrite(@ModelAttribute ReviewDTO reviewDTO,HttpSession session)  {
        String MEM_ID = (String) session.getAttribute("MEM_ID");
        reviewDTO.setMEM_ID(MEM_ID);
        reviewService.reviewWrite(reviewDTO);
        return "쓰기 완료";
    }
    @RequestMapping(value="reviewUpdateForm")
    public String reviewUpdateForm(@RequestParam(value="no", required = true) String no,Model model,HttpSession session){


        if(session.getAttribute("MEM_ID")==null) {
            return "member/loginForm";
        }else{
            String MEM_ID = (String) session.getAttribute("MEM_ID");
            if(reviewService.isMatchId(MEM_ID,no)==1) {
                model.addAttribute("no", no);
                return "review/reviewUpdate";
            }
            else{
                return "redirect:/";
            }
        }
    }


    @PostMapping(value="getReviewUpdate")
    @ResponseBody
    public Map<String,Object> getReviewUpdate(@RequestParam(value="no") String no,HttpSession session){
        if(session.getAttribute("MEM_ID") != null ){
           String loginId=(String) session.getAttribute("MEM_ID");

           if(reviewService.isMatchId(loginId,no)==1){
               Map<String,Object> getReviewMap = reviewService.getReviewUpdate(no);
               return getReviewMap;
           }

        }

        return null;
    }

    @PostMapping(value="reviewUpdate")
    public void reviewUpdate(@ModelAttribute ReviewDTO reviewDTO,HttpSession session){
        String MEM_ID = (String) session.getAttribute("MEM_ID");
        reviewDTO.setMEM_ID(MEM_ID);
        reviewService.reviewUpdate(reviewDTO);
    }
    @PostMapping(value="reviewDelete")
    @ResponseBody
    public String reviewDelete(@RequestParam(value="B_NO") String B_NO,HttpSession session){
        String MEM_ID = (String) session.getAttribute("MEM_ID");

        if(reviewService.isMatchId(MEM_ID,B_NO)==1){
            reviewService.reviewDelete(B_NO);
            return "삭제 완료";
        }
        else return "삭제 실패";
    }

    @PostMapping(value="reviewImageUpload")
    @ResponseBody
    public String reviewImageUpload(@RequestParam(value="imgArray") List<String> imgArray,HttpSession session){
        String B_THUMBNAIL = "";
        String MEM_ID = (String) session.getAttribute("MEM_ID");
        if(imgArray.get(0).equals("[]")) {

            System.out.println("없음");

        }else{
            B_THUMBNAIL = objectStorageService.moveFile(imgArray,MEM_ID);
            try {
                Thread.sleep(1000);
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        objectStorageService.clearTemp(MEM_ID);
        System.out.println("생겼나");
        return B_THUMBNAIL;
    }

    @PostMapping(value="uploadSummernoteImageFile")
    @ResponseBody
    public String uploadImage(@RequestParam(value="file") MultipartFile file,HttpSession session){
        if(session.getAttribute("MEM_ID")==null){
            return "로그인 하지 않음";
        }else{
            String mem_id= (String) session.getAttribute("MEM_ID");
            StringBuilder folderNameBuffer = new StringBuilder();
            folderNameBuffer.append("storage/review/");
            folderNameBuffer.append(mem_id);
            folderNameBuffer.append("/temp/");

            String folderName = folderNameBuffer.toString();
            String bucketName = "miniproject";
            String fileName = objectStorageService.uploadFile(bucketName,folderName,file);

            return folderName+fileName;
        }
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

        if(session.getAttribute("MEM_ID") == null){
            reviewListMap.put("isLogin","false");
        }
        else reviewListMap.put("isLogin","true");

        return reviewListMap;
    }
    @RequestMapping(value="logout")
    public String logout(HttpSession session){
        session.removeAttribute("MEM_ID");
        return "/mainpage";
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
    public Map<String,Object> getReviewView(@RequestParam(value="no") String no,HttpSession session){


        Map<String,Object> reviewViewMap = new HashMap<String,Object>();
        ReviewDTO reviewDTO = reviewService.getReviewView(no);
        List<CommentDTO> commentList = reviewService.getCommentList(no);
        System.out.println("ReviewController.getReviewView");


        int prevViewNo = reviewService.getPrevView(no);
        System.out.println(prevViewNo);
        int nextViewNo = reviewService.getNextView(no);
        System.out.println(nextViewNo);

        if(session.getAttribute("MEM_ID")==null){
            reviewViewMap.put("isLogin","false");
        }else{
            reviewViewMap.put("isLogin",session.getAttribute("MEM_ID"));
        }

        reviewViewMap.put("reviewDTO",reviewDTO);
        reviewViewMap.put("commentList",commentList);
        reviewViewMap.put("prevViewNo",prevViewNo);
        reviewViewMap.put("nextViewNo",nextViewNo);


        return reviewViewMap;
    }

    //ReviewView 좋아요 클릭시
    @PostMapping(value="clickLike")
    @ResponseBody
    public String clickLike(@RequestParam(value="no") String no,HttpSession session){
        if(session.getAttribute("todayClickBoard")==null) {
            session.setAttribute("todayClickBoard", "yes");
            reviewService.clickLike(no);
            return "firstClick";
        }else{
            return "doubleClick";
        }
    }


    //댓글 등록
    @PostMapping(value="commentWrite")
    @ResponseBody
    public void commentWrite(@ModelAttribute CommentDTO commentDTO,HttpSession session){

        if(session.getAttribute("MEM_ID")==null){
            return;
        }else{
            commentDTO.setMEM_ID((String) session.getAttribute("MEM_ID"));
            try {
                //comment Insert
                reviewService.commentWrite(commentDTO);
                //BOARD commentCount Update
                reviewService.commentCountUp(commentDTO.getB_NO());
            } catch(Exception e){
                e.printStackTrace();
            }
        }

    }
    @PostMapping(value="commentUpdate")
    @ResponseBody
    public void commentUpdate(@RequestParam(value="C_NO") String cNo,@RequestParam(value="C_CONTENT") String cContent){
        reviewService.commentUpdate(cNo,cContent);
    }

    @PostMapping(value="commentDelete")
    @ResponseBody
    public void commentDelete(@RequestParam(value="C_NO") String cNo,@RequestParam(value="B_NO") String bNo){
        reviewService.boardCommentMinus(bNo);
        reviewService.commentDelete(cNo);
    }
}
