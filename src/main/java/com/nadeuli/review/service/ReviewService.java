package com.nadeuli.review.service;


import com.nadeuli.review.bean.CommentDTO;
import com.nadeuli.review.bean.ReviewDTO;

import java.util.List;
import java.util.Map;

public interface ReviewService {
 public void reviewWrite(ReviewDTO reviewDTO);

 public Map<String, Object> getReviewList(String pg);
 public ReviewDTO getReviewView(String no);

 public void boardViewPlus(String no);

 public void clickLike(String no);

 void commentWrite(CommentDTO commentDTO);

 void commentCountUp(int bNo);

 List<CommentDTO> getCommentList(String no);


 int getPrevView(String no);

 int getNextView(String no);

    int isMatchId(String loginId, String no);

 Map<String,Object> getReviewUpdate(String no);

 void reviewUpdate(ReviewDTO reviewDTO);

    void reviewDelete(String bNo);

 void commentUpdate(String cNo, String cContent);

 void commentDelete(String cNo);

 void boardCommentMinus(String bNo);
}
