package com.nadeuli.member.service;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.nadeuli.member.dto.MemberRequestDTO;
import com.nadeuli.member.repository.MemberRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import spring.conf.NaverConfig;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service
public class NaverLoginServiceImpl implements NaverLoginService {

    @Autowired
    private MemberRepository memberRepository;
//    private
    private final NaverConfig naverConfig;



    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

    private final static String SESSION_STATE = "oauth_state";

    public NaverLoginServiceImpl(NaverConfig naverConfig) {
        this.naverConfig = naverConfig;
    }

    // 상태 토큰으로 사용할 랜덤 문자열 생성
    private String generateRandomString() {
        return java.util.UUID.randomUUID().toString();
    }

    // http session에 데이터 저장
    private void setSession(HttpSession session, String state){
        session.setAttribute(SESSION_STATE, state);
    }

    // http session에서 데이터 가져오기
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }

    @Override
    public String getAuthorizationUrl(HttpSession session) {
        String state = generateRandomString();
        setSession(session, state);

        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(naverConfig.getClientId())
                .apiSecret(naverConfig.getClientSecret())
                .callback(naverConfig.getRedirectURI())
                .state(state)
                .build(NaverLoginApi.instance());
        return oauthService.getAuthorizationUrl();
    }

    @Override
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        if (state.equals(getSession(session))) {
            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(naverConfig.getClientId())
                    .apiSecret(naverConfig.getClientSecret())
                    .callback(naverConfig.getRedirectURI())
                    .state(state)
                    .build(NaverLoginApi.instance());
            return oauthService.getAccessToken(code);
        }
        System.out.println("return null");
        return null;
    }

    @Override
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(naverConfig.getClientId())
                .apiSecret(naverConfig.getClientSecret())
                .callback(naverConfig.getRedirectURI())
                .build(NaverLoginApi.instance());
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }

    @Override
    public MemberRequestDTO processOAuthUser(MemberRequestDTO memberDTO) {




        MemberRequestDTO existingMember = memberRepository.findByEmailAndMemId(memberDTO.getMEM_ID(), memberDTO.getMEM_EMAIL());

        if (existingMember != null) {
            return existingMember;
        } else {
            // 새로운 회원으로 등록하는 로직
            memberRepository.save(memberDTO); // 회원 정보 저장
            // 저장된 Member 엔티티를 다시 MemberRequestDTO로 변환하여 반환
            return memberDTO;
        }
    }


}









