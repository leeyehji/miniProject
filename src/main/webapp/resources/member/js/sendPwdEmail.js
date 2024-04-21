function sendPwdEmail() {
    var MEM_EMAIL = $('#MEM_EMAIL').val();
    console.log(MEM_EMAIL)
    $.ajax({
        type: "POST",
        url: "/member/findPwd",
        data: {
            MEM_EMAIL: MEM_EMAIL
        },
        success: function(response) {
            alert("인증번호가 전송되었습니다.");
        },
        error: function(xhr, status, error) {
        }
    });
}