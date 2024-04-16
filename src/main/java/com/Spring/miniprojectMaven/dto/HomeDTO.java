package com.Spring.miniprojectMaven.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class HomeDTO implements Serializable {
    private String t_contentno;
    private String t_contenttypeid;
    private String t_thumb_image;
    private String t_contentname;
}
