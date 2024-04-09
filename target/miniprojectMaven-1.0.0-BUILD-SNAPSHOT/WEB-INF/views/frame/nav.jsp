<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<ul id="nadeuliNav">
	<li><a href="/miniProject/mainpage.jsp">홈</a></li>
	<br>

	<li>지역별여행
		<ul class="nav-content">
			<li><a href="/miniProject/map/map.jsp">지도</a></li>
		</ul>
	</li>
	<br>

	<li>테마여행
		<ul class="nav-content">
			<li><a href="/miniProject/thema/themaBoardList.jsp">테마여행 소개</a></li>
		</ul>
	</li>
	<br>
	
	<li>후기
		<ul class="nav-content">
			<li><a href="#">여행 후기</a>
				<ul>
					<li><a href="/miniProject/review/reviewList.jsp">후기 목록</a></li>
					<li><a href="/miniProject/review/reviewWrite.jsp">후기 쓰기</a></li>
				</ul>
			</li>


		</ul>
	</li>
	<br>


	<li>고객센터
		<ul class="nav-content">
			<li><a href="/miniProject/serviceCenter/serviceCenter.jsp">고객센터</a>
				<ul>
					<li><a href="serviceCenter.jsp#notice">공지사항</a></li>
					<li><a href="serviceCenter.jsp#inquiry">1 : 1 문의</a></li>
					<li><a href="serviceCenter.jsp#faq">F A Q</a></li>
				</ul>
			</li>
		</ul>
	</li>
	<br>
	<li>마이페이지
		<ul class="nav-content">
			<li><a href="/mypage/mypage.jsp">회원정보관리</a>
				<ul>
					<li><a href="/miniProject/mypage/memberUpdate.jsp">회원정보 수정</a></li>
					<br>
					<li><a href="#">내가 쓴 글</a></li>
					<br>
					<li><a href="#">내가 좋아요한 글</a></li>
					<br>
				</ul>
			</li>
			<br>
			<li><a href="/mypage/myCalendar">나의 일정 관리</a>
				<ul>
					<li><a href="#">캘린더 보기</a></li>
					<br>
					<li><a href="/miniProject/mypage/myCalendarWrite.jsp">캘린더 작성하기</a></li>
					<br>
					<li><a href="#">캘린더 수정하기</a></li>
					<br>
				</ul>
			</li>
		</ul>
	</li>
</ul>
