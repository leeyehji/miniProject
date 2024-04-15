package com.nadeuli.thema.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
@Getter
@Setter
public class CommonDTO {

    private int T_CONTENTNO;
    private String T_SIDO;
    private String T_SIGUNGU;
    private int T_CONTENTTYPEID;
    private String T_CONTENTID;
    private String T_CONTENTNAME;
    private String T_MAIN_IMAGE;
    private String T_THUMB_IMAGE;
    private String T_MAPX;
    private String T_MAPY;
    private String T_CAT1;
    private String T_CAT2;
    private String T_CAT3;
    private String T_ADDRESS;
    private String T_PHONE;
    private String T_INFORMATION;
    private String T_HOMEPAGE;
    private int T_VIEW;
    private int T_LIKE;

}
