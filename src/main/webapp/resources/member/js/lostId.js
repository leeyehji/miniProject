$(document).ready(function() {
    function findId() {
        var mem_name = $('#MEM_NAME').val(); // 입력된 이름 가져오기
        var mem_email = $('#MEM_EMAIL').val(); // 입력된 이메일 가져오기
console.log("111111");
        // 입력값 검증
        if (!mem_name) {
            alert('이름을 입력해주세요.');
            $('#MEM_NAME').focus();
            return;
        }
        if (!mem_email) {
            alert('이메일을 입력해주세요.');
            $('#MEM_EMAIL').focus();
            return;
        }

        // AJAX 요청
        $.ajax({
            url: '/member/lostId', // 서버의 엔드포인트 URL
            type: 'POST',
            contentType: 'application/json', // 데이터가 JSON 형식임을 명시
            data: JSON.stringify({ // JavaScript 객체를 JSON 문자열로 변환
                MEM_NAME: MEM_NAME,
                MEM_EMAIL: MEM_EMAIL
            }),
            success: function(response) {
                // 서버로부터 응답을 받았을 때 실행될 콜백 함수
                alert('귀하의 아이디는 ' + response + '입니다.');
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때 실행될 콜백 함수
                alert('아이디 찾기에 실패했습니다. 다시 시도해주세요.');
            }
        });
    }

    // 클릭 이벤트 리스너 등록
    $('.signup_btn').click(findId);
});
