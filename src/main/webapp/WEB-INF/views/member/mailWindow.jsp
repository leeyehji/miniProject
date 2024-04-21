
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/member/css/mailWindow.css">

    <script defer  src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script defer src="/member/js/mailWindow.js"></script>


</head>
<body>

<div class="commend">
    <div class="title"><h1> 나들이 인증번호 </h1></div>

    <h2 class="text-result"> 인증번호를 입력해  주세요 </h2>


    <div class="input-result">
        <input type="hidden" id="MEM_EMAIL" value="${MEM_EMAIL}" class="block"><br>
        <input type="text" placeholder="인증번호 입력" name="verification" id="verification" class="block" ><br>
        <input type="button" class="recall block" onclick="mailWindow()" value="인증 확인하기 " ><br>
    </div>



</div>

</body>
</html>
