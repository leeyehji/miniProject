
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script defer  src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script defer src="/member/js/login.js"></script>
	<link rel="stylesheet" href="/member/css/login.css">
</head>

<body>
<section class="login-form">
	<h1></h1>
	<form id="loginForm" method="post">
		<div class="int-area">
			<!-- 아이디 입력란 -->
			<input type="text" name="MEM_ID" id="MEM_ID" autocomplete="off" required>
			<label for="MEM_ID">아이디</label>
		</div>
		<div class="int-area">
			<!-- 비밀번호 입력란 -->
			<input type="password" name="MEM_PW" id="MEM_PW" autocomplete="off" required>
			<label for="MEM_PW">비밀번호</label>
		</div>
		<div class="btn-area">

			<button type="button" id="loginBtn" onclick="login()" >로그인</button>
		</div>
	</form>

	<div class="caption">
		<a href="/member/findPassword">비밀번호 찾기</a>/
		<a href="/member/findId">아이디 찾기</a>/
		<a href="/member/memberJoinForm">회원가입</a>
	</div>
</section>
<div class="api-login">
	<a href="" onclick="naverLogin();"><img src="/member/img/naver.png" alt=""></a>
	<a href=""><img src="/member/img/kakao.png" alt=""></a>
	<a href="" ><img src="/member/img/google.png" alt=""></a>
</div>
<script>

	function naverLogin(){
		 $.get({
			 url: '/member/naverLogin',
			 success: function (data){
				 console.log(data)
				 location.href=data;
			 }
		 })
	}
</script>
</body>
</html>
