<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="../css/frame.css">
<link rel="stylesheet" type="text/css" href="../css/myCalendarWrite.css">
    <link rel="stylesheet" href="path/to/datepicker.css">
<script src="path/to/datepicker.min.js"></script>
</head>
<body>
 <header><jsp:include page="../frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        <div id="content">
        
        <form id="myCalendarWrite" name="myCalendarWrite">
        <div id="selectDateCalendar">
            	<p>일정 날짜를 선택해주세요.</p>
            	<div class="selectDate">
            		<p>시작일:</p>
            		<div id="startDate"></div>
            		<input type="button" value="시작일 입력" id="startCalendar">
            	</div>
            	<div class="selectDate">
            		종료일
            		<div id="endDate"></div>
            	</div>
            </div>
            
            <div id="wirteCalendarTitle">일정 제목을 입력해주세요</div>
            <input type="text" id="CalendarTitle">
            
            <div id="wirteCalendarContent">일정 내용을 입력해주세요</div>
            <textarea id="CalendarContent" cols="10"rows="20"></textarea>
            
            <input type="button" value="제출하기">
        </form>
           
        </div>
    </div>
    <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    <footer><jsp:include page="../frame/footer.jsp"></jsp:include></footer>
<div id="bottom"></div>
</body>

<script src="../js/frame.js"></script>
<script src="../js/header.js"></script>
<script src="../js/footer.js"></script>
<script src="../js/myCalendarWrite.js"></script>
</html>