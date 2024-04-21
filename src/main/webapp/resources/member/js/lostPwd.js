function lostPwd() {

    var MEM_NAME = $('#MEM_NAME').val();
    var MEM_ID = $('#MEM_ID').val();
    var MEM_PHONE = $('#MEM_PHONE').val();
    var MEM_EMAIL = $('#MEM_EMAIL').val();
    var verification = $('#verification').val();


    var data = {
        MEM_NAME: MEM_NAME,
        MEM_ID: MEM_ID,
        MEM_PHONE: MEM_PHONE,
        MEM_EMAIL: MEM_EMAIL,
        verification:verification

    };

    // AJAX 요청 보내기
    $.ajax({
        type: 'POST',
        url: '/member/lostPwd',
        contentType: 'application/json', // 올바른 MIME 타입 설정
        data: JSON.stringify(data), // JSON 객체를 문자열로 변환
        success: function(response) {
            // 성공적으로 서버로부터 응답을 받았을 때의 처리
            alert("비밀번호는 =" + response);
        },
        error: function(xhr, status, error) {
            // 서버로부터 오류 응답을 받았을 때의 처리
        }
    });
}
