$(document).ready(function() {
    $("#lostId").click(function(e) {

        // 사용자 입력 값을 변수에 저장합니다.
        var memberRequestDTO = {
            MEM_NAME: $("#MEM_NAME").val(),
            MEM_EMAIL: $("#MEM_EMAIL").val()
        };

        // Ajax 요청을 시작합니다.
        $.ajax({
            type: "POST",
            url: "/member/lostId",
            data: (memberRequestDTO), // JSON 객체를 문자열로 변환하여 전송
            success: function(result) {
                $("#result").html(result); // 성공 시 결과를 #result 요소에 표시
                console.log(result);
                window.location.href="/member/yourId?result=" + encodeURIComponent(result); // 결과를 URL 파라미터로 추가
            },
            error: function(e) {
                console.error("ERROR : ", e);
                $("#result").html("서버 처리 중 오류가 발생했습니다."); // 오류 시 메시지 표시
            }
        });
    });
});
