package com.nadeuli.serviceCenter.service;

import com.nadeuli.serviceCenter.bean.NoticeDTO;
import com.nadeuli.serviceCenter.bean.InquiryDTO;
import com.nadeuli.serviceCenter.bean.FaqDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//@Mapper
public interface ServiceCenterService {

    void insertFaq(FaqDTO faq);

    void insertNotice(NoticeDTO notice);

    NoticeDTO findNoticeById(Long nNo);

    List<NoticeDTO> findAllNotices();

    void updateNotice(NoticeDTO notice);

    void deleteNotice(Long nNo);

    void insertInquiry(InquiryDTO inquiry);

    InquiryDTO findInquiryById(Integer qNo);

    List<InquiryDTO> findAllInquiries();

    List<InquiryDTO> findInquiriesByAnswered(Integer qIsAnswered);

    void updateInquiry(InquiryDTO inquiry);

    void deleteInquiry(Integer qNo);

    FaqDTO findFaqByNo(Integer faqNo);

    List<FaqDTO> findAllFaqs();

    void updateFaq(FaqDTO faq);

    void deleteFaq(Integer faqNo);

    List<NoticeDTO> findAll();

    List<InquiryDTO> findByAnswered(Integer qIsAnswered);

    List<NoticeDTO> selectNoticesWithPaging(int offset, int limit);

}