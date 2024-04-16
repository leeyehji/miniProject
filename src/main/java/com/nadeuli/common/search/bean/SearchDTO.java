package com.nadeuli.common.search.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

@Repository
@Setter
@Getter
public class SearchDTO {
    private String T_THUMB_IMAGE;
    private String T_CONTENTNAME;
    private String T_INFORMATION;
    private String T_ADDRESS;
    private String T_SIDO;
    private String T_CAT1;
    private String T_CAT2;
    private String T_CAT3;
    private String T_CONTENTNO;
    private String T_CONTENTTYPEID;
}