<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 후기 게시판</title>

    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
    <link rel="stylesheet" type="text/css" href="/thema/css/themaSearch.css">


    <style>
        #observer {
            text-align: left;
            margin-top: 50px;
        }
        /*이전 이후 button*/
    </style>
</head>

<body>


<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

<div id="frameContent">
    <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
    <div id="content">

        <div id="themaBoardContent">
            <div id="searchTop">" <span>${keyword}</span> " &emsp;검색 결과</div>



        </div>
        <div id="observer">

        </div>

    </div>
</div>
<div id="upDownBtn">
    <a href="#"><button id="upBtn">위로</button></a> <a href="#bottom"><button
        id="downBtn">아래</button></a>
</div>
<footer><jsp:include page="../frame/footer.jsp"></jsp:include></footer>

<div id="bottom"></div>

<script src="/frame/js/frame.js"></script>
<script src="/thema/js/themaSearch.js"></script>



</body>

</html>