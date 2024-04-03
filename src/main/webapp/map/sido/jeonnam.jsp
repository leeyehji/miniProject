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
        center: [34.9402, 126.9565],
        zoom: 8,
        zoomControl: false,
        dragging: false
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "© OpenStreetMap contributors",
        maxZoom: 8,
        minZoom: 8,
    }).addTo(mymap);

    $(document).ready(function () {
        $.getJSON("./jeonnam.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#2ecc71", // 예시 색상
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
                                case "목포시":
                                    window.location.href = "../jeonnam/mokposi.jsp";
                                    break;
                                case "여수시":
                                    window.location.href = "../jeonnam/yeosusi.jsp";
                                    break;
                                case "순천시":
                                    window.location.href = "../jeonnam/suncheonsi.jsp";
                                    break;
                                case "나주시":
                                    window.location.href = "../jeonnam/najusi.jsp";
                                    break;
                                case "광양시":
                                    window.location.href = "../jeonnam/gwangyangsi.jsp";
                                    break;
                                case "담양군":
                                    window.location.href = "../jeonnam/damyanggun.jsp";
                                    break;
                                case "곡성군":
                                    window.location.href = "../jeonnam/gokseonggun.jsp";
                                    break;
                                case "구례군":
                                    window.location.href = "../jeonnam/guryegun.jsp";
                                    break;
                                case "고흥군":
                                    window.location.href = "../jeonnam/goheunggun.jsp";
                                    break;
                                case "보성군":
                                    window.location.href = "../jeonnam/boseonggun.jsp";
                                    break;
                                case "화순군":
                                    window.location.href = "../jeonnam/hwasoongun.jsp";
                                    break;
                                case "장흥군":
                                    window.location.href = "../jeonnam/jangheunggun.jsp";
                                    break;
                                case "강진군":
                                    window.location.href = "../jeonnam/gangjingun.jsp";
                                    break;
                                case "해남군":
                                    window.location.href = "../jeonnam/haenamgun.jsp";
                                    break;
                                case "영암군":
                                    window.location.href = "../jeonnam/yeongamgun.jsp";
                                    break;
                                case "무안군":
                                    window.location.href = "../jeonnam/muangun.jsp";
                                    break;
                                case "함평군":
                                    window.location.href = "../jeonnam/hampeungun.jsp";
                                    break;
                                case "영광군":
                                    window.location.href = "../jeonnam/yeonggwanggun.jsp";
                                    break;
                                case "장성군":
                                    window.location.href = "../jeonnam/jangseonggun.jsp";
                                    break;
                                case "완도군":
                                    window.location.href = "../jeonnam/wandogun.jsp";
                                    break;
                                case "진도군":
                                    window.location.href = "../jeonnam/jindogun.jsp";
                                    break;
                                case "신안군":
                                    window.location.href = "../jeonnam/sinangun.jsp";
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
                        fillColor: "#27ae60", // 기본 색상
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