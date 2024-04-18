package com.nadeuli.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadeuli.mypage.dao.MypageDAO;
import com.nadeuli.review.bean.CommentDTO;
import com.nadeuli.review.bean.ReviewDTO;
import com.nadeuli.review.bean.ReviewPagingDTO;
import com.nadeuli.review.service.ReviewService;

@Controller
@RequestMapping(value = "mypageRead")
public class MyBoardRead {
	@Autowired
	private MypageDAO mypageDAO;
	@Autowired
    private ReviewPagingDTO reviewPagingDTO;
	@Autowired
    private ReviewService reviewService;
	
	@GetMapping(value="myBoard")
    public String myBoard(HttpServletRequest request,HttpSession session) { //id 내놔
    	return "review/reviewList";
    }
	
	/*내가 작성한 글 목록 보여주기*/
    @PostMapping(value="getReviewList")
    @ResponseBody
    public Map<String, Object> getMyBoardList(@RequestParam(value="pg",
            required = false, defaultValue="1") String pg, HttpSession session){
    	String id = (String) session.getAttribute("MEM_ID");
    	//1페이지당 3개씩 - MySQL
        int startNum = Integer.parseInt(pg) * 6 - 6; //시작위치는 0부터
        
        Map<String, Object> tempMap = new HashMap<String, Object>();
        tempMap.put("startNum", startNum);
        tempMap.put("mem_id", id);
        //List객체가 JSON으로 자동 변환된다. - pom.xml <dependency>에 추가해야 함
        System.out.println(tempMap.get("mem_id")+", "+tempMap.get("startNum"));
        List<ReviewDTO> list = mypageDAO.getMyBoardList(tempMap);
        for(int i=0; i<list.size(); i++)
        	list.get(i).setMEM_ID(id);
        
        //페이징 처리
        int totalA = mypageDAO.getTotalA(id); //총글수

        reviewPagingDTO.setCurrentPage(Integer.parseInt(pg));
        reviewPagingDTO.setPageBlock(5);
        reviewPagingDTO.setPageSize(6);
        reviewPagingDTO.setTotalA(totalA);
        reviewPagingDTO.makePaingHTML();

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("reviewPaging", reviewPagingDTO);
        map.put("totalA", totalA);

        return map;
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
}
