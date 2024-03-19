<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/frame.css">
    <link rel="stylesheet" type="text/css" href="../css/map.css">
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
                        src="./korea.jsp"
                        style="border: 0; width: 100%; height: 100%"
                >
                </iframe>
            </div>
            <!-- 지도 사진 -->
        </div>
        <!-- middlemain -->

        <div class="rightmain">
            <div class="locationsub">
                <h3>지역</h3>
            </div>
            <div class="location">
                <button id="11">#서울</button>
                <button id="41">#경기</button>
                <button id="28">#인천</button>
                <button id="51">#강원</button>
                <button id="43">#충북</button>
                <button id="44">#충남</button>
                <button id="36">#세종</button>
                <button id="30">#대전</button>
                <button id="26">#부산</button>
                <button id="29">#광주</button>
                <button id="47">#경북</button>
                <button id="48">#경남</button>
                <button id="52">#전북</button>
                <button id="46">#전남</button>
                <button id="27">#대구</button>
                <button id="31">#울산</button>
                <button id="50">#제주</button>
            </div>
            <!-- 지역 -->

            <div class="themesub">
                <h3>테마</h3>
            </div>
            <div class="theme">
                <button id="2">#관광</button>
                <button id="3">#문화</button>
                <button id="4">#행사</button>
                <button id="5">#숙박</button>
                <button id="6">#쇼핑</button>
                <button id="7">#음식</button>
            </div>
            <!-- 테마 -->
        </div>
        <!-- rightmain -->
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
<script src="../js/frame.js"></script>
<script src="../js/header.js"></script>
<script src="../js/footer.js"></script>
<script src="../js/mypage.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const jsonUrl = "./korea.json";

        fetch(jsonUrl)
            .then((response) => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("데이터를 불러오는데 실패했습니다.");
            })
            .then((regionsData) => {
                document
                    .querySelectorAll(".location button")
                    .forEach((button) => {
                        button.addEventListener("click", function () {
                            const regionData =
                                regionsData.features.find(
                                    (feature) =>
                                        feature.properties.CTPRVN_CD ===
                                        button.id
                                );
                            if (regionData) {
                                document.getElementById(
                                    "clickedsubject"
                                ).textContent =
                                    regionData.properties.CTP_KOR_NM;
                                document.getElementById(
                                    "clickedcontent"
                                ).textContent =
                                    regionData.properties.CTP_Description;

                                // 모든 버튼의 'active' 클래스를 제거
                                document
                                    .querySelectorAll(
                                        ".location button"
                                    )
                                    .forEach((btn) =>
                                        btn.classList.remove("active")
                                    );

                                // 클릭한 버튼에만 'active' 클래스 추가
                                button.classList.add("active");
                            }
                        });
                    });
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
</script>
</html>
