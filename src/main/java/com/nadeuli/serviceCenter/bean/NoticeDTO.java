package com.nadeuli.serviceCenter.bean;


import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
@Getter
@Setter
public class NoticeDTO {
        private Long memNo;
        private Long nNo;
        private String nSubject;
        private String nContent;
        private String nWriter;
        private LocalDateTime nCreateTime;

}
