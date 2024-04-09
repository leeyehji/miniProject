package com.nadeuli.review.service;

import com.nadeuli.review.bean.ReviewDTO;
import com.nadeuli.review.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO reviewDAO;
    @Override
    public void reviewWrite(ReviewDTO reviewDTO) {

        reviewDAO.reviewWrite(reviewDTO);

    }

    @Override
    public List<ReviewDTO> getReviewList() {
        return reviewDAO.getReviewList();
    }
}
