
$(document).ready(function() {
    // 아이디 유효성 검사
    $("#MEM_ID").blur(function() {
        var MEM_ID = $(this).val();
        if(MEM_ID === '') {
            $('#id-dup-result').text('아이디를 입력해주세요.');
        } else if(MEM_ID.length <= 6) {
            $('#id-dup-result').text("아이디의 길이를 6자 이상 사용하세요");
        } else {
            $('#id-dup-result').text('');
        }
    });

    // 비밀번호 유효성 검사
    $("#MEM_PW").blur(function() {
        var MEM_PW = $(this).val();
        if(MEM_PW === '') {
            $('#passwordError').text('비밀번호가 비어 있습니다.');
        } else {
            $('#passwordError').text('');
        }
    });

    // 비밀번호 확인 일치 검사
    $("#MEM_PW_CH").blur(function() {
        var MEM_PW = $("#MEM_PW").val();
        var MEM_PW_CH = $(this).val();
        if(MEM_PW !== MEM_PW_CH) {
            $('#passwordError').text('비밀번호가 일치하지 않습니다.');
        } else {
            $('#passwordError').text('');
        }
    });

    // 이름 유효성 검사
    $("#MEM_NAME").blur(function() {
        var MEM_NAME = $(this).val();
        var englishCheck = /[a-zA-Z]/; // 영문자를 확인하기 위한 정규 표현식

        if(MEM_NAME === '') {
            $('#nameError').text('이름을 입력해주세요.');
        } else if(MEM_NAME.length <= 2) {
            $('#nameError').text('이름은 두 글자 이상이어야 합니다.');
        } else if(englishCheck.test(MEM_NAME)) { // 영문자가 포함되어 있는지 확인
            $('#nameError').text('이름에 영문자를 사용할 수 없습니다.');
        } else {
            $('#nameError').text('');
        }
    });

    // 전화번호 유효성 검사
    $("#MEM_PHONE").blur(function() {
        var MEM_PHONE = $(this).val();
        var phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if(MEM_PHONE === '') {
            $('#phoneError').text('전화번호를 입력해주세요.');
        } else if(!phoneRegex.test(MEM_PHONE)) {
            $('#phoneError').text('올바른 전화번호 형식으로 입력해주세요. 예) 010-1111-2222');
        } else {
            $('#phoneError').text('');
        }
    });

    // 이메일 유효성 검사
    $("#MEM_EMAIL").blur(function() {
        var MEM_EMAIL = $(this).val();
        if(MEM_EMAIL === '') {
            $('#emailError').text('이메일을 입력해주세요.');
        } else {
            $('#emailError').text('');
        }
    });
});


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
            window.location.href = "/member/loginForm";
        },
        error: function(xhr, status, error) {

        }
    });
}
