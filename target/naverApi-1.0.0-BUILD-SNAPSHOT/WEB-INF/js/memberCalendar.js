$.datepicker.setDefaults({
    dateFormat: 'yy년 mm월 dd일',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$(document).ready(function() {
    var today = new Date();
    var dayOfWeek = today.toLocaleString('ko-KR', { weekday: 'long' });
    var formattedDate = today.getDate().toString().padStart(2, '0');
    $("#selectWeek").text(dayOfWeek); // 페이지 로드 시 오늘의 요일을 표시
	$("#selectDay").text(formattedDate);
    
    $('#returnTodayBtn').click(function() {
    	location.reload();
	});
    
    $("#datepicker").datepicker({
        defaultDate: today, // 오늘 날짜를 기본값으로 설정
        onSelect: function(dateText, inst) {
            var date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay);
            var dayOfWeek = date.toLocaleString('ko-KR', { weekday: 'long' });
            var formattedDay = dayOfWeek;
            var formattedDate = date.getDate().toString().padStart(2, '0');
            
            console.log("선택된 날짜: " + dateText + " / 요일: " + formattedDay + " / 일자: " + formattedDate);
            
            $("#selectWeek").text(formattedDay);
            $("#selectDay").text(formattedDate);
        }
    });
});
