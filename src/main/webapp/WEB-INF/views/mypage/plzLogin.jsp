<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 해 주세요!!</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
<!-- <link rel="stylesheet" type="text/css" href="/mypage/css/plzLogin.css">-->    
    
</head>
<body> <header><jsp:include page="../frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        <div id="content">
			<div class="notLogin">
					해당 페이지혹은 기능은 로그인한 유저만 이용할 수 있습니다. 로그인 후 이용해주시길 바랍니다.
			</div>
        </div>
    </div>
    <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    <footer><jsp:include page= "../frame/footer.jsp"></jsp:include></footer>
	
</body>
<!-- js -->
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="/frame/js/frame.js"></script>
</html>