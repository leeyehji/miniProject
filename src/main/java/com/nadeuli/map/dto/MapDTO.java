package com.nadeuli.map.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class MapDTO implements Serializable {
    private double t_mapx;
    private double t_mapy;
    private String t_contentname;
    private String t_address;
    private String t_thumb_image;
    private String t_phone;
    private String t_contenttypeid;
    private String t_contentno;
}