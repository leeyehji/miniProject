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
        center: [37.7250, 128.3010],
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
        $.getJSON("./gangwon.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#58d68d", // 예시 색상
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
                                case "춘천시":
                                    window.location.href = "../gangwon/chuncheonsi.jsp";
                                    break;
                                case "원주시":
                                    window.location.href = "../gangwon/wonjusi.jsp";
                                    break;
                                case "강릉시":
                                    window.location.href = "../gangwon/gangneungsi.jsp";
                                    break;
                                case "동해시":
                                    window.location.href = "../gangwon/donghaesi.jsp";
                                    break;
                                case "태백시":
                                    window.location.href = "../gangwon/taebaeksi.jsp";
                                    break;
                                case "속초시":
                                    window.location.href = "../gangwon/sokchosi.jsp";
                                    break;
                                case "삼척시":
                                    window.location.href = "../gangwon/samcheoksi.jsp";
                                    break;
                                case "홍천군":
                                    window.location.href = "../gangwon/hongcheongun.jsp";
                                    break;
                                case "횡성군":
                                    window.location.href = "../gangwon/hoengseonggun.jsp";
                                    break;
                                case "영월군":
                                    window.location.href = "../gangwon/yeongwolgun.jsp";
                                    break;
                                case "평창군":
                                    window.location.href = "../gangwon/pyeongchanggun.jsp";
                                    break;
                                case "정선군":
                                    window.location.href = "../gangwon/jeongseongun.jsp";
                                    break;
                                case "철원군":
                                    window.location.href = "../gangwon/cheorwongun.jsp";
                                    break;
                                case "화천군":
                                    window.location.href = "../gangwon/hwacheongun.jsp";
                                    break;
                                case "양구군":
                                    window.location.href = "../gangwon/yanggugun.jsp";
                                    break;
                                case "인제군":
                                    window.location.href = "../gangwon/injegun.jsp";
                                    break;
                                case "고성군":
                                    window.location.href = "../gangwon/goseonggun.jsp";
                                    break;
                                case "양양군":
                                    window.location.href = "../gangwon/yangyanggun.jsp";
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
                        fillColor: "#2ecc71", // 기본 색상
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