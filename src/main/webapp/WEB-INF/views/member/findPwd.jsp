<%--
  Created by IntelliJ IDEA.
  User: choiinhwan
  Date: 2024/03/19
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/member/css/findPwd.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/member/js/lostPwd.js"></script>
    <script src="/member/js/sendPwdEmail.js"></script>
</head>
<body>
<div id="regist_wrap" class="wrap">
    <div>
        <h1>비밀번호 찾기</h1>
        <form  method="post" name="regiform" id="regist_form" class="form">
            <p><input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름 입력"></p>
            <p><input type="text" name="MEM_ID" id="MEM_ID" placeholder="아이디 입력"></p>
            <p><input type="text" name="MEM_PHONE" id="MEM_PHONE" placeholder="전화번호 입력해주세요"></p>
            <p><input type="text" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="E-mail"></p>
            <p><input type="button" name="MEM_EMAIL" value="인증번호 전송" id="MEM_EMAIL" onclick="sendPwdEmail()" ></p>

            <p><input type="text" name="verification" id="verification" placeholder="인증번호 입력해주세요"></p>
            <p><input type="button" id="verificationBtn" value="인증확인하기" onclick="lostPwd()"></p>

            <p class="pre_btn">
                <a href="/member/loginForm">Login</a>  /
                <a href="/">Home</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>
