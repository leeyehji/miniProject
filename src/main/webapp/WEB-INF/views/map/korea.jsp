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
    window.addEventListener('message', function(e) {
        var id = e.data; // 부모 페이지로부터 받은 id 값
        // console.log(id); // 콘솔에 id 값 출력
        // alert(id); // 알림창에 id 값 출력
    });

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
        $.getJSON("/resources/map/json/korea.json", function (data) {
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
                            parent.postMessage({
                                clickedSubject: feature.properties.CTP_KOR_NM,
                                clickedContent: feature.properties.CTP_Description,
                                clickedRegion: feature.properties.CTP_ENG_NM,
                            }, "*");
                            window.location.href = "/map/sido/" + feature.properties.CTP_ENG_NM.toLowerCase();
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
