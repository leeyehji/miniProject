$(function(){
	
	/* 캘린더 기본 세팅 */
	$("#datepickerStart").datepicker({
		changeMonth:true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		dateFormat: 'yy년 mm월 dd일',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		
		showButtonPanel: true,
		currentText: '오늘 날짜',
		closeText: '닫기',
		
		minDate: -100,	/* 현재날짜로부터 100일전까지만 선택 가능. */
		maxDate: "+120D"/* 현재날짜로부터 120일 후까지만 선택 가능. */
		
	}); //startDay
	
	$("#datepickerEnd").datepicker({
		changeMonth:true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		dateFormat: 'yy년 mm월 dd일',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		
		showButtonPanel: true,
		currentText: '오늘 날짜',
		closeText: '닫기',
		
		minDate: -100,	/* 현재날짜로부터 100일전까지만 선택 가능. */
		maxDate: "+120D"/* 현재날짜로부터 120일 후까지만 선택 가능. */
		
	}); //endDay
	
	/* 후기 글 주소 입력 */
	$('#selectReview').click(function(){
		//작성자의 글 목록 제목만 출력
		//var seq= ;
		
		//input text 이므로 기본적으로는 우리 사이트 글만 링크 저장되나 타 사이트 주소도 업로드는 가능함.
		//$('#reviewSeq').html('<a href="/miniProject/review/review.jsp?seq="'+seq+'">'+seq+'</a>"');
	});//#selectReview.click
	
	/* form 제출 */
	$('#myCalendarWriteFormBtn').click(function(){
		
		
	});//#myCalendarWriteFormBtn.click
	
});