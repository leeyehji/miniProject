<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
    <link rel="stylesheet" type="text/css" href="/map/css/map.css">
</head>
<body>
<header>
    <jsp:include page="../frame/header.jsp"/>
</header>

<div id="frameContent">
    <div id="frameNav">
        <jsp:include page="../frame/nav.jsp"/>
    </div>
    <div id="main_map">
        <div class="leftmain">
            <div class="clickedsubjectsub">
                <h3>지역</h3>
            </div>

            <div class="clickedsubject">
                <h3 id="clickedsubject">
                    <p>해시태그를</p>
                    <p>클릭해보세요!</p>
                </h3>
            </div>
            <!-- 호버된 도/시 or 시/군/구 -->

            <div class="clickedcontentsub">
                <h3>지역 설명</h3>
            </div>

            <div class="clickedcontent">
                <h3 id="clickedcontent">
                    <p>지역에 대한</p>
                    <p>설명이</p>
                    <p>나옵니다</p>
                </h3>
            </div>
            <!-- 호버된 주제에 대한 설명 -->
        </div>
        <!-- leftmain -->

        <div class="middlemain">
            <div class="clickthemap">
                <h1>지도를 클릭해보세요!</h1>
            </div>
            <!-- 지도를 클릭해보세요! 문구 -->

            <div class="mapmain">
                <iframe
                        id="mapframe"
                        src="./korea"
                        style="border: 0; width: 100%; height: 100%"
                >
                </iframe>
            </div>
            <!-- 지도 사진 -->
        </div>
        <!-- middlemain -->

        <div class="rightmain">
            <div class = "mapInfoBtn">
                <button id="mapInfoBtn">지도 사용법</button>
            </div>
            <div class="reset1">
                <button id="resetBtn1">시/도 선택</button>
            </div>
            <div class="locationsub">
                <h3>지역</h3>
            </div>
            <div class="location">
                <button id="11" class="seoul">#서울</button>
                <button id="41" class="gyeonggi">#경기</button>
                <button id="28" class="incheon">#인천</button>
                <button id="51" class="gangwon">#강원</button>
                <button id="43" class="chungbuk">#충북</button>
                <button id="44" class="chungnam">#충남</button>
                <button id="36" class="sejong">#세종</button>
                <button id="30" class="daejeon">#대전</button>
                <button id="26" class="busan">#부산</button>
                <button id="29" class="gwangju">#광주</button>
                <button id="47" class="gyeongbuk">#경북</button>
                <button id="48" class="gyeongnam">#경남</button>
                <button id="52" class="jeonbuk">#전북</button>
                <button id="46" class="jeonnam">#전남</button>
                <button id="27" class="daegu">#대구</button>
                <button id="31" class="ulsan">#울산</button>
                <button id="50" class="jeju">#제주</button>
            </div>
            <!-- 지역 -->

            <div class="reset2">
                <button id="resetBtn2">시/군/구 선택</button>
            </div>
            <div class="themesub">
                <h3>테마</h3>
            </div>
            <div class="theme">
                <button id="12">#관광</button>
                <button id="14">#문화</button>
                <button id="15">#행사</button>
                <button id="32">#숙박</button>
                <button id="38">#쇼핑</button>
                <button id="39">#음식</button>
                <button id="28">#레포츠</button>
            </div>
            <!-- 테마 -->
        </div>
        <!-- rightmain -->

        <div class="mapinfo">
            <h2 class="info1">1. 시/도를 선택해주세요</h2>
            <h2 class="info2">2. 시/군/구를 선택해주세요</h2>
            <h2 class="info3">3. 테마를 선택해주세요</h2>
            <h2 class="info4">4. 생성된 마커를 통해 <br>상세정보를 확인할 수 있습니다</h2>
<%--            <img src="../img/mapinfo.png" alt="지도 사용법">--%>
        </div>
        <!-- mapinfo -->
    </div>
</div>
<div id="upDownBtn">
    <a href="#">
        <button id="upBtn">위로</button>
    </a>
    <a href="#bottom">
        <button id="downBtn">아래</button>
    </a>
</div>
<footer>
    <jsp:include page="../frame/footer.jsp"></jsp:include>
</footer>
<div id="bottom"></div>

</body>
<script src="/frame/js/frame.js"></script>
<%--<script src="../js/mypage.js"></script>--%>
<script src="/map/js/map.js"></script>
</html>
