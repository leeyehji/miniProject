package com.nadeuli.review.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

@Repository
@Getter
@Setter
public class ReviewDTO {
    private int MEM_NO;
    private String MEM_ID;
    private String B_NO;
    private String B_TITLE;
    private String B_CONTENT;
    private String B_THUMBNAIL;
    private String B_VIEW;
    private String B_LIKE;
    private String B_CREATETIME;
    private String B_COMMENTCOUNT;
    private String B_IS_ADMIN;
    private String B_SECRET;
}
