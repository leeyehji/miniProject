package com.nadeuli.review.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
@Getter
@Setter
public class CommentDTO {
    private int MEM_NO;
    private String MEM_PROFILEIMAGE;
    private String MEM_ID;
    private int B_NO;
    private int C_NO;
    private String C_CONTENT;
    private String C_CREATETIME;

}
