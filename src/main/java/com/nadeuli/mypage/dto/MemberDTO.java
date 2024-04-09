package com.nadeuli.mypage.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberDTO {	//임시 memberDTO.
	//private int mem_no;
	private String mem_id;
	private String mem_name;
	private String mem_pw;
	private String mem_phone;
	private String mem_email;
	private int mem_gender;	
	private Date mem_joinDate;
}
