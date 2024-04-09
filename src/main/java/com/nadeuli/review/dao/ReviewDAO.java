package com.nadeuli.review.dao;

import com.nadeuli.review.bean.ReviewDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewDAO {
    public void reviewWrite(ReviewDTO reviewDTO);

    public List<ReviewDTO> getReviewList();
    public ReviewDTO getReviewView(int bNo);
}
