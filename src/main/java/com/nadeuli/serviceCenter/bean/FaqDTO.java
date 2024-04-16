package com.nadeuli.serviceCenter.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
@Getter
@Setter
public class FaqDTO {
    private Long memNo;
    private Integer fapNo;
    private String faqSubject;
    private String faqContent;
    private LocalDateTime faqCreateTime;

}
