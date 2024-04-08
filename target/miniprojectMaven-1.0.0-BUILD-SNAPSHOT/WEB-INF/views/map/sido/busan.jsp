<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Map</title>
    <meta charset="utf-8"/>
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
    var mymap = L.map("mapid",{
        center: [35.2100, 129.0689],
        zoom: 10,
        zoomControl: false,
        dragging: false
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "© OpenStreetMap contributors",
        maxZoom: 10,
        minZoom: 10,
    }).addTo(mymap);

    $(document).ready(function () {
        $.getJSON("./busan.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#f5b041", // 예시 색상
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
                                .setContent(feature.properties.SIG_KOR_NM)
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
                            switch (feature.properties.SIG_KOR_NM) {
                                case "중구":
                                    window.location.href = "../busan/junggu.jsp";
                                    break;
                                case "서구":
                                    window.location.href = "../busan/seogu.jsp";
                                    break;
                                case "동구":
                                    window.location.href = "../busan/donggu.jsp";
                                    break;
                                case "영도구":
                                    window.location.href = "../busan/yeongdogu.jsp";
                                    break;
                                case "부산진구":
                                    window.location.href = "busan/busanjingu.jsp";
                                    break;
                                case "동래구":
                                    window.location.href = "../busan/dongnaegu.jsp";
                                    break;
                                case "남구":
                                    window.location.href = "../busan/namgu.jsp";
                                    break;
                                case "북구":
                                    window.location.href = "../busan/bukgu.jsp";
                                    break;
                                case "해운대구":
                                    window.location.href = "../busan/haeundaegu.jsp";
                                    break;
                                case "사하구":
                                    window.location.href = "../busan/sahagu.jsp";
                                    break;
                                case "금정구":
                                    window.location.href = "../busan/geumjeonggu.jsp";
                                    break;
                                case "강서구":
                                    window.location.href = "../busan/gangseogu.jsp";
                                    break;
                                case "연제구":
                                    window.location.href = "../busan/yeonjegu.jsp";
                                    break;
                                case "수영구":
                                    window.location.href = "../busan/suyeonggu.jsp";
                                    break;
                                case "사상구":
                                    window.location.href = "../busan/sasanggu.jsp";
                                    break;
                                case "기장군":
                                    window.location.href = "../busan/gijanggun.jsp";
                                    break;
                                default:
                                    // 선택한 지역이 위의 case에 해당하지 않을 경우의 처리를 여기에 작성할 수 있습니다.
                                    break;
                            }
                        },
                    });
                },
                // 초기 스타일 설정
                style: function (feature) {
                    return {
                        fillColor: "#f39c12", // 기본 색상
                        weight: 1,
                        opacity: 1,
                        color: "white", // 경계선 색상
                        fillOpacity: 1,
                    };
                },
            }).addTo(mymap);
        });
    });
</script>
</body>
</html>

