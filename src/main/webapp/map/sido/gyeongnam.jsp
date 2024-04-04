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
        center: [35.1696, 128.4070],
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
        $.getJSON("./gyeongnam.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#5499c7", // 예시 색상
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
                                case "창원시 의창구":
                                    window.location.href = "../gyeongnam/changwonsi_uichanggu.jsp";
                                    break;
                                case "창원시 성산구":
                                    window.location.href = "../gyeongnam/changwonsi_seongsangu.jsp";
                                    break;
                                case "창원시 마산합포구":
                                    window.location.href = "../gyeongnam/changwonsi_masanhappogu.jsp";
                                    break;
                                case "창원시 마산회원구":
                                    window.location.href = "../gyeongnam/changwonsi_masanhoeongu.jsp";
                                    break;
                                case "창원시 진해구":
                                    window.location.href = "../gyeongnam/changwonsi_jinhaegu.jsp";
                                    break;
                                case "진주시":
                                    window.location.href = "../gyeongnam/jinjusi.jsp";
                                    break;
                                case "통영시":
                                    window.location.href = "../gyeongnam/tongyeongsi.jsp";
                                    break;
                                case "사천시":
                                    window.location.href = "../gyeongnam/sacheonsi.jsp";
                                    break;
                                case "김해시":
                                    window.location.href = "../gyeongnam/gimhaesi.jsp";
                                    break;
                                case "밀양시":
                                    window.location.href = "../gyeongnam/miryangsi.jsp";
                                    break;
                                case "거제시":
                                    window.location.href = "../gyeongnam/geojesi.jsp";
                                    break;
                                case "양산시":
                                    window.location.href = "../gyeongnam/yangsansi.jsp";
                                    break;
                                case "의령군":
                                    window.location.href = "../gyeongnam/uiryeonggun.jsp";
                                    break;
                                case "함안군":
                                    window.location.href = "../gyeongnam/hamangun.jsp";
                                    break;
                                case "창녕군":
                                    window.location.href = "../gyeongnam/changnyeonggun.jsp";
                                    break;
                                case "고성군":
                                    window.location.href = "../gyeongnam/goseonggun.jsp";
                                    break;
                                case "남해군":
                                    window.location.href = "../gyeongnam/namhaegun.jsp";
                                    break;
                                case "하동군":
                                    window.location.href = "../gyeongnam/hadonggun.jsp";
                                    break;
                                case "산청군":
                                    window.location.href = "../gyeongnam/sancheonggun.jsp";
                                    break;
                                case "함양군":
                                    window.location.href = "../gyeongnam/hamyanggun.jsp";
                                    break;
                                case "거창군":
                                    window.location.href = "../gyeongnam/geochanggun.jsp";
                                    break;
                                case "합천군":
                                    window.location.href = "../gyeongnam/hapcheongun.jsp";
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
                        fillColor: "#2980b9", // 기본 색상
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