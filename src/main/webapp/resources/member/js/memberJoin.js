document.addEventListener('DOMContentLoaded', function() {
    var signupBtn = document.querySelector('.signup_btn');
    signupBtn.addEventListener('click', memberJoin);
});

function memberJoin() {
    // HTML 폼에서 사용자 입력 데이터 가져오기
    var formData = {
        MEM_ID: $("#MEM_ID").val(),
        MEM_PW: $("#MEM_PW").val(),
        MEM_PW_CH: $("#MEM_PW_CH").val(), // 비밀번호 확인 값 추가
        MEM_NAME: $("#MEM_NAME").val(),
        MEM_PHONE: $("#MEM_PHONE").val(),
        MEM_EMAIL: $("#MEM_EMAIL").val(),
        MEM_GENDER: $("input[name='MEM_GENDER']:checked").val() === "male" ? 0 : 1 // 성별 값 처리 수정: 남자면 0, 여자면 1
    };

    // 유효성 검사
    if (Object.values(formData).includes("") || formData.MEM_GENDER === undefined) {
        alert("모든 항목을 입력해주세요.");
        return;
    }

    if (formData.MEM_ID.length < 4 || formData.MEM_ID.length > 12) {
        alert("아이디는 4자 이상 12자 이하로 입력해주세요.");
        return;
    }

    if (formData.MEM_PW.length < 6 || formData.MEM_PW.length > 20) {
        alert("비밀번호는 6자 이상 20자 이하로 입력해주세요.");
        return;
    }

    if (formData.MEM_PW !== formData.MEM_PW_CH) { // 비밀번호와 비밀번호 확인 값이 다른 경우
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    // AJAX를 이용해 서버의 Controller에 데이터 전송
    $.ajax({
        type: "POST",
        url: "/member/memberJoin",
        data: (formData),
        success: function(response) {
            alert("가입이 완료되었습니다.");
        },
        error: function(xhr, status, error) {
            alert("가입 중 오류가 발생했습니다.");
        }
    });
}
