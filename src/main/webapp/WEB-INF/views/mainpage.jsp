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

	<!-- 차트를 가져옵니다. -->
	<!-- Step 1) Load D3.js -->
    <script src="https://d3js.org/d3.v6.min.js"></script>
    <!-- Step 2) Load billboard.js with style -->
    <link rel="stylesheet" href="/mypage/css/billboard.css">
    <script src="/mypage/js/billboard.js"></script>
    <script src="/mainpage/js/chart.js"></script>
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
            <a href="http://223.130.130.226:8090/thema/themaDetailPage?contentNo=129&typeId=12">
                <img src="../../resources/mainpage/image/경복궁.jpeg" alt="경복궁" >
            </a>
            <div class="text">경복궁</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <a href="http://223.130.130.226:8090/thema/themaDetailPage?contentNo=3507&typeId=14">
                <img src="../../resources/mainpage/image/코엑스.jpeg" alt="코엑스" >
            </a>
            <div class="text">코엑스</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <a href="http://223.130.130.226:8090/thema/themaDetailPage?contentNo=1628&typeId=28">
                <img src="../../resources/mainpage/image/서울숲클라이밍.jpeg" alt="서울숲클라이밍" >
            </a>
            <div class="text">서울숲클라이밍</div>
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
    <%--    <div id="maincln">--%>
    <%--        <h2 id="cln">캘린더</h2>--%>
    <%--        <div id="datepicker"></div>--%>
    <%--        <!-- <input type="text" id="datepicker" /> -->--%>
    <%--        <div id="cldout"></div>--%>
    <%--    </div>--%>
    </tbody>

    <tfoot>
    <section class="hot">
        <h2>추천 여행지</h2>
        <!-- 미리 .destination-card div를 생성합니다. -->
        <div class="destination-grid">
            <div class="destination-card">
                <a>
                    <p></p>
                    <img src="" alt="" class="thumb"/>
                    <h3></h3>
                </a>
            </div>
            <div class="destination-card">
                <a>
                    <p></p>
                    <img src="" alt="" class="thumb"/>
                    <h3></h3>
                </a>
            </div>
            <div class="destination-card">
                <a>
                    <p></p>
                    <img src="" alt="" class="thumb"/>
                    <h3></h3>
                </a>
            </div>
            <div class="destination-card">
                <a>
                    <p></p>
                    <img src="" alt="" class="thumb"/>
                    <h3></h3>
                </a>
            </div>
            <div class="destination-card">
                <a>
                    <p></p>
                    <img src="" alt="" class="thumb"/>
                    <h3></h3>
                </a>
            </div>
        </div>
    </section>
    
    <section class="chart">
    	<div id="chart1">차트1</div>
    	<div id="chart2">차트2</div>
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