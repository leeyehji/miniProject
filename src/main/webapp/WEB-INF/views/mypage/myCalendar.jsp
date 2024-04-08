<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<!-- full calnedar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- frame css -->
<link rel="stylesheet" type="text/css" href="/miniprojectMaven/frame/css/frame.css">

<!-- myCalendar.js, css	(Update, Delete, List) -->
<script src="/miniprojectMaven/mypage/js/myCalendar.js"></script>
<link rel="stylesheet" type="text/css" href="/miniprojectMaven/mypage/css/myCalendar.css">

<!-- myCalendarWrite js, modal css (Write)-->
<script src="/miniprojectMaven/mypage/js/myCalendarWrite.js"></script>
<link rel="stylesheet" type="text/css" href="/miniprojectMaven/mypage/css/myCalendarWrite.css">


</head>
<body>
<div id="calModal">
				<div id="calModalCon">
					<h1>일정 관리</h1>
					<form id="myCalendarWrite" name="myCalendarWrite">
					    <div class="selectDateCalendar">
					        <p class="plzRewrite">일정 날짜를 선택해주세요.</p>
					        <div class="selectDate">
					            시작일: <input type="text" name="startDate" id="startDate"> 
					            <input id="startTime" name="startTime" type="time">
					            <br>종료일: <input type="text" name="endDate" id="endDate"> 
					            <input id="endTime" name="endTime" type="time">
					        </div>
					    </div>
			    
					    <div id="chooseColor">
					    	일정 표시 색상 3가지 중 하나를 골라주세요.
					    	<input type="radio" name="color" value="#EA9A95" id="red">
					    	<label for="red">빨간색</label>
					    	<input type="radio" checked name="color" value="#8B93FF" id="blue">
					    	<label for="blue">파란색</label>
					    	<input type="radio" name="color" value="#A1EEBD" id="green">
					    	<label for="green">초록색</label>
					    	<input type="radio" name="color" value="#FFD98C" id="yellow">
					    	<label for="yellow">노란색</label>
					    </div>
			    
					    <div id="wirteCalendarTitle">일정 제목을 입력해주세요</div>
					    <input type="text" name="calTitle" id="calTitle">
					    <div id="wirteCalendarContent">일정 내용을 입력해주세요</div>
					    <textarea id="calContent" rows="5" name="calContent"></textarea>
			    
					    <div id="wirteCalendarTitle">작성한 후기 주소를 넣어주세요</div>
					    <input type="button" value="후기글 선택" id="selectReview">
					    <input type="text" name="reviewSeq" id="reviewSeq" >
					    <div class="btnRight">
					        <input type="button" onclick="window.location.reload()" class="resetBtn" value="작성 취소">
					        <input type="button" id="myCalendarWriteFormBtn" value="제출하기">
					    </div>
					</form>
				</div>
			</div>
	
			<div id="calModalUpdate">
				<div id="calModalConUpdate">
					<h1>일정 관리</h1>
					<form id="myCalendarUpdate" name="myCalendarUpdate">
					    <div class="selectDateCalendar">
					        <p class="plzRewrite">일정 날짜를 선택해주세요.</p>
					        <div class="selectDate">
					            시작일: <input type="text" name="startDateUpdate" id="startDateUpdate"> 
					            <input id="startTimeUpdate" name="startTimeUpdate" type="time">
					            
					            <br>종료일: <input type="text" name="endDateUpdate" id="endDateUpdate"> 
					            <input id="endTimeUpdate" name="endTimeUpdate" type="time">
					        </div>
					    </div>
			    
					    <div class="chooseColor">
					    	일정 표시 색상 3가지 중 하나를 골라주세요.
					    	<input type="radio" name="colorUpdate" value="#EA9A95" id="redUpdate">
					    	<label for="red">빨간색</label>
					    	<input type="radio" checked name="colorUpdate" value="#8B93FF" id="blueUpdate">
					    	<label for="blue">파란색</label>
					    	<input type="radio" name="colorUpdate" value="#A1EEBD" id="greenUpdate">
					    	<label for="green">초록색</label>
					    	<input type="radio" name="colorUpdate" value="#FFD98C" id="yellowUpdate">
					    	<label for="yellow">노란색</label>
					    </div>
			    
					    <div id="updateCalendarTitle">일정 제목을 입력해주세요</div>
					    <input type="text" name="calTitle" id="calTitleUpdate">
					    <div id="updateCalendarContent">일정 내용을 입력해주세요</div>
					    <textarea id="calContentUpdate" rows="5" name="calContentUpdate"></textarea>
					    
					    <div id="updateReviewTitle">작성한 후기 주소를 넣어주세요</div>
					    <input type="button" value="후기글 선택" id="selectReviewUpdate">
					    <input type="text" name="reviewSeq" id="reviewSeqUpdate" >
					    <div class="btnRight">
					        <input type="button" onclick="window.location.reload()" class="resetBtn" value="작성 취소">
					        <input type="button" id="myCalendarUpdateFormBtn" value="수정하기">
					        <input type="button" id="myCalendarDeleteBtn" value="삭제하기">
					    </div>
					</form>
				</div>
			</div>
	<header><jsp:include page="../frame/header.jsp"></jsp:include></header>
	<div id="frameContent">
    	<div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        
        <div id="content">
		
	
			<!-- <input value="작성하기" type="button" onclick="location.href='/miniprojectMaven/user/myCalendarWrite'">

			<hr>
			<p>캘린더</p>-->
			<div id='calendar'></div>
			
		</div><!-- content -->
	</div><!-- frameContent -->
    
    <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    
    <footer><jsp:include page="../frame/footer.jsp"></jsp:include></footer>
	<div id="bottom"></div>
</body>

<script src="/miniprojectMaven/frame/js/frame.js"></script>

</html>