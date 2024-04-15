package com.nadeuli.thema.bean;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;


@Repository
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ThemaDTO {

    private int T_CONTENTNO;
    private int T_CONTENTTYPEID;
    private String T_CONTENTNAME;
    private String T_MAIN_IMAGE;
    private String T_THUMB_IMAGE;
    private String T_ADDRESS;
    private String T_PHONE;
    private String T_INFORMATION;
    private String T_HOMEPAGE;
    private int T_VIEW;
    private int T_LIKE;

    private int A_NO;
    private TypeTwelve typeTwelve;
    private TypeTwoEight typeTwoEight;
    private TypeFourteen typeFourteen;
    private TypeFifteen typeFifteen;
    private TypeThirtyTwo typeThirtyTwo;
    private TypeThirtyEight typeThirtyEight;
    private TypeThirtyNine typeThirtyNine;

}
