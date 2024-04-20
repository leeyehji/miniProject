<%@ page import="com.nadeuli.serviceCenter.bean.NoticeDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="data:,">
    <meta charset="UTF-8">
    <meta name="noticeDetail" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/serviceCenter/css/noticeDetail.css"/>
    <link rel="stylesheet" type="text/css" href="../../../resources/frame/css/frame.css">
</head>

<body>


<header>
    <jsp:include page="../frame/header.jsp"></jsp:include>
</header>

<div id="frameContent">

    <div id="frameNav">
        <jsp:include page="../frame/nav.jsp"></jsp:include>
    </div>

    <div id="content" style="padding: 0px">

        <div class="notice-detail-container">
<%--            <c:set var="notice" value="${notice}"/>--%>
            <h1><c:out value="${notice.n_Subject}"/></h1>
            <p><c:out value="${notice.n_Writer}"/></p>
            <p><c:out value="${notice.n_Content}"/></p>
            <img src="https://kr.object.ncloudstorage.com/miniproject/storage/notice/${notice.n_Photo_Path}" alt="공지사항 이미지">
            <a href="/serviceCenter/ServiceCenter">목록으로 돌아가기</a>
        </div>

        <div style="margin: 20px 0px;">
            <button id="deleteNotice" onclick="deleteNotice()">삭제</button>
            <button id="editNotice" onclick="editNotice()">수정</button>
        </div>

    </div>

</div>

<div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn">위로</button>
    <button onclick="bottomFunction()" id="downBtn">아래</button>
</div>

<!-- 수정 모달 -->
<div id="editModal" class="modal">
    <!-- 모달 내용 -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>공지사항 수정</h2>
        <!-- 수정 내용 폼 -->
        <form id="editForm">
            <label for="editTitle">제목:</label>
            <input type="text" id="editTitle" name="title"><br><br>
            <label for="editDate">날짜:</label>
            <input type="text" id="editDate" name="date"><br><br>
            <label for="editContent" id="editLabel">내용:</label>
            <textarea id="editContent" name="content"></textarea><br><br>
            <input type="submit" value="수정하기">
        </form>
    </div>
</div>

<footer>
    <jsp:include page="../frame/footer.jsp"></jsp:include>
</footer>
<script src="../../../resources/serviceCenter/js/noticeDetail.js"></script>
<script src="../../../resources/frame/js/frame.js"></script>
<script>

</script>
<div id="bottom"></div>

</body>
</html>