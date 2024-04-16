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

        <div id="wrap">

            <div id="container">
                <div id="servicecontent">

                    <div id="inquiryContent">
                        <h2>1 : 1 문의</h2>
                        <form id="inquiryForm">
                            <div class="form-group">
                                <label for="userName">이름</label>
                                <input type="text" id="userName" name="userName" required>
                            </div>
                            <div class="form-group">
                                <label for="userEmail">이메일</label>
                                <input type="email" id="userEmail" name="userEmail" required>
                            </div>
                            <div class="form-group">
                                <label for="userInquiry">문의 내용</label>
                                <textarea id="userInquiry" name="userInquiry" rows="4" required></textarea>
                            </div>

                            <button type="submit" id="inquiryBtn">문의하기</button>
                        </form>
                    </div><!-- inquiryContent -->

                </div><!-- content -->

            </div><!--container-->

        </div> <!-- wrap -->


    </div>

</div>

<div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn">위로</button>
    <button onclick="bottomFunction()" id="downBtn">아래</button>
</div>

<footer>
    <jsp:include page="../frame/footer.jsp"></jsp:include>
</footer>
<script src="../../../resources/serviceCenter/js/inquiry.js"></script>
<script src="../../../resources/frame/js/frame.js"></script>
<div id="bottom"></div>

</body>
</html>