<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/frame/css/frame.css">
<link rel="stylesheet" type="text/css" href="../../resources/thema/css/themaBoardList.css">
    
</head>
<body>
 <header><jsp:include page="../../views/frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../../views/frame/nav.jsp"></jsp:include></div>
        <div id="content">
            <jsp:include page="themaBoardListFrame.jsp"></jsp:include>
        </div>
    </div>
    <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    <footer><jsp:include page="../../views/frame/footer.jsp"></jsp:include></footer>
<div id="bottom"></div>
</body>

<script src="../../resources/frame/js/frame.js"></script>
<script src="../../resources/frame/js/header.js"></script>
<script src="../../resources/frame/js/footer.js"></script>
<script src="../../resources/thema/js/themaBoardListFrame.js"></script>
</html>