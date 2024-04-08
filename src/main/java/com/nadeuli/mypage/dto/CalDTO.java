package com.nadeuli.mypage.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalDTO {
	private Date cal_startDate;
	private Date cal_endDate;
	private String cal_title;
	private String cal_memo;
	private String cal_color;
	private String cal_boardNo;
	private int cal_no;
}
