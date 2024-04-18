
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/member/css/memberJoin.css">

    <script defer  src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script defer src="/member/js/mailWindow.js"></script>


</head>
<body>
<P><h1> 회원정보 인증 </h1></P>
<table>
    <h1> 회원정보 인증 </h1>

    <p>인증번호는 </p>
    <input type="hidden" id="MEM_EMAIL" value="${MEM_EMAIL}">
    <p><input type="text" placeholder="인증번호 입력" name="verification" id="verification"></p>
    <p><input type="button" onclick="mailWindow()" style=""></p>


</table>





</body>
</html>
