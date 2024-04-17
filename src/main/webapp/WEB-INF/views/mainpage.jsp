<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="data:,">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>miniproject</title>

    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script defer src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- 캘린더 -->
    <script defer src="../../resources/mainpage/js/miniP.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/><!-- 캘린더 -->
    <link rel="stylesheet" href="../../resources/mainpage/css/miniP.css"/>
    <link rel="stylesheet" type="text/css" href="./frame/css/frame.css">

</head>

<body>
<header>
    <jsp:include page="./frame/header.jsp"></jsp:include>
</header>

<table id="main">
    <thead>

    <div class="slideshow-container">

        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="../../resources/mainpage/css/image/slide1.jpeg">
            <div class="text">내용입력</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="../../resources/mainpage/css/image/slide2.jpeg">
            <div class="text">내용입력</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="../../resources/mainpage/css/image/slide3.jpeg">
            <div class="text">내용입력</div>
        </div>

        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
        <ul class="slides flex">
            <span class="move-left"></span>
            <span class="move-right"></span>


            <!-- The dots/circles -->
            <div class="dotBtn">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
        </ul>
    </div>

    </thead>


    <tbody>
    <div id="maincln">
        <h2 id="cln">캘린더</h2>
        <div id="datepicker"></div>
        <!-- <input type="text" id="datepicker" /> -->
        <div id="cldout"></div>
    </div>
    </tbody>

    <tfoot>
    <section class="hot">
        <h2>추천 여행지</h2>
        <!-- 미리 .destination-card div를 생성합니다. -->
        <div class="destination-grid">
            <div class="destination-card">
                <a>
                    <img src="" alt="" class="thumb" style="width: 120px; height: 80px;"/>
                </a>
                <h3></h3>
                <p></p>
            </div>
            <div class="destination-card">
                <a>
                    <img src="" alt="" class="thumb" style="width: 120px; height: 80px;"/>
                </a>
                <h3></h3>
                <p></p>
            </div>
            <div class="destination-card">
                <a>
                    <img src="" alt="" class="thumb" style="width: 120px; height: 80px;"/>
                </a>
                <h3></h3>
                <p></p>
            </div>
            <div class="destination-card">
                <a>
                    <img src="" alt="" class="thumb" style="width: 120px; height: 80px;"/>
                </a>
                <h3></h3>
                <p></p>
            </div>
            <div class="destination-card">
                <a>
                    <img src="" alt="" class="thumb" style="width: 120px; height: 80px;"/>
                </a>
                <h3></h3>
                <p></p>
            </div>
        </div>
    </section>
    </tfoot>


</table>
<div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn" title="Go to top">위로</button>
    <button onclick="bottomFunction()" id="downBtn" title="Go to bottom">아래</button>

</div>
<footer>
    <jsp:include page="./frame/footer.jsp"></jsp:include>
</footer>
</body>

<!-- <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script> -->
<script src="../../resources/frame/js/frame.js"></script>

</html>