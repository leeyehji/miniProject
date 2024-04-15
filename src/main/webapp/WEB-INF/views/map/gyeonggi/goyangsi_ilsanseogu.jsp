<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4vs3zbhm8b"></script>
</head>
<body>
<div id="map" style="width:100%;height:680px;"></div>

<script>
    var mapOptions = {
        center: new naver.maps.LatLng(37.6803, 126.7279),
        zoom: 13
    };

    var map = new naver.maps.Map('map', mapOptions);
</script>
<script src="/map/js/gyeonggiCommon.js"></script>
</body>
</html>