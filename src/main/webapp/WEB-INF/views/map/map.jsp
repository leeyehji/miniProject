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
    <link rel="stylesheet" type="text/css" href="../../../resources/frame/css/frame.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/map/css/map.css">
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
                        src="./korea.jsp"
                        style="border: 0; width: 100%; height: 100%"
                >
                </iframe>
            </div>
            <!-- 지도 사진 -->
        </div>
        <!-- middlemain -->

        <div class="rightmain">
            <div class="reset">
                <button id="resetBtn">초기화</button>
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
<script src="../../../resources/frame/js/frame.js"></script>
<%--<script src="../js/mypage.js"></script>--%>
<script>
    window.addEventListener("message", function(event) {
        // 메시지 수신 및 검증
        // if (event.origin !== "http://예상되는출처") { // 보안을 위해 출처 검증
        //     return; // 출처가 예상과 다르면 처리하지 않음
        // }

        // 메시지에서 정보 추출
        var data = event.data;
        var clickedSubject = data.clickedSubject;
        var clickedContent = data.clickedContent;
        var clickedRegion = data.clickedRegion;

        // 정보를 웹 페이지에 표시
        document.getElementById("clickedsubject").innerHTML = clickedSubject;
        document.getElementById("clickedcontent").innerHTML = clickedContent;

        // 클릭된 지역의 버튼에 'active' 클래스 추가
        var buttons = document.querySelectorAll(".location button");
        for (var i = 0; i < buttons.length; i++) {
            if (buttons[i].classList.contains(data.clickedRegion)) {
                buttons[i].classList.add("active");
            } else {
                buttons[i].classList.remove("active");
            }
        }
    });
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
                document.querySelectorAll(".location button").forEach((button) => {
                    button.addEventListener("click", function () {
                        const regionData = regionsData.features.find(
                            (feature) => feature.properties.CTPRVN_CD === button.id
                        );

                        if (regionData) {
                            document.getElementById("clickedsubject").textContent =
                                regionData.properties.CTP_KOR_NM;
                            document.getElementById("clickedcontent").textContent =
                                regionData.properties.CTP_Description;

                            // 모든 버튼의 'active' 클래스를 제거
                            document.querySelectorAll(".location button").forEach((btn) =>
                                btn.classList.remove("active")
                            );

                            // 클릭한 버튼에만 'active' 클래스 추가
                            button.classList.add("active");

                            // 버튼의 id를 이용해 해당 지역의 .jsp 파일 경로를 생성하고 iframe의 src 속성 변경
                            let regionPage = './korea.jsp'; // 기본값
                            switch (regionData.properties.CTP_ENG_NM.toLowerCase()) {
                                case 'seoul':
                                    regionPage = './sido/seoul.jsp';
                                    fetch("./sido/seoul.json")
                                        .then(response => response.json())
                                        .then(seoulData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && seoulData.properties && seoulData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = seoulData.properties.SIG_KOR_NM;
                                                locationButton.id = seoulData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("서울 데이터 로드 실패:", error));
                                    break;
                                case 'gyeonggi':
                                    regionPage = './sido/gyeonggi.jsp';
                                    fetch("./sido/gyeonggi.json")
                                        .then(response => response.json())
                                        .then(gyeonggiData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && gyeonggiData.properties && gyeonggiData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = gyeonggiData.properties.SIG_KOR_NM;
                                                locationButton.id = gyeonggiData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("경기 데이터 로드 실패:", error));
                                    break;
                                case 'incheon':
                                    regionPage = './sido/incheon.jsp';
                                    fetch("./sido/incheon.json")
                                        .then(response => response.json())
                                        .then(incheonData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && incheonData.properties && incheonData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = incheonData.properties.SIG_KOR_NM;
                                                locationButton.id = incheonData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("인천 데이터 로드 실패:", error));
                                    break;
                                case 'gangwon':
                                    regionPage = './sido/gangwon.jsp';
                                    fetch("./sido/gangwon.json")
                                        .then(response => response.json())
                                        .then(gangwonData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && gangwonData.properties && gangwonData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = gangwonData.properties.SIG_KOR_NM;
                                                locationButton.id = gangwonData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("강원 데이터 로드 실패:", error));
                                    break;
                                case 'chungbuk':
                                    regionPage = './sido/chungbuk.jsp';
                                    fetch("./sido/chungbuk.json")
                                        .then(response => response.json())
                                        .then(chungbukData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && chungbukData.properties && chungbukData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = chungbukData.properties.SIG_KOR_NM;
                                                locationButton.id = chungbukData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("충북 데이터 로드 실패:", error));
                                    break;
                                case 'chungnam':
                                    regionPage = './sido/chungnam.jsp';
                                    fetch("./sido/chungnam.json")
                                        .then(response => response.json())
                                        .then(chungnamData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && chungnamData.properties && chungnamData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = chungnamData.properties.SIG_KOR_NM;
                                                locationButton.id = chungnamData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("충남 데이터 로드 실패:", error));
                                    break;
                                case 'sejong':
                                    regionPage = './sido/sejong.jsp';
                                    fetch("./sido/sejong.json")
                                        .then(response => response.json())
                                        .then(sejongData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && sejongData.properties && sejongData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = sejongData.properties.SIG_KOR_NM;
                                                locationButton.id = sejongData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("세종 데이터 로드 실패:", error));
                                    break;
                                case 'daejeon':
                                    regionPage = './sido/daejeon.jsp';
                                    fetch("./sido/daejeon.json")
                                        .then(response => response.json())
                                        .then(daejeonData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && daejeonData.properties && daejeonData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = daejeonData.properties.SIG_KOR_NM;
                                                locationButton.id = daejeonData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("대전 데이터 로드 실패:", error));
                                    break;
                                case 'busan':
                                    regionPage = './sido/busan.jsp';
                                    fetch("./sido/busan.json")
                                        .then(response => response.json())
                                        .then(busanData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && busanData.properties && busanData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = busanData.properties.SIG_KOR_NM;
                                                locationButton.id = busanData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("부산 데이터 로드 실패:", error));
                                    break;
                                case 'gwangju':
                                    regionPage = './sido/gwangju.jsp';
                                    fetch("./sido/gwangju.json")
                                        .then(response => response.json())
                                        .then(gwangjuData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && gwangjuData.properties && gwangjuData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = gwangjuData.properties.SIG_KOR_NM;
                                                locationButton.id = gwangjuData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("광주 데이터 로드 실패:", error));
                                    break;
                                case 'gyeongbuk':
                                    regionPage = './sido/gyeongbuk.jsp';
                                    fetch("./sido/gyeongbuk.json")
                                        .then(response => response.json())
                                        .then(gyeongbukData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && gyeongbukData.properties && gyeongbukData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = gyeongbukData.properties.SIG_KOR_NM;
                                                locationButton.id = gyeongbukData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("경북 데이터 로드 실패:", error));
                                    break;
                                case 'gyeongnam':
                                    regionPage = './sido/gyeongnam.jsp';
                                    fetch("./sido/gyeongnam.json")
                                        .then(response => response.json())
                                        .then(gyeongnamData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && gyeongnamData.properties && gyeongnamData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = gyeongnamData.properties.SIG_KOR_NM;
                                                locationButton.id = gyeongnamData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("경남 데이터 로드 실패:", error));
                                    break;
                                case 'jeonbuk':
                                    regionPage = './sido/jeonbuk.jsp';
                                    fetch("./sido/jeonbuk.json")
                                        .then(response => response.json())
                                        .then(jeonbukData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && jeonbukData.properties && jeonbukData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = jeonbukData.properties.SIG_KOR_NM;
                                                locationButton.id = jeonbukData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("전북 데이터 로드 실패:", error));
                                    break;
                                case 'jeonnam':
                                    regionPage = './sido/jeonnam.jsp';
                                    fetch("./sido/jeonnam.json")
                                        .then(response => response.json())
                                        .then(jeonnamData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && jeonnamData.properties && jeonnamData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = jeonnamData.properties.SIG_KOR_NM;
                                                locationButton.id = jeonnamData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("전남 데이터 로드 실패:", error));
                                    break;
                                case 'daegu':
                                    regionPage = './sido/daegu.jsp';
                                    fetch("./sido/daegu.json")
                                        .then(response => response.json())
                                        .then(daeguData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && daeguData.properties && daeguData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = daeguData.properties.SIG_KOR_NM;
                                                locationButton.id = daeguData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("대구 데이터 로드 실패:", error));
                                    break;
                                case 'ulsan':
                                    regionPage = './sido/ulsan.jsp';
                                    fetch("./sido/ulsan.json")
                                        .then(response => response.json())
                                        .then(ulsanData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && ulsanData.properties && ulsanData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = ulsanData.properties.SIG_KOR_NM;
                                                locationButton.id = ulsanData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("울산 데이터 로드 실패:", error));
                                    break;
                                case 'jeju':
                                    regionPage = './sido/jeju.jsp';
                                    fetch("./sido/jeju.json")
                                        .then(response => response.json())
                                        .then(jejuData => {
                                            const locationButton = document.querySelector(".rightmain .location button");
                                            if (locationButton && jejuData.properties && jejuData.properties.SIG_KOR_NM) { // 여기에서 데이터 검증 추가
                                                locationButton.textContent = jejuData.properties.SIG_KOR_NM;
                                                locationButton.id = jejuData.properties.SIG_KOR_NM;
                                            }
                                        })
                                        .catch(error => console.error("제주 데이터 로드 실패:", error));
                                    break;
                                // 다른 지역에 대한 case 추가
                                default:
                                    console.log('지역에 해당하는 페이지가 없습니다.');
                            }
                            document.getElementById("mapframe").src = regionPage;
                        }
                    });
                });
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
    document.getElementById("resetBtn").addEventListener("click", function () {
        // iframe의 src를 기본 지도 페이지로 변경
        document.getElementById("mapframe").src = "./korea.jsp";

        // 선택된 지역 버튼의 'active' 클래스 제거
        document.querySelectorAll(".location button").forEach((button) =>
            button.classList.remove("active")
        );

        // 지역과 지역 설명을 초기 상태로 되돌림
        document.getElementById("clickedsubject").textContent = "해시태그를 클릭해보세요!";
        document.getElementById("clickedcontent").textContent = "지역에 대한 설명이 나옵니다";
    });

</script>
</html>
