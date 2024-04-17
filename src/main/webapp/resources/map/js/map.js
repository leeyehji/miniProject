window.addEventListener("message", function(event) {
    // 메시지 수신 및 검증
    // if (event.origin !== "http://예상되는출처") { // 보안을 위해 출처 검증
    //     return; // 출처가 예상과 다르면 처리하지 않음
    // }

    // 메시지에서 정보 추출
    var data = event.data;
    var clickedSubject = data.clickedSubject;
    var clickedContent = data.clickedContent;
    var clickedRegion = data.clickedRegion;
    var iframe = document.getElementById('mapframe');
    if (data.newSrc) {
        iframe.src = data.newSrc;
    }

    // 정보를 웹 페이지에 표시
    document.getElementById("clickedsubject").innerHTML = clickedSubject;
    document.getElementById("clickedcontent").innerHTML = clickedContent;

    // 클릭된 지역의 버튼에 'active' 클래스 추가
    var buttons = document.querySelectorAll(".location button");
    for (var i = 0; i < buttons.length; i++) {
        if (buttons[i].classList.contains(data.clickedRegion)) {
            buttons[i].classList.add("active");
        } else {
            buttons[i].classList.remove("active");
        }
    }
});
document.addEventListener("DOMContentLoaded", function () {

    const jsonUrl = "/resources/map/json/korea.json";

    fetch(jsonUrl)
        .then((response) => {
            if (response.ok) {
                return response.json();
            }
            throw new Error("데이터를 불러오는데 실패했습니다.");
        })
        .then((regionsData) => {
            document.querySelectorAll(".location button").forEach((button) => {
                button.addEventListener("click", function () {
                    const regionData = regionsData.features.find(
                        (feature) => feature.properties.CTPRVN_CD === button.id
                    );

                    if (regionData) {
                        document.getElementById("clickedsubject").textContent =
                            regionData.properties.CTP_KOR_NM;
                        document.getElementById("clickedcontent").textContent =
                            regionData.properties.CTP_Description;

                        // 모든 버튼의 'active' 클래스를 제거
                        document.querySelectorAll(".location button").forEach((btn) =>
                            btn.classList.remove("active")
                        );

                        // 클릭한 버튼에만 'active' 클래스 추가
                        button.classList.add("active");


                        // 버튼의 id를 이용해 해당 지역의 .jsp 파일 경로를 생성하고 iframe의 src 속성 변경
                        let regionPage = './korea'; // 기본값
                        let regionName = regionData.properties.CTP_ENG_NM.toLowerCase();
                        regionPage = './sido/' + regionName;
                        fetch("./sido/" + regionName + ".json")
                            .then(response => response.json())
                            .then(regionData => {
                                const locationButton = document.querySelector(".rightmain .location button");
                                if (locationButton && regionData.properties && regionData.properties.SIG_KOR_NM) {
                                    locationButton.textContent = regionData.properties.SIG_KOR_NM;
                                    locationButton.id = regionData.properties.SIG_KOR_NM;
                                }
                            })
                            .catch(error => console.error(regionName + " 데이터 로드 실패:", error));
                        document.getElementById("mapframe").src = regionPage;
                    }
                });
            });
        })
        .catch((error) => {
            console.error("Error:", error);
        });
});
document.getElementById("resetBtn1").addEventListener("click", function () {
    // iframe의 src를 기본 지도 페이지로 변경
    document.getElementById("mapframe").src = "./korea";

    // 선택된 지역 버튼의 'active' 클래스 제거
    document.querySelectorAll(".location button").forEach((button) =>
        button.classList.remove("active")
    );
    // 모든 테마 버튼의 'active' 클래스 제거
    document.querySelectorAll(".theme button").forEach((button) =>
        button.classList.remove("active")
    );

    // 테마 초기화
    document.getElementById("clickedsubject").textContent = "해시태그를 클릭해보세요!";
    document.getElementById("clickedcontent").textContent = "지역에 대한 설명이 나옵니다";
});

document.getElementById("resetBtn2").addEventListener("click", function () {
    // 모든 테마 버튼의 'active' 클래스 제거
    document.querySelectorAll(".theme button").forEach((button) =>
        button.classList.remove("active")
    );

    var iframe = document.getElementById("mapframe");
    if (iframe.src === "http://223.130.130.226:8090/map/korea") {
        alert("먼저 시/도를 선택해주세요.");
    } else {
        // 현재 iframe 새로고침
        iframe.src = iframe.src;
    }
});

document.addEventListener('DOMContentLoaded', function() {
    var buttons = document.querySelectorAll('.theme button');
    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            // 모든 버튼에서 active 클래스 제거
            buttons.forEach(btn => btn.classList.remove('active'));
            // 현재 클릭된 버튼에 active 클래스 추가
            this.classList.add('active');

            var contentTypeId = this.id; // 클릭된 버튼의 ID 값

            // iframe 내부의 문서에 접근하여 함수 실행
            var iframeDocument = document.getElementById('mapframe').contentWindow;
            iframeDocument.postMessage(contentTypeId, '*'); // '*'는 모든 출처를 의미합니다. 실제 배포시에는 보안을 위해 출처를 지정해야 합니다.
        });
    });
});

document.getElementById("mapInfoBtn").addEventListener("click", function () {
    var mapInfoBtn = this;
    var mapInfoDiv = document.querySelector(".mapinfo");
    if (mapInfoDiv.style.display === "none" || mapInfoDiv.style.display === "") {
        mapInfoDiv.style.display = "block";
        mapInfoBtn.style.backgroundColor = "#3498db"; // Set the background color to #3498db when the button is clicked
    } else {
        mapInfoDiv.style.display = "none";
        mapInfoBtn.style.backgroundColor = ""; // Reset the background color when the button is clicked again
    }
});
