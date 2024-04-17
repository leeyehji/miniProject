function memberJoin() {
    var formData = {
        MEM_ID: $("#MEM_ID").val(),
        MEM_PW: $("#MEM_PW").val(),
        MEM_PW_CH: $("#MEM_PW_CH").val(),
        MEM_NAME: $("#MEM_NAME").val(),
        MEM_PHONE: $("#MEM_PHONE").val(),
        MEM_EMAIL: $("#MEM_EMAIL").val(),
        MEM_GENDER: $("input[name='MEM_GENDER']:checked").val() === "male" ? 0 : 1
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

    if (formData.MEM_PW !== formData.MEM_PW_CH) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    // AJAX 요청
    $.ajax({
        type: "POST",
        url: "/member/memberJoin",
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function(response) {
            alert("가입이 완료되었습니다.");
            window.location.href = '/'; // 가입 후 리다이렉션
        },
        error: function(xhr, status, error) {
            alert("가입 중 오류가 발생했습니다.");
        }
    });
}
