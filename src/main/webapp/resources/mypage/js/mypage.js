
$(function(){
	/* 프로필 사진 출력 */
	//$('#changeProfileImg').css();
	/* 프로필 사진 변경 */
	$('#changeProfileImg').click(function(){
		//사진 선택 - DB저장 - 페이지 새로고침
		//DB저장
		
		//페이지 새로고침
		location.href='/miniProject/mypage/mypage.jsp';
	});//changeProfileImg.click
		
	/* 유저 정보 불러오기 */
	//$('#userIntroContent).html();//DB에서 꺼내와서 동적 작동.
		
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
	
	/* 캘린더 선택 */
	$("#datepicker").datepicker({
       	onSelect: function(dateText) {
           	$("#selectDate").text("선택한 날짜: " + dateText);
           	
           	//선택한 날짜의 일정 출력
           	//$('#myCalendarTxt').text("일정:");//+DB에서 빼온 일정
       	}
    });//datepicker #selectDate
});//function()
