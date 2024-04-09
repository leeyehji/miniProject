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
        center: [37.5289, 127.1728],
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
        $.getJSON("/resources/map/json/gyeonggi.json", function (data) {
            var geojson = L.geoJSON(data, {
                onEachFeature: function (feature, layer) {
                    layer.on({
                        mouseover: function (e) {
                            var layer = e.target;

                            // 보색으로 색 변경
                            layer.setStyle({
                                fillColor: "#5dade2", // 예시 색상
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
                            window.location.href = "/map/gyeonggi/" + feature.properties.SIG_ENG_NM;
                            // switch (feature.properties.SIG_KOR_NM) {
                            //     case "수원시 장안구":
                            //         window.location.href = "../gyeonggi/suwonsi_jangangu.jsp";
                            //         break;
                            //     case "수원시 권선구":
                            //         window.location.href = "../gyeonggi/suwonsi_gwonseongu.jsp";
                            //         break;
                            //     case "수원시 팔달구":
                            //         window.location.href = "../gyeonggi/suwonsi_paldalgu.jsp";
                            //         break;
                            //     case "수원시 영통구":
                            //         window.location.href = "../gyeonggi/suwonsi_yeongtonggu.jsp";
                            //         break;
                            //     case "성남시 수정구":
                            //         window.location.href = "../gyeonggi/seongnamsi_sujeonggu.jsp";
                            //         break;
                            //     case "성남시 중원구":
                            //         window.location.href = "../gyeonggi/seongnamsi_jungwongu.jsp";
                            //         break;
                            //     case "성남시 분당구":
                            //         window.location.href = "../gyeonggi/seongnamsi_bundanggu.jsp";
                            //         break;
                            //     case "의정부시":
                            //         window.location.href = "../gyeonggi/uijeongbusi.jsp";
                            //         break;
                            //     case "안양시 만안구":
                            //         window.location.href = "../gyeonggi/anyangsi_manangu.jsp";
                            //         break;
                            //     case "안양시 동안구":
                            //         window.location.href = "../gyeonggi/anyangsi_dongangu.jsp";
                            //         break;
                            //     case "부천시 원미구":
                            //         window.location.href = "../gyeonggi/bucheonsi_wonmigu.jsp";
                            //         break;
                            //     case "부천시 소사구":
                            //         window.location.href = "../gyeonggi/bucheonsi_sosagu.jsp";
                            //         break;
                            //     case "부천시 오정구":
                            //         window.location.href = "../gyeonggi/bucheonsi_ojeonggu.jsp";
                            //         break;
                            //     case "광명시":
                            //         window.location.href = "../gyeonggi/gwangmyeongsi.jsp";
                            //         break;
                            //     case "평택시":
                            //         window.location.href = "../gyeonggi/pyeongtaeksi.jsp";
                            //         break;
                            //     case "동두천시":
                            //         window.location.href = "../gyeonggi/dongducheonsi.jsp";
                            //         break;
                            //     case "안산시 상록구":
                            //         window.location.href = "../gyeonggi/ansansi_sangnokgu.jsp";
                            //         break;
                            //     case "안산시 단원구":
                            //         window.location.href = "../gyeonggi/ansansi_danwongu.jsp";
                            //         break;
                            //     case "고양시 덕양구":
                            //         window.location.href = "../gyeonggi/goyangsi_deogyanggu.jsp";
                            //         break;
                            //     case "고양시 일산동구":
                            //         window.location.href = "../gyeonggi/goyangsi_ilsandonggu.jsp";
                            //         break;
                            //     case "고양시 일산서구":
                            //         window.location.href = "../gyeonggi/goyangsi_ilsanseogu.jsp";
                            //         break;
                            //     case "과천시":
                            //         window.location.href = "../gyeonggi/gwacheonsi.jsp";
                            //         break;
                            //     case "구리시":
                            //         window.location.href = "../gyeonggi/gurisi.jsp";
                            //         break;
                            //     case "남양주시":
                            //         window.location.href = "../gyeonggi/namyangjusi.jsp";
                            //         break;
                            //     case "오산시":
                            //         window.location.href = "../gyeonggi/osansi.jsp";
                            //         break;
                            //     case "시흥시":
                            //         window.location.href = "../gyeonggi/siheungsi.jsp";
                            //         break;
                            //     case "군포시":
                            //         window.location.href = "../gyeonggi/gunposi.jsp";
                            //         break;
                            //     case "의왕시":
                            //         window.location.href = "../gyeonggi/uiwangsi.jsp";
                            //         break;
                            //     case "하남시":
                            //         window.location.href = "../gyeonggi/hanamsi.jsp";
                            //         break;
                            //     case "용인시 처인구":
                            //         window.location.href = "../gyeonggi/yonginsi_cheoingu.jsp";
                            //         break;
                            //     case "용인시 기흥구":
                            //         window.location.href = "../gyeonggi/yonginsi_giheunggu.jsp";
                            //         break;
                            //     case "용인시 수지구":
                            //         window.location.href = "../gyeonggi/yonginsi_sujigu.jsp";
                            //         break;
                            //     case "파주시":
                            //         window.location.href = "../gyeonggi/pajusi.jsp";
                            //         break;
                            //     case "이천시":
                            //         window.location.href = "../gyeonggi/icheonsi.jsp";
                            //         break;
                            //     case "안성시":
                            //         window.location.href = "../gyeonggi/anseongsi.jsp";
                            //         break;
                            //     case "김포시":
                            //         window.location.href = "../gyeonggi/gimposi.jsp";
                            //         break;
                            //     case "화성시":
                            //         window.location.href = "../gyeonggi/hwaseongsi.jsp";
                            //         break;
                            //     case "광주시":
                            //         window.location.href = "../gyeonggi/gwangjusi.jsp";
                            //         break;
                            //     case "양주시":
                            //         window.location.href = "../gyeonggi/yangjusi.jsp";
                            //         break;
                            //     case "포천시":
                            //         window.location.href = "../gyeonggi/pocheonsi.jsp";
                            //         break;
                            //     case "여주시":
                            //         window.location.href = "../gyeonggi/yeojusi.jsp";
                            //         break;
                            //     case "연천군":
                            //         window.location.href = "../gyeonggi/yeoncheongun.jsp";
                            //         break;
                            //     case "가평군":
                            //         window.location.href = "../gyeonggi/gapyeonggun.jsp";
                            //         break;
                            //     case "양평군":
                            //         window.location.href = "../gyeonggi/yangpyeonggun.jsp";
                            //         break;
                            //     default:
                            //         // 선택한 지역이 위의 case에 해당하지 않을 경우의 처리를 여기에 작성할 수 있습니다.
                            //         break;
                            // }
                        },
                    });
                },
                // 초기 스타일 설정
                style: function (feature) {
                    return {
                        fillColor: "#3498db", // 기본 색상
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