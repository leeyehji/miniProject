// 마커를 추적할 배열
var markers = [];

// 정보창 객체 생성
var infowindow = new naver.maps.InfoWindow({
    disableAnchor: true, // 말꼬리 비활성화
    borderWidth: 0, // 보더 제거
    backgroundColor: "transparent" // 배경색 투명하게 설정
});

window.addEventListener('message', function(e) {
    var id = e.data; // 부모 페이지로부터 받은 id 값
    console.log(id);

    // 기존 마커를 지도에서 제거하고 배열 비우기
    markers.forEach(marker => marker.setMap(null));
    markers = [];

    // API 호출하여 좌표 가져오기
    fetch('/map/gwangju/coordinates/' + id)
        .then(response => response.json())
        .then(coordinates => {
            // 네이버 지도에 마커 생성
            coordinates.forEach(coordinate => {
                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(coordinate.t_mapy, coordinate.t_mapx),
                    map: map,
                    data: coordinate // 모든 데이터를 마커에 저장
                });

                // 마커를 배열에 추가
                markers.push(marker);

                //마커 클릭 이벤트
                naver.maps.Event.addListener(marker, 'click', function(e) {
                    var data = marker.data;
                    var contentString = `
                        <div class="iw_inner" style="background-color: #dbf0ff; padding: 8px; border-radius: 15px;border: 3px solid #bde3ff;">
                            ${data.t_contentname ? `<h3>${data.t_contentname}</h3>` : ''}
                            ${data.t_thumb_image ? `<img src="${data.t_thumb_image}" alt="${data.t_contentname}" class="thumb" style="width: 120px; height: 80px;" />` : ''}
                            ${data.t_address ? `<p>${data.t_address}</p>` : ''}
                            ${data.t_phone ? `<p>${data.t_phone}</p>` : ''}
                            ${data.t_contentno ? `<a target="_blank" href="http://223.130.130.226:8090/thema/themaDetailPage?contentNo=${data.t_contentno}&typeId=${data.t_contenttypeid}">더 많은 정보는 이곳으로</a>` : ''}
                        </div>
                    `;

                    // 정보창 내용 설정
                    infowindow.setContent(contentString);

                    // 정보창 위치 설정 (클릭한 마커의 위치)
                    infowindow.setPosition(marker.getPosition());
                    // 정보창 표시
                    infowindow.open(map, marker);
                });
            });
        });

    // 지도 클릭 이벤트
    naver.maps.Event.addListener(map, 'click', function(e) {
        // 정보창 닫기
        infowindow.close();
    });
});