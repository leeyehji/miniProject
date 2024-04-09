<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
<link rel="stylesheet" type="text/css" href="/mypage/css/mypage.css">
    
</head>
<body>
 <header><jsp:include page="../frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        <div id="content">
            <jsp:include page="./mypageFrame.jsp"></jsp:include>
        </div>
    </div>
   <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    <footer><jsp:include page= "../frame/footer.jsp"></jsp:include></footer>
<div id="bottom"></div>
</body>

<!-- js -->
<script src="/frame/js/frame.js"></script>
<script src="/mypage/js/mypage.js"></script>
</html>