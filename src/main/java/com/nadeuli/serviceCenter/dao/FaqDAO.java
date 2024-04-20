package com.nadeuli.serviceCenter.dao;

import com.nadeuli.serviceCenter.bean.FaqDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FaqDAO {
    void insertFaq(FaqDTO faq);

    void saveFaq(FaqDTO faq);
    // FAQ 삭제
    void deleteFaq(Integer faqNo);

    // FAQ 번호로 조회
    FaqDTO findFaqByNo(Integer faqNo);

    // 모든 FAQ 조회
    List<FaqDTO> findAllFaqs();


    // FAQ 업데이트
    void updateFaq(FaqDTO faq);

}
