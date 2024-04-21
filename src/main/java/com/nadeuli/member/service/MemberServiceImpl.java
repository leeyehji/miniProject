package com.nadeuli.member.service;


import com.nadeuli.member.dto.MemberRequestDTO;
import com.nadeuli.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service

public class MemberServiceImpl implements MemberService {

    @Autowired
    private  MemberRepository memberRepository;

    private static final String EMAIL_PATTERN =
            "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

    public static boolean validateEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    /*로그인 구현 */
    @Override
    public boolean login(MemberRequestDTO memberRequestDTO) {
        // MemberRepository의 인스턴스 메소드를 호출하도록 수정
        System.out.println("MemberServiceImpl.login");
        System.out.println("memberRequestDTO = " + memberRequestDTO);
        MemberRequestDTO loginMember = memberRepository.login(memberRequestDTO);
        String MEM_ID = memberRequestDTO.getMEM_ID();
        String MEM_PW = memberRequestDTO.getMEM_PW();
        System.out.println(MEM_PW);
        if (loginMember!=null){
            return true;
        }else
            return false;
    }

    /*아이디 유효성 검사*/
    @Override
    public boolean checkId(String MEM_ID) {

        MemberRequestDTO checkId = memberRepository.checkId(MEM_ID);
        System.out.println("checkId = " + checkId);
        if (checkId == null) {
            return false;
        } else
            return true;
    }
    /**
    회원가입*/
    @Override
    public boolean memberJoin(MemberRequestDTO memberRequestDTO) {

//        if(memberRequestDTO .getMEM_PW()!= null){
//            memberRepository.memberJoin(memberRequestDTO);
//            return true;
//        }
//        return false;

        if (memberRequestDTO.getMEM_PW() == null ||
                memberRequestDTO.getMEM_NAME() == null ||
                memberRequestDTO.getMEM_PHONE() == null ||
                memberRequestDTO.getMEM_EMAIL() == null ||
                memberRequestDTO.getMEM_ID() == null ) {
            return false;
        }else if (memberRequestDTO.getMEM_EMAIL().trim().isEmpty() ||
                memberRequestDTO.getMEM_ID().trim().isEmpty()||
                memberRequestDTO.getMEM_NAME().trim().isEmpty()||
                memberRequestDTO.getMEM_PHONE().trim().isEmpty()){
            return false;
        }else if (memberRequestDTO.getMEM_NAME().length()<3){
            return false;
        }else if(memberRequestDTO.getMEM_PW().length()<=6){
            return false;
        }else if (!validateEmail(memberRequestDTO.getMEM_EMAIL())) {
            return false;
        }else return true;

    }
    /*이메일 유효성 검사 */
    @Override
    public boolean checkEmail(String MEM_EMAIL) {
        MemberRequestDTO email =memberRepository.chekcEmail(MEM_EMAIL);
        if (email != null){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public MemberRequestDTO processOAuthUser(String MEM_EMAIL, String MEM_ID) {
        return null;
    }
    /**
     * 아이디 찾기
     * */
    @Override
    public String lostId(MemberRequestDTO memberRequestDTO) {
        if (memberRequestDTO.getMEM_NAME() == null || memberRequestDTO.getMEM_NAME().isEmpty()) {
            return "이름을 입력해주세요.";
        }
        if (memberRequestDTO.getMEM_EMAIL() == null || memberRequestDTO.getMEM_EMAIL().isEmpty()) {
            return "이메일을 입력해주세요.";
        }
        String memberId = memberRepository.findMemberIdByNameAndEmail(memberRequestDTO.getMEM_NAME(), memberRequestDTO.getMEM_EMAIL());

        // 이름이나 이메일이 일치하지 않을 때의 처리
        if(memberId == null) {
            if(memberRepository.existsByMEM_NAME(memberRequestDTO.getMEM_NAME())
                    && !memberRepository.existsByMEM_EMAIL(memberRequestDTO.getMEM_EMAIL())) {
                return "이메일이 일치하지 않습니다.";
            } else if(!memberRepository.existsByMEM_NAME(memberRequestDTO.getMEM_NAME())
                    && memberRepository.existsByMEM_EMAIL(memberRequestDTO.getMEM_EMAIL())) {
                return "이름이 일치하지 않습니다.";
            } else {
                return "해당하는 사용자 정보를 찾을 수 없습니다.";
            }
        }
        return memberId ;
    }


    /**
     * 비밀번호 찾기
     */

    @Override

    public String lostPwd (MemberRequestDTO memberRequestDTO) {
        // 이름
        if (memberRequestDTO.getMEM_NAME() == null || memberRequestDTO.getMEM_NAME().isEmpty()) {
            return "이름을 입력해주세요.";
        }
        // 이메일
        if (memberRequestDTO.getMEM_EMAIL() == null || memberRequestDTO.getMEM_EMAIL().isEmpty()) {
            return "이메일을 입력해주세요.";
        }
        // 아이디
        if (memberRequestDTO.getMEM_ID() == null || memberRequestDTO.getMEM_ID().isEmpty()) {
            return "아이디를 입력해 주세요.";
        }
        // 전화번호
        if (memberRequestDTO.getMEM_PHONE() == null || memberRequestDTO.getMEM_PHONE().isEmpty()) {
            return "전화번호를 입력해 주세요.";
        }

        // 비밀번호
        String memberPW = memberRepository.findPasswordByNameEmailIdPhone(
                memberRequestDTO.getMEM_NAME(),
                memberRequestDTO.getMEM_EMAIL(),
                memberRequestDTO.getMEM_ID(),
                memberRequestDTO.getMEM_PHONE()
        );
        if (memberPW == null) {
            // 이름과 이메일 일치 여부 검증
            if (memberRepository.existsByMEM_NAME(memberRequestDTO.getMEM_NAME())
                    && !memberRepository.existsByMEM_EMAIL(memberRequestDTO.getMEM_EMAIL())) {
                return "이메일이 일치하지 않습니다.";
            }
            // 이름과 아이디 일치 여부 검증
            else if (memberRepository.existsByMEM_NAME(memberRequestDTO.getMEM_NAME())
                    && !memberRepository.existsByMEM_IDANDNAME(memberRequestDTO.getMEM_ID())) {
                return "아이디가 일치하지 않습니다.";
            }
            // 이메일과 전화번호 일치 여부 검증
            else if (memberRepository.existsByMEM_EMAIL(memberRequestDTO.getMEM_EMAIL())
                    && !memberRepository.existsByMEM_PHONE(memberRequestDTO.getMEM_PHONE())) {
                return "전화번호가 일치하지 않습니다.";
            }
            // 이메일과 아이디 일치 여부 검증
            else if (memberRepository.existsByMEM_EMAIL(memberRequestDTO.getMEM_EMAIL())
                    && !memberRepository.existsByMEM_IDANDEMAIL(memberRequestDTO.getMEM_ID())) {
                return "아이디가 일치하지 않습니다.";
            }
            else {
                return "해당하는 사용자 정보를 찾을 수 없습니다.";
            }
        }
        return "회원님의 비밀번호는 " + memberPW + " 입니다.";
    }

}


















