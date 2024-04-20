package com.nadeuli.serviceCenter.dao;

import com.nadeuli.serviceCenter.bean.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NoticeDAO {
    void insertNotice(NoticeDTO notice);
    NoticeDTO findNoticeById(Long nNo);
    List<NoticeDTO> findAllNotices();
    void updateNotice(NoticeDTO notice);
    void deleteNotice(Long nNo);

    @Select(value = "SELECT * FROM NOTICE ORDER BY N_CREATETIME DESC LIMIT #{offset}, #{limit}")
    List<NoticeDTO> selectNoticesWithPaging(@Param("offset") int offset, @Param("limit") int limit);
}