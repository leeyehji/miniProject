package com.nadeuli.serviceCenter.dao;


import com.nadeuli.serviceCenter.bean.FaqDTO;
import com.nadeuli.serviceCenter.bean.InquiryDTO;
import com.nadeuli.serviceCenter.bean.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface serviceCenterDAO {

    // 공지사항 추가
    void insertNotice(NoticeDTO notice);

    // 공지사항 ID로 조회
    NoticeDTO findNoticeById(Long nNo);

    // 모든 공지사항 조회
    List<NoticeDTO> findAllNotices();

    // 공지사항 업데이트
    void updateNotice(NoticeDTO notice);

    // 공지사항 삭제
    void deleteNotice(Long nNo);

    // 문의사항 추가
    void insertInquiry(InquiryDTO inquiry);

    // 문의사항 ID로 조회
    InquiryDTO findInquiryById(Integer qNo);

    // 모든 문의사항 조회
    List<InquiryDTO> findAllInquiries();

    // 답변 여부에 따른 문의사항 조회
    List<InquiryDTO> findInquiriesByAnswered(Integer qIsAnswered);

    // 문의사항 업데이트
    void updateInquiry(InquiryDTO inquiry);

    // 문의사항 삭제
    void deleteInquiry(Integer qNo);

    // FAQ 추가
    void insertFaq(FaqDTO faq);

    // FAQ 번호로 조회
    FaqDTO findFaqByNo(Integer faqNo);

    // 모든 FAQ 조회
    List<FaqDTO> findAllFaqs();

    // FAQ 업데이트
    void updateFaq(FaqDTO faq);

    // FAQ 삭제
    void deleteFaq(Integer faqNo);





}
