function memberJoin() {
    // 필수 입력 필드 값 확인
    var MEM_ID = $("#MEM_ID").val();
    var MEM_PW = $("#MEM_PW").val();
    var MEM_PW_CH = $("#MEM_PW_CH").val();
    var MEM_NAME = $("#MEM_NAME").val();
    var MEM_PHONE = $("#MEM_PHONE").val();
    var MEM_EMAIL = $("#MEM_EMAIL").val();
    var MEM_GENDER = $('input[name="mem_gender[]"]:checked').val()=== 'male' ? 0 : 1;


    // 비밀번호 일치 확인 등 필수 입력 항목 검증
    if(MEM_PW !== MEM_PW_CH) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return;
    }

    // AJAX 요청으로 회원가입 데이터 전송
    $.ajax({
        type: 'POST',
        url: '/member/memberJoin',

        data: {
            "MEM_ID": MEM_ID,
            "MEM_PW": MEM_PW,
            "MEM_NAME": MEM_NAME,
            "MEM_PHONE": MEM_PHONE,
            "MEM_EMAIL": MEM_EMAIL,
            "MEM_GENDER": MEM_GENDER
        },
        success: function(response) {
            // 회원가입 성공 처리 로직
            alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
            window.location.href = "/member/loginForm";
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error:", status, error);
        }
    });
}
