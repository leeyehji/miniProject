package com.nadeuli.member.dto;

import lombok.*;

@Getter
@Setter
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberRequestDTO {

    private String MEM_NAME;
    private String MEM_ID;
    private String MEM_PW;
    private String MEM_PHONE;
    private String MEM_EMAIL;
    private int MEM_GENDER;


}
