package com.nadeuli.serviceCenter.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
@Getter
@Setter
public class InquiryDTO {
        private Long memNo;
        private Integer qNo;
        private Integer qIsAnswered;
        private String qSubject;
        private String qContent;
        private LocalDateTime qCreateTime;

}
