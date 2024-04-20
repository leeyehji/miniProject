package com.nadeuli.serviceCenter.dao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(value = "com.nadeuli.serviceCenter.dao")
public class MapperConfig {

}
