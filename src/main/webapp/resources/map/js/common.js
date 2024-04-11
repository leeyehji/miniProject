// 마커를 추적할 배열
var markers = [];

window.addEventListener('message', function(e) {
    var id = e.data; // 부모 페이지로부터 받은 id 값

    // 기존 마커를 지도에서 제거하고 배열 비우기
    markers.forEach(marker => marker.setMap(null));
    markers = [];

    // API 호출하여 좌표 가져오기
    fetch('/map/coordinates/' + id)
        .then(response => response.json())
        .then(coordinates => {
            // 네이버 지도에 마커 생성
            coordinates.forEach(coordinate => {
                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(coordinate.t_mapy, coordinate.t_mapx),
                    map: map
                });

                // 마커를 배열에 추가
                markers.push(marker);
            });
        });
});