<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"
          prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="data:,"/>
    <meta charset="UTF-8"/>
    <meta
            name="serviceCenter"
            content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>

    <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script defer src="../../../resources/serviceCenter/js/faq.js"></script>
    <script defer src="../../../resources/frame/js/frame.js"></script>
    <link
            rel="stylesheet"
            href="../../../resources/serviceCenter/css/serviceCenter.css"/>
    <link
            rel="stylesheet"
            type="text/css"
            href="../../../resources/frame/css/frame.css"/>
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
        <div id="wrap">
            <div id="container">
                <div id="faqContent">
                    <h2>자주 묻는 질문</h2>
                    <br/><br/>
                    <div class="faqs">

                        <c:forEach var="faq" items="${faqs}">
                            <div>
                                <div
                                        style="
                      display: flex;
                      justify-content: space-between;
                      align-items: center;
                    ">
                                    <button class="toggleBtn">${faq.faq_Subject}</button
                                    >
                                    <button class="editBtn" style="position: relative;margin-left: 10px;right: 110px;
                      ">
                                        편집
                                    </button>
                                    <button class="deleteBtn" style="margin-left: 10px; border-radius: 10px; position: relative; right: 220px;
                      ">
                                        삭제
                                    </button>
                                </div>
                                <div class="ntccontent" style="display: none">
                                        ${faq.faq_Content}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <button id="createBtn" onclick="showPopup();">작성</button>
                    <!-- 추가적인 질문과 답변 항목을 이곳에 삽입할 수 있습니다. -->
                </div>
                <!-- faqContent -->
            </div>
            <!--container-->
        </div>
        <!-- wrap -->
    </div>
</div>

<div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn">위로</button>
    <button onclick="bottomFunction()" id="downBtn">아래</button>
</div>

<footer>
    <jsp:include page="../frame/footer.jsp"></jsp:include>
</footer>

<div id="bottom"></div>
</body>
</html>