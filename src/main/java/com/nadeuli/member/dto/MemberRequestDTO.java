package com.nadeuli.member.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
public class MemberRequestDTO {

    private String MEM_NAME;
    private String MEM_ID;
    private String MEM_PW;
    private String MEM_PHONE;
    private String MEM_EMAIL;
    private int MEM_GENDER;


}
