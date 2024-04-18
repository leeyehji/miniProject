package com.nadeuli.serviceCenter.bean;

import com.nadeuli.member.dto.MemberRequestDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InquiryDTO {
        private Long mem_No;
        private Integer q_No;
        private Integer q_IsAnswered;
        private String q_Subject;
        private String q_Content;
        private LocalDateTime q_CreateTime;

        private MemberRequestDTO member_Request; // MemberRequestDTO 타입의 필드 추가
}
