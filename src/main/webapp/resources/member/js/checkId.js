function checkId() {
    var MEM_ID = $("#MEM_ID").val(); // 아이디 입력 필드에서 값을 가져옴
    var checkResult = $("#id-dup-result"); // 결과를 표시할 요소 선택

    // AJAX 요청 시작
    $.ajax({
        type: 'POST', // 요청 방식
        url: '/member/checkId', // 요청을 보낼 URL
        contentType: 'application/json', // 전송할 데이터의 MIME 타입
        data: JSON.stringify({MEM_ID: MEM_ID}), // 전송할 데이터
        success: function (response) {
            console.log(response.status)
            if (response.status === "exist") {
              alert("이미 사용중인 아이디 입니다")
            } else if (response.status === 'non_exist') {
                alert("사용가능합니다")
            }
        },
        error: function (xhr, status, error) {
            // 요청이 실패했을 때 실행될 함수
            alert("요청 오류입니다.");
            console.error("AJAX Error:", status, error); // 오류 내용 로깅
        }
    });
}
