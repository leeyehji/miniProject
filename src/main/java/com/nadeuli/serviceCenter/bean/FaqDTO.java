package com.nadeuli.serviceCenter.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
@Getter
@Setter
public class FaqDTO {
    private Long mem_No;
    private Integer fap_No;
    private String faq_Subject;
    private String faq_Content;
    private LocalDateTime faq_CreateTime;

}