<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/frame.css">
<link rel="stylesheet" type="text/css" href="../css/memberCalendar.css">
    
</head>
<body>
<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        <div id="content">
           
         <div id="scheduleCalendarContent">

            <div id="calendarHeader">
               <h1>
                  <i class="far fa-calendar-check"></i> <span>캘린더</span>
               </h1>
               <div class="calendar_title">
                  <button class="prev">&#60;</button>
                  <span class="current-year-month"></span>
                  <button class="next">&#62;</button>
               </div>
            </div>
            <section class="content-left">
               <div class="left-main">
                  <div class="main-wrap">
                     <div class="main-day"></div>
                     <div class="main-date"></div>
                  </div>
                  <div class="todo-wrap">
                     <div class="todo-title">Schedule List</div>
                     <form class="input-form">
                        <input type="text" placeholder="write here!!" class="input-box" />
                        <button type="submit" class="input-btn clickBtn">INPUT</button>
                     </form>
                     <ul class="todoList"></ul>
                     <div class="showList">
                        <span class="listText"></span> <span class="createDate"></span>
                        <button class="closed">close</button>
                     </div>
                     <div class="bgblack"></div>
                  </div>
               </div>
            </section>
            <section class="content-right">
               <div class="day-of-week">
                  <div class="dayHeader sun">Sun</div>
                  <div class="dayHeader">Mon</div>
                  <div class="dayHeader">Tue</div>
                  <div class="dayHeader">Wed</div>
                  <div class="dayHeader">Thu</div>
                  <div class="dayHeader">Fri</div>
                  <div class="dayHeader sat">Sat</div>
               </div>
               <div class="calendar-body"></div>
            </section>

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

<script src="../js/frame.js"></script>
<script src="../js/header.js"></script>
<script src="../js/footer.js"></script>
<script src="../js/memberCalendar.js"></script>
</body>
</html>