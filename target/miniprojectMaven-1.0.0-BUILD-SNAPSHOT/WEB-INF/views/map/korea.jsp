<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link
            rel="stylesheet"
            href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
    />
    <style>
        #mapid {
            height: 680px;
        }
    </style>
</head>
<script type="text/javascript">
    window.history.forward();
    function noBack(){window.history.forward();}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div id="mapid"></div>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    var map = L.map('mapid', {
        center: [36, 128.7],
        zoom: 7,
        zoomControl: false,
        dragging: false
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        maxZoom: 7,
        minZoom: 7,
    }).addTo(map);

    $(document).ready(function () {
        $.getJSON("./korea.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: getColorHover(feature.properties.CTP_KOR_NM), // 예시 색상
                                fillOpacity: 1,
                            });

                            if (
                                !L.Browser.ie &&
                                !L.Browser.opera &&
                                !L.Browser.edge
                            ) {
                                layer.bringToFront();
                            }
                            // 여기서 텍스트 레이블(툴팁) 추가
                            var tooltip = L.tooltip({
                                permanent: false,
                                direction: "center",
                                className: "my-labels",
                            })
                                .setContent(
                                    feature.properties.CTP_KOR_NM
                                )
                                .setLatLng(
                                    layer.getBounds().getCenter()
                                );

                            layer.bindTooltip(tooltip).openTooltip();
                        },
                        mouseout: function (e) {
                            geojson.resetStyle(e.target);
                            e.target.closeTooltip();
                        },
                        click: function (e) {
                            // 클릭 이벤트 추가
                            switch(feature.properties.CTP_KOR_NM){
                                case "서울":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/seoul.jsp"; // 서울을 클릭하면 seoul.jsp로 이동
                                    break;
                                case "경기":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/gyeonggi.jsp"; // 경기를 클릭하면 gyeonggi.jsp로 이동
                                    break;
                                case "인천":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/incheon.jsp"; // 인천을 클릭하면 incheon.jsp로 이동
                                    break;
                                case "강원":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/gangwon.jsp"; // 강원을 클릭하면 gangwon.jsp로 이동
                                    break;
                                case "충북":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/chungbuk.jsp"; // 충북을 클릭하면 chungbuk.jsp로 이동
                                    break;
                                case "충남":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/chungnam.jsp"; // 충남을 클릭하면 chungnam.jsp로 이동
                                    break;
                                case "대전":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/daejeon.jsp"; // 대전을 클릭하면 daejeon.jsp로 이동
                                    break;
                                case "세종":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/sejong.jsp"; // 세종을 클릭하면 sejong.jsp로 이동
                                    break;
                                case "경북":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/gyeongbuk.jsp"; // 경북을 클릭하면 gyeongbuk.jsp로 이동
                                    break;
                                case "경남":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/gyeongnam.jsp"; // 경남을 클릭하면 gyeongnam.jsp로 이동
                                    break;
                                case "대구":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/daegu.jsp"; // 대구를 클릭하면 daegu.jsp로 이동
                                    break;
                                case "울산":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/ulsan.jsp"; // 울산을 클릭하면 ulsan.jsp로 이동
                                    break;
                                case "부산":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/busan.jsp"; // 부산을 클릭하면 busan.jsp로 이동
                                    break;
                                case "전북":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/jeonbuk.jsp"; // 전북을 클릭하면 jeonbuk.jsp로 이동
                                    break;
                                case "전남":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/jeonnam.jsp"; // 전남을 클릭하면 jeonnam.jsp로 이동
                                    break;
                                case "광주":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/gwangju.jsp"; // 광주를 클릭하면 gwangju.jsp로 이동
                                    break;
                                case "제주":
                                    parent.postMessage({
                                        clickedSubject: feature.properties.CTP_KOR_NM,
                                        clickedContent: feature.properties.CTP_Description,
                                        clickedRegion: feature.properties.CTP_ENG_NM,
                                    }, "*");
                                    window.location.href = "./sido/jeju.jsp"; // 제주를 클릭하면 jeju.jsp로 이동
                                    break;
                                default:
                                    break;
                            }
                        },
                    });
                },

                // 초기 스타일 설정
                style: function (feature) {
                    return {
                        fillColor: getColor(feature.properties.CTP_KOR_NM), // 기본 색상
                        weight: 1,
                        opacity: 1,
                        color: "white", // 경계선 색상
                        fillOpacity: 1,
                    };
                },
            }).addTo(map);
        });//getJson
        function getColor(regionName) {
            switch (regionName) {
                case '서울': return '#c0392b'; // 강렬한 빨강
                case '경기': return '#3498db'; // 밝은 파랑
                case '인천': return '#f1c40f'; // 노랑
                case '강원': return '#2ecc71'; // 에메랄드
                case '충북': return '#9b59b6'; // 자주색
                case '충남': return '#34495e'; // 짙은 파랑
                case '대전': return '#16a085'; // 바다색
                case '세종': return '#d35400'; // 호박색
                case '경북': return '#7f8c8d'; // 회색
                case '경남': return '#2980b9'; // 중간 파랑
                case '대구': return '#8e44ad'; // 어두운 자주색
                case '울산': return '#2c3e50'; // 남색
                case '부산': return '#f39c12'; // 주황색
                case '전북': return '#e74c3c'; // 연한 빨강
                case '전남': return '#27ae60'; // 중간 초록
                case '광주': return '#e67e22'; // 당근색
                case '제주': return '#95a5a6'; // 연한 회색
                default: return '#bdc3c7'; // 은색
            }
        }

        function getColorHover(regionName) {
            // 여기에는 각 지역별 호버 시 보여줄 색상을 설정합니다.
            // 기본 색상보다 조금 더 밝거나 어둡게 설정하여 호버 효과를 줄 수 있습니다.
            switch (regionName) {
                case '서울': return '#e74c3c';
                case '경기': return '#5dade2';
                case '인천': return '#f4d03f';
                case '강원': return '#58d68d';
                case '충북': return '#af7ac5';
                case '충남': return '#5d6d7e';
                case '대전': return '#1abc9c';
                case '세종': return '#e59866';
                case '경북': return '#95a5a6';
                case '경남': return '#5499c7';
                case '대구': return '#9b59b6';
                case '울산': return '#34495e';
                case '부산': return '#f5b041';
                case '전북': return '#cd6155';
                case '전남': return '#2ecc71';
                case '광주': return '#d35400';
                case '제주': return '#a3e4d7';
                default: return '#d0d3d4';
            }
        }


    });
</script>
</body>
</html>
