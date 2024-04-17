function login() {
    var MEM_ID = $("#MEM_ID").val(); // 아이디 입력 필드에서 값을 가져옴
    var MEM_PWD = $("#MEM_PWD").val(); // 비밀번호 입력 필드에서 값을 가져옴

    // 서버로 전송할 데이터 객체 생성
    var loginData = {
        MEM_ID: MEM_ID,
        MEM_PWD: MEM_PWD
    };
    console.log(MEM_ID)

    $.ajax({
        url: '/member/login',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify(loginData), // JSON 형태로 변환하여 데이터 전송
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
