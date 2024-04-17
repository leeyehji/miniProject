    //
    //     $(document).ready(function() {
    //     $('#emailCheckButton').click(function() {
    //         var mem_email = $('#mem_email').val();
    //         $.ajax({
    //             url: '/member/emailCheck',
    //             type: 'POST',
    //             contentType: 'application/json',
    //             data: JSON.stringify({ mem_email: email }),
    //             dataType: 'json',
    //             success: function(response) {
    //                 if(response.status === 'true') {
    //                    alert("이미 사용 중인 이메일입니다.");
    //                 } else {
    //                   alert("사용 가능한 이메일입니다.");
    //                 }
    //             },
    //             error: function(request, status, error) {
    //                 alert("요청에 실패했습니다. 다시 시도해주세요.");
    //                 console.log("Request: " + request.toString() + ", Status: " + status + ", Error: " + error.toString());
    //             }
    //         });
    //     });
    // });