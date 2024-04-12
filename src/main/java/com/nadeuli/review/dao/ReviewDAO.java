package com.nadeuli.review.dao;

import com.nadeuli.review.bean.CommentDTO;
import com.nadeuli.review.bean.ReviewDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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
}
