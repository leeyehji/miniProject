package com.nadeuli.serviceCenter.controller;

import com.nadeuli.common.object.service.ObjectStorageService;
import com.nadeuli.serviceCenter.service.ServiceCenterMailService;
import com.nadeuli.serviceCenter.service.ServiceCenterService;
import com.nadeuli.serviceCenter.bean.NoticeDTO;
import com.nadeuli.serviceCenter.bean.InquiryDTO;
import com.nadeuli.serviceCenter.bean.FaqDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ServiceCenterController {

    private final ServiceCenterMailService mailService; // 서비스 주입

    private final JavaMailSender mailSender;

    private final ServiceCenterService serviceCenterService;

    private final ObjectStorageService objectStorageService;

    private final String bucketName = "miniproject";


    @GetMapping(value = "/serviceCenter/ServiceCenter")
    public String getServiceCenter(Model model, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "size", defaultValue = "10") int size) {
        if (page > 1) {
            page = (page - 1) * size;
        } else {
            page -= 1;
        }
        List<NoticeDTO> allNotices = serviceCenterService.selectNoticesWithPaging(page, size);
        model.addAttribute("notices", allNotices);

        System.out.println("allNotices = " + allNotices);
        model.addAttribute("notices", allNotices);
        model.addAttribute("inquiries", serviceCenterService.findAllInquiries());
        model.addAttribute("faqs", serviceCenterService.findAllFaqs());
        return "serviceCenter/ServiceCenter";
    }

    @GetMapping(value = "/serviceCenter/NoticeDetail/{n_No}")
    public String getNoticeDetail(Model model, @PathVariable Long n_No) {
        System.out.println("n_No = " + n_No);
        NoticeDTO noticeById = serviceCenterService.findNoticeById(n_No);
        model.addAttribute("notice", noticeById);
        System.out.println("noticeById = " + noticeById);
        return "serviceCenter/NoticeDetail";
    }

    @GetMapping(value = "/serviceCenter/Inquiry")
    public String getInquiry(Model model) {
        model.addAttribute("inquiries", serviceCenterService.findAllInquiries());
        return "serviceCenter/Inquiry";
    }

    @PostMapping("/faqs")
    @ResponseBody
    public ResponseEntity<String> insertFaq(@RequestBody Map<String,String > json) {
        FaqDTO faqDTO = new FaqDTO();
        faqDTO.setMem_No(3L);
//        관리자 번호 확정되면 번호 수정
        System.out.println(faqDTO.getMem_No());
        faqDTO.setFaq_Subject(json.get("faq_Subject"));
        System.out.println(faqDTO.getFaq_Subject());
        faqDTO.setFaq_Content(json.get("faq_Content"));
        System.out.println(faqDTO.getFaq_Content());
        serviceCenterService.insertFaq(faqDTO);
        return ResponseEntity.ok().body("FAQ가 성공적으로 입력되었습니다.");
    }

    @GetMapping("/faqs")
    @ResponseBody
    public ResponseEntity<FaqDTO> getFaqs(@RequestParam("faq_no") Integer faq_no) {
        FaqDTO faqDTO = serviceCenterService.findFaqByNo(faq_no);

        return ResponseEntity.ok().body(faqDTO);
    }

    @GetMapping(value = "/serviceCenter/Faq")
    public String getAllFaqs(Model model) {
        List<FaqDTO> faqDTOList = serviceCenterService.findAllFaqs(); // 모든 FAQ 조회
        model.addAttribute("faqs", faqDTOList);
        return "serviceCenter/Faq"; // FAQ 목록 페이지
    }

    @PostMapping("/serviceCenter/notices")
    public String insertNotice(MultipartHttpServletRequest request) {

        List<MultipartFile> fileList = request.getFiles("file");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        if (fileList.isEmpty()) {
            System.out.println("파일이 첨부되지 않았습니다.");
            return "redirect:/serviceCenter/ServiceCenter";
        }

        for (MultipartFile file : fileList) {
            if (!file.isEmpty()) {
                String photoPath = savePhoto(file); // 파일 저장 로직

                NoticeDTO noticeDTO = new NoticeDTO();
                noticeDTO.setMem_No(3L); // 실제 사용 시 적절한 값으로 변경
                noticeDTO.setN_Subject(subject);
                noticeDTO.setN_Content(content);
                noticeDTO.setN_Writer("관리자");
                noticeDTO.setN_Photo_Path(photoPath);

                System.out.println("noticeDTO = " + noticeDTO);

                serviceCenterService.insertNotice(noticeDTO);

                System.out.println("공지사항이 작성 되었습니다.");
                // 모든 파일 처리 후 리다이렉트
            }
        }
        return "redirect:/serviceCenter/ServiceCenter";
    }

    private String savePhoto(MultipartFile photo) {
        // 파일이 비어있지 않은지 확인
        System.out.println("photo = " + photo.getOriginalFilename());
        System.out.println("photo = " + photo.getName());
        System.out.println("photo = " + photo.getContentType());
        if (!photo.isEmpty()) {
            try {
                // 파일의 원본 이름 가져오기
                String originalFileName = photo.getOriginalFilename();
                // 파일의 확장자 추출
                String extension = Objects.requireNonNull(originalFileName).substring(originalFileName.lastIndexOf("."));
                // 서버에 저장할 파일 이름을 생성 (예: UUID + 확장자를 사용하여 중복 방지)
                String savedFileName = UUID.randomUUID() + extension;
                // 저장할 파일의 전체 경로 생성

                System.out.println("originalFileName = " + originalFileName);
                System.out.println("extension = " + extension);
                System.out.println("savedFileName = " + savedFileName);

                String imageFileName = null;
                imageFileName = objectStorageService.uploadFile(bucketName, "storage/notice/", photo);

//                File file = new File(filePath, imageFileName);

                // 파일을 지정된 경로에 저장
//                File file = new File(fullPath);
//                photo.transferTo(file);

                // 저장된 파일의 경로 반환
                return imageFileName;
            } catch (Exception e) {
                // 예외 처리 로직 (예외 로그 출력, 에러 처리 등)
                e.printStackTrace();
            }
        }
        // 파일 저장 실패 시, 빈 문자열 또는 에러 메시지 반환
        return "이미지 업로드 실패";
    }

    @GetMapping("/notices/{nNo}")
    public ResponseEntity<NoticeDTO> findNoticeById(@PathVariable Long nNo) {
        NoticeDTO notice = serviceCenterService.findNoticeById(nNo);
        return ResponseEntity.ok(notice);
    }

    @PutMapping("/notices")
    public ResponseEntity<NoticeDTO> updateNotice(@RequestBody NoticeDTO notice) {
        serviceCenterService.updateNotice(notice);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/notices/{nNo}")
    public ResponseEntity<NoticeDTO> deleteNotice(@PathVariable Long nNo) {
        
        // ncp에 저장한 공지사항 사진 삭제
        NoticeDTO findNotice = serviceCenterService.findNoticeById(nNo);
        System.out.println("findNotice = " + findNotice);
        String nPhotoPath = findNotice.getN_Photo_Path();
        System.out.println("nPhotoPath = " + nPhotoPath);
        objectStorageService.deleteFile(bucketName, "/storage/notice/" +nPhotoPath);
        // 공지사항 글 DB 삭제
        serviceCenterService.deleteNotice(nNo);
        
        return ResponseEntity.ok().build();
    }

    @PostMapping("/inquiries")
    public ResponseEntity<InquiryDTO> insertInquiry(@RequestBody InquiryDTO inquiry) {
        serviceCenterService.insertInquiry(inquiry);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/inquiries/{qNo}")
    public ResponseEntity<InquiryDTO> findInquiryById(@PathVariable Integer qNo) {
        InquiryDTO inquiry = serviceCenterService.findInquiryById(qNo);
        return ResponseEntity.ok(inquiry);
    }

    @GetMapping("/inquiries/answered/{qIsAnswered}")
    public ResponseEntity<List<InquiryDTO>> findInquiriesByAnswered(@PathVariable Integer qIsAnswered) {
        List<InquiryDTO> inquiries = serviceCenterService.findInquiriesByAnswered(qIsAnswered);
        return ResponseEntity.ok(inquiries);
    }

    @PutMapping("/inquiries")
    public ResponseEntity<InquiryDTO> updateInquiry(@RequestBody InquiryDTO inquiry) {
        serviceCenterService.updateInquiry(inquiry);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/inquiries/{qNo}")
    public ResponseEntity<InquiryDTO> deleteInquiry(@PathVariable Integer qNo) {
        serviceCenterService.deleteInquiry(qNo);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/faqs")
    public ResponseEntity<FaqDTO> updateFaq(@RequestBody FaqDTO faq) {
        serviceCenterService.updateFaq(faq);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/faqs/{faqNo}")
    public ResponseEntity<FaqDTO> deleteFaq(@PathVariable Integer faqNo) {
        serviceCenterService.deleteFaq(faqNo);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/notices")
    public ResponseEntity<List<NoticeDTO>> findAllNotices() {
        List<NoticeDTO> notices = serviceCenterService.findAll();
        return ResponseEntity.ok(notices);
    }

    @PostMapping("/sendEmail")
    public ResponseEntity<String> sendEmail(@RequestBody Map<String,String> request) {
        // inquiryDTO 내부에 MemberRequestDTO 정보가 포함되어 있다고 가정

        boolean isSent = mailService.sendInquiryEmail(request.get("MEM_EMAIL"),request.get("MEM_NAME"),request.get("q_Content"));
        if(isSent) {
            return ResponseEntity.ok().body("이메일이 성공적으로 전송되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("이메일 전송에 실패했습니다.");
        }
    }

}

