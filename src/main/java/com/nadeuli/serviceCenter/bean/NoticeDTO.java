package com.nadeuli.serviceCenter.bean;


import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
@Getter
@Setter
public class NoticeDTO {
        private Long mem_No;
        private Long n_No;
        private String n_Subject;
        private String n_Content;
        private String n_Writer;
        private LocalDateTime n_CreateTime;
}
