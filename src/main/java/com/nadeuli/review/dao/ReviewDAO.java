package com.nadeuli.review.dao;

import com.nadeuli.review.bean.CommentDTO;
import com.nadeuli.review.bean.ReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReviewDAO {
    public void reviewWrite(ReviewDTO reviewDTO);
    public List<ReviewDTO> getReviewList(int startNum);
    public ReviewDTO getReviewView(int bNo);
    public void boardViewPlus(int bNo);
    public void clickLike(int bNo);
    public int getTotalA();

    public void commentWrite(CommentDTO commentDTO);

    public void commentCountUp(int bNo);

    List<CommentDTO> getCommentList(int bNo);

    int getPrevView(@Param(value="B_NO") int bNo);

    int getNextView(@Param(value="B_NO") int bNo);

    int isMatchId(Map<String, Object> isMatchMap);

    Map<String, Object> getReviewUpdate(int bNo);

    void reviewUpdate(ReviewDTO reviewDTO);

    void reviewDelete(int bNo);

    void reviewCommentDelete(int bNo);

    void commentUpdate(Map<String, Object> commentUpdateMap);

    void commentDelete(int cNo);

    void boardCommentMinus(int bNo);
}
