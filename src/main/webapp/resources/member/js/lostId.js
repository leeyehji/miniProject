$(document).ready(function() {
    $("#lostId").click(function(e) {
        e.preventDefault();
        var memberRequestDTO = {
            MEM_NAME: $("#MEM_NAME").val(),
            MEM_EMAIL: $("#MEM_EMAIL").val()
        };
        console.log("11111111")

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/member/lostId",
            data: JSON.stringify(memberRequestDTO),
            dataType: "text", // 서버로부터 반환되는 데이터 타입
            success: function(result) {
                $("#result").html(result);
                console.log("가나다라")
            },
            error: function(e) {
                console.error("ERROR : ", e);
                $("#result").html("서버 처리 중 오류가 발생했습니다.");
            }
        });
    });
});