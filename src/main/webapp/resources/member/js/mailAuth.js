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
             window.location.href='/member/mailWindow';
        },
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });
}
function mailAuth() {


    $.ajax({
        type: "POST",
        url: "/member/sendAuthCode",
        data: {
            "MEM_EMAIL": $("#MEM_EMAIL").val()
        },

        success: function(response) {

            var MEM_EMAIL = $("#MEM_EMAIL").val();
            var newWindowUrl = '/member/mailWindow?MEM_EMAIL=' + encodeURIComponent(MEM_EMAIL);
            window.open(newWindowUrl, '_blank');

            alert("응답: " + response);
        },
        error: function(xhr, status, error) {
            alert("에러: 이메일이 맞지 않습니다.");

        }
    });
}
