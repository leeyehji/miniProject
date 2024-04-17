package com.nadeuli.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Getter
@Setter
public class NaverMemberDTO {
    private String id;
    private String email;
    private String name;
    private String gender;
    private String mobile ;
}
