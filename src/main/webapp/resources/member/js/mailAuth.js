function mailAuth() {
    console.log("!1111111111111")

    $.ajax({
        type: "POST",
        url: "/member/sendAuthCode",
        data: {
            "MEM_EMAIL": $("#MEM_EMAIL").val()
        },

        success: function(response) {

            alert("응답: " + response);
             window.location.href='/';
        },
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });
}
