
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
    <script defer src="/member/js/checkId.js"></script>
    <script defer src="/member/js/memberJoin.js"></script>
    <script defer src="/member/js/mailAuth.js"></script>

</head>
<body>
<div id="regist_wrap" class="wrap">
    <div>
        <h1>회원가입</h1>
        <!-- 변경된 부분: 회원가입 폼의 action 속성 -->
        <form  method="post" name="regiform" id="regist_form" class="form" onsubmit="return sendit()">
            <p><input type="text" name="MEM_ID" id="MEM_ID"  placeholder="아이디 입력" onblur="checkId()"></p>
            <span id="id-dup-result"></span>

            <p><input type="password" name="MEM_PWD" id="MEM_PWD" placeholder="비밀번호"></p>
            <p><input type="password" name="MEM_PWD_CH" id="MEM_PWD_CH" placeholder="비밀번호 확인"></p>

            <p><input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름 입력"></p>

            <p><input type="text" name="MEM_PHONE" id="MEM_PHONE" placeholder="전화번호 입력해주세요"></p>
            <p><input type="text" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="E-mail" > </p>

            <p><input type="button" value="이메일 확인" id="check" class="checkEmail" name="checkEmail" onclick="mailAuth()" > </p>



            <p class="MEM_GENDER">
                <label for="male">남자 <input type="radio" name="mem_gender[]" id="male" value="male"></label>
                <label for="female">여자 <input type="radio" name="mem_gender[]" id="female" value="female"></label>
            </p>
            <p><input type="button" value="회원가입" class="signup_btn" onclick="memberJoin()"></p>
            <p class="pre_btn">
                <a href="/member/loginForm">Login</a>
                <a href="/">Home</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>
