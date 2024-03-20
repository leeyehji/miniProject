<%--
  Created by IntelliJ IDEA.
  User: choiinhwan
  Date: 2024/03/19
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/findId.css">
    <link rel="stylesheet" href="../css/memberJoin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="regist_wrap" class="wrap">
    <div>
        <h1>아이디 찾기</h1>
        <form action="" method="post" name="regiform" id="regist_form" class="form" onsubmit="return sendit()">
            <p><input type="text" name="username" id="username" placeholder="이름 입력"></p>
            <p><input type="text" name="userphone" id="userphone" placeholder="전화번호 입력해주세요"></p>
            <p><input type="text" name="useremail" id="useremail" placeholder="E-mail"></p>

            <p><input type="submit" value="아이디찾기" class="signup_btn"></p>
            <p class="pre_btn"><a href="">Login.</a></p>


        </form>
    </div>
</div>

<!-- JavaScript 코드 추가 -->
<script>
    const sendit = () => {
        // Input들을 각각 변수에 대입
        const username = document.regiform.username;
        const userphone = document.regiform.userphone;
        const useremail = document.regiform.useremail;

        // username값이 비어있으면 실행.
        if (username.value.trim() === '') {
            alert('이름을 입력해주세요.');
            username.focus();
            return false;
        }
        // 한글 이름 형식 정규식
        const expNameText = /^[가-힣]+$/;
        // username값이 정규식에 부합한지 체크
        if (!expNameText.test(username.value.trim())) {
            alert("이름 형식이 맞지않습니다. 형식에 맞게 입력해주세요.");
            username.focus();
            return false;
        }
        // userphone값이 비어있으면 실행.
        if (userphone.value.trim() === '') {
            alert('핸드폰 번호를 입력해주세요.');
            userphone.focus();
            return false;
        }
        // 핸드폰 번호 형식 정규식
        const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
        if (!expHpText.test(userphone.value.trim())) {
            alert('핸드폰 번호 형식이 맞지않습니다. 형식에 맞게 입력해주세요.');
            userphone.focus();
            return false;
        }
        // useremail값이 비어있으면 실행.
        if (useremail.value.trim() === '') {
            alert('이메일을 입력해주세요.');
            useremail.focus();
            return false;
        }
        // 이메일 형식 정규식
        const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
        if (!expEmailText.test(useremail.value.trim())) {
            alert('이메일 형식이 맞지않습니다. 형식에 맞게 입력해주세요.');
            useremail.focus();
            return false;
        }

        // 모든 조건을 통과하면 true를 반환하여 폼 제출을 허용
        return true;
    }
</script>



</body>
</html>