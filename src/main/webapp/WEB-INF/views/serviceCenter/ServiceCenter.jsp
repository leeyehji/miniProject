<%@ page import="com.nadeuli.serviceCenter.bean.NoticeDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="data:,">
    <meta charset="UTF-8">
    <meta name="serviceCenter" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/serviceCenter/css/serviceCenter.css"/>
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

        <div>
            <table class="type1">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="noticeList" value="${notices}"/>
                <c:forEach var="notice" items="${noticeList}" varStatus="status">
                    <tr>
                        <td><c:out value="${notice.n_No}"></c:out></td>
                        <td><c:out value="${notice.n_Writer}"></c:out></td>
                        <td>
                            <a href="#" onClick="fn_contentView(<c:out value="${notice.n_No}"/>)">
                                <c:out value="${notice.n_Subject}"></c:out>
                            </a>
                        </td>
                        <td><fmt:formatDate value="${notice.n_CreateTime}" pattern="yyyy-MM-dd"/></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button id="writeNoticeBtn">작성하기</button>
        </div>
        <div class="paginate_wrap">
            <div class="paginate">
                <span>
                <a href="/serviceCenter/ServiceCenter?page=1&size=10">1</a>
                <a href="/serviceCenter/ServiceCenter?page=2&size=10">2</a>
                <a href="/serviceCenter/ServiceCenter?page=3&size=10">3</a>
                <a href="/serviceCenter/ServiceCenter?page=4&size=10">4</a>
                <a href="/serviceCenter/ServiceCenter?page=5&size=10">5</a>
                <a href="/serviceCenter/ServiceCenter?page=6&size=10">6</a>
                <a href="/serviceCenter/ServiceCenter?page=7&size=10">7</a>
                <a href="/serviceCenter/ServiceCenter?page=8&size=10">8</a>
                <a href="/serviceCenter/ServiceCenter?page=9&size=10">9</a>
                <a href="/serviceCenter/ServiceCenter?page=10&size=10">10</a>
                </span>
            </div>
        </div>

        <div id="writeModal">
            <h2>공지사항 작성</h2>
            <form action="notices" method="post" enctype="multipart/form-data">
                <label for="subject">제목:</label>
                <input type="text" id="subject" name="subject" style="width: 700px;font-size: 18px;"><br><br>
                <label for="content" id="contentLabel">내용:</label>
                <textarea id="content" name="content"
                          style="min-width: 1350px; width: 1350px; height: 400px; font-size: 18px; padding: 10px 10px;"></textarea>
                <br><br>
                <!-- 이미지 추가 필드 -->
                <label for="imageUpload">이미지 추가:</label>
                <input type="file" id="imageUpload" name="file" accept="image/*"><br><br>
                <!-- 이미지 미리보기 -->
                <div id="imagePreview" style="margin-bottom: 20px;"></div>
                <button id="submitBtn" type="submit">작성 완료</button>
                <button id="closeBtn">닫기</button>
            </form>
        </div>

    </div> <!-- content -->


</div>
<%--frameContent--%>

<div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn">위로</button>
    <button onclick="bottomFunction()" id="downBtn">아래</button>
</div>

<footer>
    <jsp:include page="../frame/footer.jsp"></jsp:include>
</footer>
<script src="../../../resources/serviceCenter/js/serviceCenter.js"></script>
<script src="../../../resources/frame/js/frame.js"></script>
<script>
    function fn_contentView(n_No){
        var url = "${pageContext.request.contextPath}/serviceCenter/NoticeDetail";
        url = url + "/"+n_No;
        location.href = url;
    }
</script>

<div id="bottom"></div>

</body>
</html>