package com.nadeuli.member.service;


import com.nadeuli.member.dto.MemberRequestDTO;
import com.nadeuli.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class MemberServiceImpl implements MemberService {

    @Autowired
    private  MemberRepository memberRepository;


    /*로그인 구현 */
    @Override
    public boolean login(MemberRequestDTO memberRequestDTO) {
        // MemberRepository의 인스턴스 메소드를 호출하도록 수정
        System.out.println("MemberServiceImpl.login");
        MemberRequestDTO loginMember = memberRepository.login(memberRequestDTO);
        String mem_id = memberRequestDTO.getMEM_ID();
        String mem_pwd = memberRequestDTO.getMEM_PWD();
        System.out.println(mem_pwd);
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
    /*회원가입*/
    @Override
    public boolean memberJoin(MemberRequestDTO memberRequestDTO) {
        if(memberRequestDTO .getMEM_PWD()!= null){
            return true;
        }
        return false;
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

    @Override
    public String findmemberid(MemberRequestDTO memberRequestDTO) {



        return null;
    }


}













