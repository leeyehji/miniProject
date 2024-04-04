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
        center: [36.6436, 128.7402],
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
        $.getJSON("./gyeongbuk.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#95a5a6", // 예시 색상
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
                                case "포항시 남구":
                                    window.location.href = "../gyeongbuk/pohangsi_namgu.jsp";
                                    break;
                                case "포항시 북구":
                                    window.location.href = "../gyeongbuk/pohangsi_bukgu.jsp";
                                    break;
                                case "경주시":
                                    window.location.href = "../gyeongbuk/gyeongjusi.jsp";
                                    break;
                                case "김천시":
                                    window.location.href = "../gyeongbuk/gimcheonsi.jsp";
                                    break;
                                case "안동시":
                                    window.location.href = "../gyeongbuk/andongsi.jsp";
                                    break;
                                case "구미시":
                                    window.location.href = "../gyeongbuk/gumisi.jsp";
                                    break;
                                case "영주시":
                                    window.location.href = "../gyeongbuk/yeongjusi.jsp";
                                    break;
                                case "영천시":
                                    window.location.href = "../gyeongbuk/yeongcheonsi.jsp";
                                    break;
                                case "상주시":
                                    window.location.href = "../gyeongbuk/sangjusi.jsp";
                                    break;
                                case "문경시":
                                    window.location.href = "../gyeongbuk/mungyeongsi.jsp";
                                    break;
                                case "경산시":
                                    window.location.href = "../gyeongbuk/gyeongsansi.jsp";
                                    break;
                                case "군위군":
                                    window.location.href = "../gyeongbuk/gunwigun.jsp";
                                    break;
                                case "의성군":
                                    window.location.href = "../gyeongbuk/uiseonggun.jsp";
                                    break;
                                case "청송군":
                                    window.location.href = "../gyeongbuk/cheongsonggun.jsp";
                                    break;
                                case "영양군":
                                    window.location.href = "../gyeongbuk/yeongyanggun.jsp";
                                    break;
                                case "영덕군":
                                    window.location.href = "../gyeongbuk/yeongdeokgun.jsp";
                                    break;
                                case "청도군":
                                    window.location.href = "../gyeongbuk/cheongdogun.jsp";
                                    break;
                                case "고령군":
                                    window.location.href = "../gyeongbuk/goryeonggun.jsp";
                                    break;
                                case "성주군":
                                    window.location.href = "../gyeongbuk/seongjugun.jsp";
                                    break;
                                case "칠곡군":
                                    window.location.href = "../gyeongbuk/chilgokgun.jsp";
                                    break;
                                case "예천군":
                                    window.location.href = "../gyeongbuk/yecheongun.jsp";
                                    break;
                                case "봉화군":
                                    window.location.href = "../gyeongbuk/bonghwagun.jsp";
                                    break;
                                case "울진군":
                                    window.location.href = "../gyeongbuk/uljingun.jsp";
                                    break;
                                case "울릉군":
                                    window.location.href = "../gyeongbuk/ulleunggun.jsp";
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
                        fillColor: "#7f8c8d", // 기본 색상
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