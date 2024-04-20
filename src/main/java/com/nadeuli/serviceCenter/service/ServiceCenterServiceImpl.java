package com.nadeuli.serviceCenter.service;

import com.nadeuli.common.object.service.ObjectStorageService;
import com.nadeuli.serviceCenter.bean.FaqDTO;
import com.nadeuli.serviceCenter.bean.InquiryDTO;
import com.nadeuli.serviceCenter.bean.NoticeDTO;
import com.nadeuli.serviceCenter.dao.FaqDAO;
import com.nadeuli.serviceCenter.dao.NoticeDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ServiceCenterServiceImpl implements ServiceCenterService {

    private final FaqDAO faqDAO;
    private final NoticeDAO noticeDAO;

    @Transactional
    @Override
    public void insertFaq(FaqDTO faqDTO) {
        faqDAO.insertFaq(faqDTO);
    }



    @Override
    public void insertNotice(NoticeDTO notice) {
        noticeDAO.insertNotice(notice);
    }

    @Override
    public NoticeDTO findNoticeById(Long nNo) {
        return noticeDAO.findNoticeById(nNo);
    }

    @Override
    public List<NoticeDTO> findAllNotices() {
        return noticeDAO.findAllNotices();
    }

    @Transactional
    @Override
    public void updateNotice(NoticeDTO notice) {
        noticeDAO.updateNotice(notice);
    }

    @Transactional
    @Override
    public void deleteNotice(Long nNo) {
        noticeDAO.deleteNotice(nNo);
    }


    @Override
    public void insertInquiry(InquiryDTO inquiry) {

    }

    @Override
    public InquiryDTO findInquiryById(Integer qNo) {
        return null;
    }

    @Override
    public List<InquiryDTO> findAllInquiries() {
        return List.of();
    }

    @Override
    public List<InquiryDTO> findInquiriesByAnswered(Integer qIsAnswered) {
        return List.of();
    }

    @Override
    public void updateInquiry(InquiryDTO inquiry) {

    }

    @Override
    public void deleteInquiry(Integer qNo) {

    }

    @Override
    public FaqDTO findFaqByNo(Integer faqNo) {
        return faqDAO.findFaqByNo(faqNo);
    }

    @Override
    public List<FaqDTO> findAllFaqs() {
        return faqDAO.findAllFaqs();
    }

    @Override
    public void updateFaq(FaqDTO faq) {

    }

    @Override
    public void deleteFaq(Integer faqNo) {

    }

    @Override
    public List<NoticeDTO> findAll() {
        return List.of();
    }

    @Override
    public List<InquiryDTO> findByAnswered(Integer qIsAnswered) {
        return List.of();
    }

    @Override
    public List<NoticeDTO> selectNoticesWithPaging(int offset, int limit) {
        return noticeDAO.selectNoticesWithPaging(offset, limit);
    }
}