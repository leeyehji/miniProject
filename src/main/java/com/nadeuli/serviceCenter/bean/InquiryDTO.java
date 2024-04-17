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
        private Long memNo;
        private Integer qNo;
        private Integer qIsAnswered;
        private String qSubject;
        private String qContent;
        private LocalDateTime qCreateTime;

        private MemberRequestDTO memberRequest; // MemberRequestDTO 타입의 필드 추가
}
