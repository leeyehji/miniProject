// MapDAO.java
package com.nadeuli.map.dao;

import com.nadeuli.map.dto.MapDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MapDAO {

//    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contenttypeId}")
//    List<MapDTO> findCoordinatesByContentTypeId(int contenttypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '서울'")
    List<MapDTO> findCoordinatesByContentTypeIdOfSeoul(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '경기'")
    List<MapDTO> findCoordinatesByContentTypeIdOfGyeonggi(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '인천'")
    List<MapDTO> findCoordinatesByContentTypeIdOfIncheon(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '강원'")
    List<MapDTO> findCoordinatesByContentTypeIdOfGangwon(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '충북'")
    List<MapDTO> findCoordinatesByContentTypeIdOfChungbuk(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '충남'")
    List<MapDTO> findCoordinatesByContentTypeIdOfChungnam(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '전북'")
    List<MapDTO> findCoordinatesByContentTypeIdOfJeonbuk(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '전남'")
    List<MapDTO> findCoordinatesByContentTypeIdOfJeonnam(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '경북'")
    List<MapDTO> findCoordinatesByContentTypeIdOfGyeongbuk(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '경남'")
    List<MapDTO> findCoordinatesByContentTypeIdOfGyeongnam(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '제주'")
    List<MapDTO> findCoordinatesByContentTypeIdOfJeju(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '세종'")
    List<MapDTO> findCoordinatesByContentTypeIdOfSejong(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '대전'")
    List<MapDTO> findCoordinatesByContentTypeIdOfDaejeon(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '광주'")
    List<MapDTO> findCoordinatesByContentTypeIdOfGwangju(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '울산'")
    List<MapDTO> findCoordinatesByContentTypeIdOfUlsan(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '부산'")
    List<MapDTO> findCoordinatesByContentTypeIdOfBusan(int contentTypeId);

    @Select("SELECT * FROM TRAVEL WHERE T_CONTENTTYPEID = #{contentTypeId} AND T_SIDO = '대구'")
    List<MapDTO> findCoordinatesByContentTypeIdOfDaegu(int contentTypeId);

}