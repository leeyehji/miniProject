package com.nadeuli.review.service;


import com.nadeuli.review.bean.ReviewDTO;

import java.util.List;

public interface ReviewService {
   public void reviewWrite(ReviewDTO reviewDTO);

    public List<ReviewDTO> getReviewList();
}
