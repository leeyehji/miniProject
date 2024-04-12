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
}