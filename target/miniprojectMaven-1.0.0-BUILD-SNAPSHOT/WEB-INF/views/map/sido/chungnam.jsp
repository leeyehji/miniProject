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
        center: [36.5296, 126.7991],
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
        $.getJSON("./chungnam.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#5d6d7e", // 예시 색상
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
                                direction: "right",
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
                                case "천안시 동남구":
                                    window.location.href = "../chungnam/cheonansi_dongnamgu.jsp";
                                    break;
                                case "천안시 서북구":
                                    window.location.href = "../chungnam/cheonansi_seobukgu.jsp";
                                    break;
                                case "공주시":
                                    window.location.href = "../chungnam/gongjusi.jsp";
                                    break;
                                case "보령시":
                                    window.location.href = "../chungnam/boryeongsi.jsp";
                                    break;
                                case "아산시":
                                    window.location.href = "../chungnam/asansi.jsp";
                                    break;
                                case "서산시":
                                    window.location.href = "../chungnam/seosansi.jsp";
                                    break;
                                case "논산시":
                                    window.location.href = "../chungnam/nonsansi.jsp";
                                    break;
                                case "계룡시":
                                    window.location.href = "../chungnam/gyeryongsi.jsp";
                                    break;
                                case "당진시":
                                    window.location.href = "../chungnam/dangjinsi.jsp";
                                    break;
                                case "금산군":
                                    window.location.href = "../chungnam/geumsangun.jsp";
                                    break;
                                case "부여군":
                                    window.location.href = "../chungnam/buyeogun.jsp";
                                    break;
                                case "서천군":
                                    window.location.href = "../chungnam/seochengun.jsp";
                                    break;
                                case "청양군":
                                    window.location.href = "../chungnam/cheongyangun.jsp";
                                    break;
                                case "홍성군":
                                    window.location.href = "../chungnam/hongseongun.jsp";
                                    break;
                                case "예산군":
                                    window.location.href = "../chungnam/yesangun.jsp";
                                    break;
                                case "태안군":
                                    window.location.href = "../chungnam/taeangun.jsp";
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
                        fillColor: "#34495e", // 기본 색상
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