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
        center: [36.7378, 127.8305],
        zoom: 9,
        zoomControl: false,
        dragging: false
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "© OpenStreetMap contributors",
        maxZoom: 9,
        minZoom: 9,
    }).addTo(mymap);

    $(document).ready(function () {
        $.getJSON("./chungbuk.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#af7ac5", // 예시 색상
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
                                case "청주시 상당구":
                                    window.location.href = "../chungbuk/cheongju_sangdanggu.jsp";
                                    break;
                                case "청주시 서원구":
                                    window.location.href = "../chungbuk/cheongju_seowongu.jsp";
                                    break;
                                case "청주시 흥덕구":
                                    window.location.href = "../chungbuk/cheongju_heungdeokgu.jsp";
                                    break;
                                case "청주시 청원구":
                                    window.location.href = "../chungbuk/cheongju_cheongwongu.jsp";
                                    break;
                                case "충주시":
                                    window.location.href = "../chungbuk/chungjusi.jsp";
                                    break;
                                case "제천시":
                                    window.location.href = "../chungbuk/jecheonsi.jsp";
                                    break;
                                case "보은군":
                                    window.location.href = "../chungbuk/boeunogun.jsp";
                                    break;
                                case "옥천군":
                                    window.location.href = "../chungbuk/okcheongun.jsp";
                                    break;
                                case "영동군":
                                    window.location.href = "../chungbuk/yeongdonggung.jsp";
                                    break;
                                case "증평군":
                                    window.location.href = "../chungbuk/jeungpyeonggun.jsp";
                                    break;
                                case "진천군":
                                    window.location.href = "../chungbuk/jincheongun.jsp";
                                    break;
                                case "괴산군":
                                    window.location.href = "../chungbuk/goesangun.jsp";
                                    break;
                                case "음성군":
                                    window.location.href = "../chungbuk/eumseonggun.jsp";
                                    break;
                                case "단양군":
                                    window.location.href = "../chungbuk/danyanggun.jsp";
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
                        fillColor: "#9b59b6", // 기본 색상
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