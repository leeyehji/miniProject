package com.nadeuli.serviceCenter.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

//@Repository
@Getter
@Setter
@ToString
public class FaqDTO {
    private Long mem_No;
    private Integer faq_No;
    private String faq_Subject;
    private String faq_Content;
    private LocalDateTime faq_CreateTime;
}