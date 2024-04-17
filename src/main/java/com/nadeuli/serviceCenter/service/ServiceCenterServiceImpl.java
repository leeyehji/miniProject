package com.nadeuli.serviceCenter.service;

import com.nadeuli.serviceCenter.bean.FaqDTO;
import com.nadeuli.serviceCenter.bean.InquiryDTO;
import com.nadeuli.serviceCenter.bean.NoticeDTO;
import com.nadeuli.serviceCenter.dao.ServiceCenterDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {
    private final ServiceCenterDAO serviceCenterDAO;

    @Autowired
    public ServiceCenterServiceImpl(ServiceCenterDAO serviceCenterDAO) {
        this.serviceCenterDAO = serviceCenterDAO;
    }


    @Override
    public void insertNotice(NoticeDTO notice) {
        serviceCenterDAO.saveNotice(notice);
    }

    @Override
    public NoticeDTO findNoticeById(Long nNo) {
        return null;
    }

    @Override
    public NoticeDTO findNoticeById(Integer nNo) {
        return (NoticeDTO) serviceCenterDAO.findById(nNo).orElse(null);
    }

    @Override
    public List<NoticeDTO> findAllNotices() {
        return serviceCenterDAO.findAllNotices();
    }

    @Override
    public void updateNotice(NoticeDTO notice) {
        serviceCenterDAO.updateNotice(notice);
    }

    @Override
    public void deleteNotice(Long nNo) {
        serviceCenterDAO.deleteNotice(nNo);
    }

    @Override
    public void insertInquiry(InquiryDTO inquiry) {
        serviceCenterDAO.insertInquiry(inquiry);
    }

    @Override
    public InquiryDTO findInquiryById(Integer qNo) {
        return serviceCenterDAO.findInquiryById(qNo);
    }

    @Override
    public List<InquiryDTO> findAllInquiries() {
        return serviceCenterDAO.findAllInquiries();
    }

    @Override
    public List<InquiryDTO> findInquiriesByAnswered(Integer qIsAnswered) {
        return serviceCenterDAO.findInquiriesByAnswered(qIsAnswered);
    }

    @Override
    public void updateInquiry(InquiryDTO inquiry) {
        serviceCenterDAO.updateInquiry(inquiry);
    }

    @Override
    public void deleteInquiry(Integer qNo) {
        serviceCenterDAO.deleteById(qNo);
    }

    @Override
    public void insertFaq(FaqDTO faq) {
        serviceCenterDAO.saveFaq(faq);
    }

    @Override
    public FaqDTO findFaqByNo(Integer faqNo) {
        return serviceCenterDAO.findFaqByNo(faqNo);
    }

    @Override
    public List<FaqDTO> findAllFaqs() {
        return serviceCenterDAO.findAllFaqs();
    }

    @Override
    public void updateFaq(FaqDTO faq) {
        serviceCenterDAO.updateFaq(faq);
    }

    @Override
    public void deleteFaq(Integer faqNo) {
        serviceCenterDAO.deleteById(faqNo);
    }

    @Override
    public List<NoticeDTO> findAll() {
        return List.of();
    }

    @Override
    public List<InquiryDTO> findByAnswered(Integer qIsAnswered) {
        return serviceCenterDAO.findByAnswered(qIsAnswered); // 이 메소드는 답변 여부에 따른 문의사항을 조회합니다.
    }
}