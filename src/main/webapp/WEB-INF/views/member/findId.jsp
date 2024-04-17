<%--
  Created by IntelliJ IDEA.
  User: choiinhwan
  Date: 2024/03/19
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/member/css/findId.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="findId.jsp"></script>
    <script defer src="/member/js/lostId.js"></script>
</head>
<body>
<div id="regist_wrap" class="wrap">
    <div>
        <h1>아이디 찾기</h1>
        <form  method="post" name="regiform" id="regist_form" class="form">
            <p><input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름 입력"></p>
            <p><input type="text" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="E-mail"></p>

            <p><input type="button" value="아이디찾기" id="lostId" class="signup_btn"  ></p>
            <span id="result"></span>
        </form>
        <p class="pre_btn" id="befor">
            <a href="/member/loginForm">Login</a>/
            <a href="/">Home</a>

        </p>
    </div>
</div>
</body>
</html>
