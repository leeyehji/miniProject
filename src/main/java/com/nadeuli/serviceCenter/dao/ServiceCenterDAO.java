//package com.nadeuli.serviceCenter.dao;
//
//
//import com.nadeuli.serviceCenter.bean.FaqDTO;
//import com.nadeuli.serviceCenter.bean.InquiryDTO;
//import com.nadeuli.serviceCenter.bean.NoticeDTO;
//import org.apache.ibatis.annotations.Mapper;
//import org.mybatis.spring.annotation.MapperScan;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.List;
//import java.util.Optional;
//
////@Mapper
//public interface ServiceCenterDAO {
//
//    // 공지사항 추가
//    void insertNotice(NoticeDTO notice);
//
//    // 공지사항 ID로 조회
//    NoticeDTO findNoticeById(Long nNo);
//
//    // 모든 공지사항 조회
//    List<NoticeDTO> findAllNotices();
//
//    // 공지사항 업데이트
//    void updateNotice(NoticeDTO notice);
//
//    // 공지사항 삭제
//    void deleteNotice(Long nNo);
//
//    // 문의사항 추가
//    void insertInquiry(InquiryDTO inquiry);
//
//    // 문의사항 ID로 조회
//    InquiryDTO findInquiryById(Integer qNo);
//
//    // 모든 문의사항 조회
//    List<InquiryDTO> findAllInquiries();
//
//    // 답변 여부에 따른 문의사항 조회
//    List<InquiryDTO> findInquiriesByAnswered(Integer qIsAnswered);
//
//    List<NoticeDTO> findAll();
//
//    void saveInquiry(InquiryDTO notice);
//
//    Optional<Object> findById(Integer qNo);
//
//    List<InquiryDTO> findByAnswered(Integer qIsAnswered);
//
//    void deleteById(Integer qNo);
//
//    void saveNotice(NoticeDTO notice);
//
//    void updateInquiry(InquiryDTO inquiry);
//
//
//}