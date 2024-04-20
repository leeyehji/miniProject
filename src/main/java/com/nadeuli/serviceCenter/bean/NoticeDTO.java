package com.nadeuli.serviceCenter.bean;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Repository;

import java.util.Date;


//@Repository
@Getter
@Setter
@ToString
public class NoticeDTO {
        private Long mem_No;
        private Long n_No;
        private String n_Subject;
        private String n_Content;
        private String n_Writer;
        private Date n_CreateTime;
        private String n_Photo_Path;

//        public void setN_PhotoPath(String n_PhotoPath) {
//                this.n_PhotoPath = n_PhotoPath;
//        }

}
