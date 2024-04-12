/**캘린더 초기화*/


document.addEventListener('DOMContentLoaded', function() {

	$(function(){
		//로그인이 안되어 있다면
		//console.log($('#memId').text());
		/*if( $('#memId').text() === '' ){
        	location.href='/mypage/plzLogin';
    	}*/
		
		$("#startDateUpdate").datepicker({
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
		$("#endDateUpdate").datepicker({
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
	
	
		function fMClose() { //modal 닫기
		    $('#calModal').style.display = "none";
		}

		var request = $.ajax({
							url:'/mypage/calList'
							,dataType: 'json'
							,method: 'post'
						});//ajax
						
		request.done(function(data){
			console.log(data);
			
			var calendarEl = document.getElementById('calendar');
			
			/*색상*/
			var bluee ='#A0E3F2';
			var skybluee='378CE7';
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '1000px'
				,expandRows: true	//화면에 맞게 높이 재설정
				
				,locale: 'ko'
				,timeZone:'Asia/Seoul'
				
				,headerToolbar: {	//header에 출력할 것 선택
					left:'prev,today'
					,center:'title'
					,right: 'dayGridMonth,timeGridWeek,listWeek,timeGridDay,next'
				}
			
				,dayMaxEvents: true 	//이벤트 너무 길면 잘라. more 클릭 시 잘린 이벤트 보여줌. 높이 제한 = 셀 높이가 default.
	          
				,selectable: true	
				,editable: false		//수정 가능
				,navLinks: true			//요일이나 날짜 클릭 시 주나 일 단위 달력으로 보여줌
				
				
				,select: function(info){//write
					//22~23 선택시 22~24 00:00으로 계산하므로 22~24 출력.
					console.log('selected from '+ info.startStr + ' to ' + info.endStr);
					//console.log(info.start+' '+info.end);
					
					$('#startDate').val(info.startStr);
				    $('#endDate').val(info.endStr);
				
				    $('#calModal').css("display", "block");
					
				},eventClick: function(info){
					// 모든 라디오 버튼을 선택
				    var colorRadios = document.querySelectorAll('input[name="colorUpdate"]');
				    
				    // 각 라디오 버튼을 순회하며 이벤트의 backgroundColor와 일치하는지 확인
				    colorRadios.forEach(function(radio) {
				        if (radio.value == info.event.backgroundColor) {
				            radio.checked = true; // 일치하는 경우, 해당 라디오 버튼을 선택
				        }
				    });
					
					console.log(info);
					
					var events = [];
					        var obj = {
					            cal_title: info.event._def.title,
					            cal_no : info.event.id,
					            cal_memo: info.event.extendedProps.description,
					            cal_startDate: info.event._instance.range.start,
					            cal_endDate: info.event._instance.range.end,
					            cal_color:  info.event.backgroundColor
					        };
                    events.push(obj);
 					console.log(events);
					
					var startDate = new Date(info.event._instance.range.start).toISOString().split('T')[0];
					$('#startDateUpdate').val(startDate);//2024-04-02T00:00:00+09:00 ->2024-04-02
					var startTime = new Date(info.event._instance.range.start).toISOString().split('T')[1].substring(0, 5);;
					$('#startTimeUpdate').val(startTime);//오전 00:00
				    var endDate = new Date(info.event._instance.range.end).toISOString().split('T')[0];
				    $('#endDateUpdate').val(endDate);
				    var endTime = new Date(info.event._instance.range.end).toISOString().split('T')[1].substring(0, 5);;
				    $('#endTimeUpdate').val(endTime);
				    
				    $('#calTitleUpdate').val(info.event._def.title);
					$('#calContentUpdate').val(info.event.extendedProps.description);
					$('#calModalUpdate').css("display", "block");
					
					//delete
					$('#myCalendarDeleteBtn').click(function(){
						if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까?")){
	                    	info.event.remove();
							$(function deleteData() {
	                        	$.ajax({
	                            	url: "/mypage/calDelete",
	                                method: 'post',
	                                dataType: 'json',
	                                data: JSON.stringify(events),
	                                contentType: 'application/json',
	                            });//ajax
	                        })//deleteData
	                        
	                        window.location.reload();
	                   }//if confirm delete
					});//click.DeleteBtn
					
					//update
					$('#myCalendarUpdateFormBtn').click(function(){
						/*유효성 검사*/
						var s_dateString = $('#startDateUpdate').val(); // "yy-mm-dd" 형식의 문자열
						var s_timeString = $('#startTimeUpdate').val(); //hh:mm:ss 미 입력시 00:00:00
						var s_dateTimeString = s_dateString + ' ' + s_timeString;
						var s_timestamp = Date.parse(s_dateTimeString);
						var startObject = new Date(s_timestamp);
						
						var e_dateString = $('#endDateUpdate').val(); 
						var e_timeString = $('#endTimeUpdate').val(); 
						s_dateString = new Date();
						var e_dateTimeString = (e_dateString) + ' ' + (e_timeString || "00:00:00");
						var e_timestamp = Date.parse(e_dateTimeString);
						var endObject = new Date(e_timestamp);
						if(endObject == "Invalid Date"){
							endObject = new Date(startObject);
							// 종료 날짜에 1일을 더함
							endObject.setDate(endObject.getDate() + 1);
						}
	 					/*일정 시작일보다 일정 마감일이 빠른 경우 */
						if( startObject > endObject   ){
							$('.plzRewrite').html("시작일은 반드시 종료일보다 빨라야합니다!");
							
						/*제목을 안 넣은 경우*/
						}else if( $('#calTitleUpdate').val() =="" ){
						$('.plzRewrite').html("일정 제목은 꼭 있어야 합니다!");
						
						/*DB에 넣기*/
						}else
							$.ajax({
	                           	url: "/mypage/calUpdate",
	                            method: 'post',
	                            data: {
	                            	'cal_startDate' : startObject
									,'cal_endDate': endObject
									,'cal_title' : $('#calTitleUpdate').val()
									,'cal_memo' : $('#calContentUpdate').val()
									,'cal_no': info.event.id
									,'cal_color' : $('[name=colorUpdate]:checked').val()
									,'cal_boardNo' : $('#reviewSeqUpdate').val()
	                            },success:function(todoList){
									//alert(todoList);
									location.href='/mypage/myCalendar';
								}, error: function(xhr, status, error){
					    			console.error("Status: " + status + ", Error: " + error + ", Response: " + xhr.responseText);
					            }
	                            
	                        });//ajax                    
	                    
					});//click.updateBtn
				}//clickEvent
				
				,eventMouseEnter: function(info){	// <-> eventMouseLeave
					if(info.event.extendedProps.description != ''){
						tippy(info.el,{
								content: info.event.extendedProps.description
						});
					}
				}
				
				,events:data
				
			});//newFullCanlendar
			calendar.render();
		});//request.done
		
		request.fail(function(jqXHR, textStatus){
			alert("Request failed: "+textStatus);
		});//request.fail
	});//function
});//document.addEventListener
