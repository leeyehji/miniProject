// MapDAO.java
package com.nadeuli.map.dao;

import com.nadeuli.map.dto.MapDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MapDAO {

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contenttypeId}")
    List<MapDTO> findCoordinatesByContentTypeId(int contenttypeId);
}