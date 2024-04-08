<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="../../resources/frame/css/frame.css">
<link rel="stylesheet" type="text/css" href="../../resources/mypage/css/memberCalendar.css">
<script src="../../resources/mypage/js/memberCalendar.js"></script>
</head>
<body>
<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        <div id="content">
        		<!-- <div id="calendarPageTitle">캘린더</div> -->
        
           <div id="myCalendar">
						<div class="vertical-container">
						<div id="calendarPageTitle">캘린더</div>
						<div id="selectDate">
						<div id="selectWeek">
						선택한 요일
						</div>
						<div id="selectDay">
						선택한 일
						</div>
						</div>
						
			
						<div id="todoList">
						<div id="schedule">Schedule List</div>
						<div id="todoListTitle">
							일정 제목입니다.
						</div>
						<div id="todoListContent">
							일정 내용입니다. 잘 해봅시다.
						</div>
						
						<div id="returnToday">
							<input type="button" id="returnTodayBtn" value="오늘 날짜">
						</div>
						</div>
						
						</div>
						<div id="datepicker"></div>
						
					</div>
         
      </div>
   </div>
       
    <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    <footer><jsp:include page="../frame/footer.jsp"></jsp:include></footer>
<div id="bottom"></div>
</body>

<script src="../../resources/frame/js/frame.js"></script>
<script src="../../resources/frame/js/header.js"></script>
<script src="../../resources/frame/js/footer.js"></script>

</body>
</html>