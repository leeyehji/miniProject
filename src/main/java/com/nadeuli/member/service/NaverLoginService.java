package com.nadeuli.member.service;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.nadeuli.member.dto.MemberRequestDTO;

import javax.servlet.http.HttpSession;
import java.io.IOException;

public interface NaverLoginService {
    String getAuthorizationUrl(HttpSession session);
    OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException;
    String getUserProfile(OAuth2AccessToken oauthToken) throws IOException;
    MemberRequestDTO processOAuthUser(MemberRequestDTO memberDTO);
}
