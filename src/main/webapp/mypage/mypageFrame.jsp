<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>



<div id="mypageContent">
	<div id="profile_userIntro">
		<div id="profileSet">
			<div class="profile"></div>
			<br>
			<button type="button" id="changeProfileImg">프사변경</button>
		</div>

		<div id="userIntro">
			<div id="userIntroContent">
				<strong>이름:</strong> &emsp14;홍길동<br> <strong>등급:</strong>
				&emsp14;travelKing<br> <strong>아이디:</strong> &emsp14;hong1234<br>
				<strong>이메일:</strong> &emsp14;hong1234@naver.com<br> <strong>가입일:</strong>
				&emsp14;2024.03.08<br> <strong>작성한 글:</strong> &emsp14;5개
				
				<div class="btnRight">
					<input type="button" onclick="location.href='/miniProject/mypage/memberUpdate.jsp'" value="회원정보 수정" class="mypageChangeBtn">		
				</div>
			</div>
		</div>
		
	</div>

	<div id="boxes">
		<div class="contentBox" id="contentBox1">
			<div class="boxContent">
				<div id="box1ContentImg"></div>
				<strong>나의 대표 글</strong><br> <br>
				<div id="box1Content">
					<div id="box1Img"></div>
					<div id="box1Txt">
						대표글 변경 버튼 누르지 마세요. 
					</div>
				</div>
			</div>
			<div class="btnRight">
				<input type="button" onclick="location.href='/miniProject/mypage/myBoard.jsp'" value="대표글 변경" class="mypageChangeBtn">		
			</div>
		</div>
		
		<div style="height: 30px; background-color: white;"></div>
		<div class="contentBox">
			<div class="boxContent">
				<div id="box2Content">
					<strong>나의 캘린더</strong><br> <br>
					<div id="myCalendarImg">
						<div id="datepicker"></div>
						<div class="vertical-container">
							<div id="selectDate">
							선택한 날짜:
							</div><br>
							<div id="myCalendarTxt">
								홍길동님의 가장 가까운 일정은 <br><b>2024년 03월 13일 목요일</b>에
								예정되어있습니다.<br>예정된 행사는 <b>벚꽃놀이</b>입니다.<br> 즐거운 일정 되시길 바랍니다.
							</div>
						</div>
					</div>
					<!--캘린더 끝-->
					
					<div class="btnRight">
						<input type="button" onclick="location.href='/miniProject/mypage/memberCalendar.jsp'" value="캘린더 수정" class="mypageChangeBtn">		
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

