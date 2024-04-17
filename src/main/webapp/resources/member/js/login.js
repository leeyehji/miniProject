$(document).ready(function() {
    // 엔터 키 이벤트 리스너
    $("#MEM_ID, #MEM_PW").keyup(function(event) {
        if (event.keyCode === 13) {
            login();
        }
    });
});

function login() {
    var MEM_ID = $("#MEM_ID").val(); // 아이디 입력 필드에서 값을 가져옴
    var MEM_PW = $("#MEM_PW").val(); // 비밀번호 입력 필드에서 값을 가져옴

    if (!MEM_ID) {
        $("#idWarning").text("아이디를 입력하세요.");
        return;
    } else {
        $("#idWarning").text(""); // 경고 메시지 제거
    }

    if (!MEM_PW) {
        $("#pwWarning").text("비밀번호를 입력하세요.");
        return;
    } else {
        $("#pwWarning").text(""); // 경고 메시지 제거
    }


    // 서버로 전송할 데이터 객체 생성
    var loginData = {
        MEM_ID: MEM_ID,
        MEM_PW: MEM_PW
    };
    console.log(MEM_ID)

    $.ajax({
        url: '/member/login',
        type: 'post',
        data:(loginData), // JSON 형태로 변환하여 데이터 전송
        success: function(data) {
            if(data.loginResult) {
                alert('로그인 성공: ' + data.MEM_ID);
                window.location.href = '/'; // 로그인 성공 시 리다이렉트할 페이지
            } else {
                console.error('로그인 실패',erroor);
            }
        },
        error: function(xhr, status, error) {
            console.error('로그인 요청 에러:', error);
        }
    });
}
