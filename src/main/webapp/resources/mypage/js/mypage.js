
$(function(){
	/* 프로필 사진 출력 */
	//$('#changeProfileImg').css();
	/* 프로필 사진 변경 */
	$('#changeProfileImg').click(function(){
		//사진 선택 - DB저장 - 페이지 새로고침
		//DB저장
		
		//페이지 새로고침
		location.href='/mypage/mypage';
	});//changeProfileImg.click
		
	/* 유저 정보 불러오기 */
	$.ajax({
		type:'post'
		,url:'/mypage/getUser'
		,data: {memId: $('#memId').text()}		//아이디를 보내서.
		,dataType: 'json'
		,success: function(memberDTO){			
			$('#memName').html(memberDTO.mem_name);	//이를 웹에 출력 
			$('#memPhone').html(memberDTO.mem_phone);
			$('#memEmail').html(memberDTO.mem_email);
			$('#memJoinDate').html(memberDTO.mem_joinDate);
			if(memberDTO.mem_gender == 0)
            	$('#memGender').html('남성');
			else
            	$('#memGender').html('여성');
		},error:function(xhr, status, error){
			console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	    }
	});//ajax
		
	/* 대표글 불러오기 */
	//$('#box1Img').html();//대표글 이미지 DB에서 가져오기
	//$('#box1Txt').html();//대표글 요약문
	
	
	/* 캘린더 출력만. */
	$.datepicker.setDefaults({
	        dateFormat: 'yy년 mm월 dd일',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	});//datepicker.setDefault
	
	/* yyyy년 MM월 dd일 -> yyyy-MM-dd*/
	function convertDateFormat(dateText) {
	    const regex = /(\d{4})년 (\d{2})월 (\d{2})일/;
	    const match = regex.exec(dateText);
	    if (match) {
	        return `${match[1]}-${match[2]}-${match[3]}`;
	    } else {
	        return null;
	    }
	}

	/* 캘린더 선택 */
	$("#datepicker").datepicker({
       	onSelect: function(dateText) {///yyyy년 MM월 dd일
           	$("#selectDate").text("선택한 날짜: " + dateText);
           	
           	//선택한 날짜의 일정 출력
           	$('#myCalTable').html('');
           	const selectedDate = convertDateFormat(dateText);// yyyy-MM-dd 형식으로 변환
           	console.log(selectedDate);
           	$.ajax({
           		type:'post'
           		,url:'/mypage/myCalendarTxt'
           		,dataType:'json'
           		,contentType:'application/json'
           		,data: JSON.stringify({
			        memId: $('#memId').text(),
			        selectedDate: selectedDate
			    }),success:function(data){
			    	$.each(data, function(index, calDTO){//css 조정!
			    		var result=`<tr><th colspan="2">`
			    					+`<div class="calTitle">제목:`+calDTO.title+`</div>`
				    				+`</th></tr>`
				    				+`<tr><td>`
				    					+`<div class="calDate" style="margin-right:15px">시작일:`+calDTO.start+`</div>`
				    				+`</td>`
				    				+`<td>`
				    					+`<div class="calDate">종료일:`+calDTO.end+`</div>`
				    				+`</td></tr>`
				    				+`<tr><td colspan="2">`
				    					+`<div class="schedule">일정: `+calDTO.description+`</div>`
				    				+`</td></tr>`;
			    		$('#myCalTable').append(result);
			    	});
			    				    	
           		},error:function(xhr, status, error){
				console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	    		}
           	});//ajax
     
       	}
    });//datepicker #selectDate
    
    
});//function()
