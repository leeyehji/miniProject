/* 회원정보 수정 */
$(function(){
	console.log($('#updateId').val());

	$.ajax({
		type:'post'
		,url:'/mypage/getUser'
		,data: {memId: $('#updateId').val()}		//아이디를 보내서.
		,dataType: 'json'
		,success: function(memberDTO){			
			$('#updateName').val(memberDTO.mem_name);	//이를 웹에 출력 
			$('#updateTel').val(memberDTO.mem_phone);
			$('#updateEmail').val(memberDTO.mem_email);
			if(memberDTO.mem_gender == 0)
            	$('#updateMale').prop('checked', true);
			else
            	$('#updateFemale').prop('checked', true);
		},error:function(xhr, status, error){
			console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	    }
	});//ajax

	// 핸드폰 번호 형식 정규식
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
    // 이메일 형식 정규식
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/; 
        
	$('#updateSubmit').click(function(){
		//유효성 검사 - not null 확인 | 비번 확인 | 이메일
		if($('#updateName').val() == ''){
			//굳이 한글 이름 형식일 필요가 있을까요?
			// 한글 이름 형식 정규식
        	//const expNameText = /[가-힣]+$/;
			$('#updateNameDiv').html("이름을 입력하세요");
		}else if($('#updatePwd').val() == ''){
			$('#updatePwdDiv').html("비밀번호를 입력하세요.");
		}else if($('#updatePwd').val().length<6 && $('#updatePwd').val().length>20){
			$('#updatePwdDiv').html("올바른 형식의 비밀번호를 입력하세요. 비밀번호는 6자 이상, 20자 이하여야 합니다.");
		}else if($('#updateTel').val() == ''){
			$('#updateTelDiv').html("전화번호를 입력하세요.");
		}else if (!expHpText.test( $('#updateTel').val() )) {
			$('#updateTelDiv').html("올바른 형식의 전화번호를 입력하세요. 예시: 010-1234-5678");
		}else if($('#updateEmail').val() == ''){
			$('#updateEmailDiv').html("이메일을 입력하세요.");
		}else if (!expEmailText.test( $('#updateEmail').val() )){
			$('#updateEmailDiv').html("올바른 형식의 이메일을 입력하세요. 예시: hong1234@naver.com");
		}else if(!$('[name=updateGender]').is(':checked')){
			$('#updateGenderDiv').html("성별을 선택해 주세요.");
		}else if($('#updatePwd').val() != $('#updateRepwd').val() ){
			$('#updatePwdDiv').html("비밀번호가 일치하지 않습니다.");
		}
	    else{
			var genderValue = $('input[name="updateGender"]:checked').val();
	    	var gender = (genderValue === 'male' ? 0 : 1) ; 
	    	
	    	//console.log($('#updateId').val());
	    	//console.log(gender);
	    	
	    	//DB저장
	    	$.ajax({
	    		type: 'POST'
	    		,url: "/mypage/memberUpdateForm"
	    		,data:{
	    			 'mem_id': $('#updateId').val()
	                ,'mem_name': $('#updateName').val()
	                ,'mem_pw': $('#updatePwd').val()
	                ,'mem_phone': $('#updateTel').val()
	                ,'mem_email': $('#updateEmail').val()
	                ,'mem_gender': gender
	    		},success: function(){
	    			//작성완료 - mypage로 이동.
	    			location.href='/mypage/mypage';
	    		},error:function(xhr, status, error){
					console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	            }
	    	});//ajax
	    }//else
	});//updateSubmit.click	
	
});//function

