$(function(){
	
	/* 캘린더 기본 세팅 */
	$("#startDate").datepicker({
		changeMonth:true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		dateFormat: 'yy-mm-dd',
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
	
	$("#endDate").datepicker({
		changeMonth:true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		dateFormat: 'yy-mm-dd',
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
	
	/** form 제출 */
	$('#myCalendarWriteFormBtn').click(function(){
		/*유효성 검사*/
		var s_dateString = $('#startDate').val(); // "yy-mm-dd" 형식의 문자열
		var s_timeString = $('#startTime').val(); //hh:mm:ss 미 입력시 00:00:00
		var s_dateTimeString = s_dateString + ' ' + s_timeString;
		var s_timestamp = Date.parse(s_dateTimeString);
		var startObject = new Date(s_timestamp);
		
		var e_dateString = $('#endDate').val(); 
		var e_timeString = $('#endTime').val(); 
		s_dateString = new Date();
		var e_dateTimeString = (e_dateString) + ' ' + (e_timeString || "00:00:00");
		var e_timestamp = Date.parse(e_dateTimeString);
		var endObject = new Date(e_timestamp);
		if(endObject == "Invalid Date"){
			endObject = new Date(startObject);
			// 종료 날짜에 1일을 더함
			endObject.setDate(endObject.getDate() + 1);
		}
		//console.log("시작시간: "+startObject+"\n종료시간:"+endObject);
		
		/*일정 시작일보다 일정 마감일이 빠른 경우 */
		if( startObject > endObject   ){
			$('.plzRewrite').html("시작일은 반드시 종료일보다 빨라야합니다!");
			
		/*제목을 안 넣은 경우*/
		}else if( $('#calTitle').val() =="" ){
			$('.plzRewrite').html("일정 제목은 꼭 있어야 합니다!");
		/*DB에 넣기*/
		}else
			$.ajax({
				type: 'POST'
				,url:'/mypage/calWrite'
				/*,data: $('#myCalendarWrite').serialize()*/
				,data:{'cal_startDate' : startObject
						,'cal_endDate': endObject
						,'cal_title' : $('#calTitle').val()
						,'cal_memo' : $('#calContent').val()
						,'cal_color' : $('input[name=color]:checked').val()
						,'cal_boardNo' : $('#reviewSeq').val()
				}
				,success:function(todoList){
					//alert(todoList);
					location.href='/mypage/myCalendar';
				}, error: function(xhr, status, error){
	    			console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
	            }
			});//ajax
		
	});//#myCalendarWriteFormBtn.click
	
});