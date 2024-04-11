package com.nadeuli.map.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class MapDTO implements Serializable {
    private double t_mapx;
    private double t_mapy;
}