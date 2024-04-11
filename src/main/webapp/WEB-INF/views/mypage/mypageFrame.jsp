<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>



<div id="mypageContent">
	<div id="profile_userIntro">
		<div id="profileSet">
			<div class="profile"></div>
			
			<br>
			<form  id="uploadProfile" name="uploadProfile" enctype="multipart/form-data">
				<div class="filebox">
				    <input type="file" id="changeProfileImg" accept="image/*">
					<label for="changeProfileImg">프로필 변경</label> 
				</div>
			</form>
			<button id="defaultProfile">프로필 삭제</button>
		</div>

		<div id="userIntro">
			<div id="userIntroContent">
				<strong>아이디:</strong> &emsp14;<p id="memId">hong</p><br> 
				<strong>이름:</strong>&emsp14;<p id="memName"></p><br> 
				<strong>전화번호:</strong> &emsp14;<p id="memPhone"></p><br>
				<strong>이메일:</strong> &emsp14;<p id="memEmail"></p><br> 
				<Strong>성별</Strong>&emsp14;<p id="memGender"></p><br>
				<strong>가입일:</strong>&emsp14;<p id="memJoinDate"></p> 
								
				<input type="button" onclick="location.href='/mypage/memberUpdate'" value="회원정보 수정" id="mypageChangeBtn" class="mypageChangeBtn">		
				
				
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
				<input type="button" onclick="location.href='/mypage/myBoard'" value="대표글 변경" class="mypageChangeBtn">		
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
							<div id="selectDate">선택한 날짜: </div><br>
							
							<div id="myCalendarTxt">
								<table id="myCalTable">
									<!-- 동적 추가 -->
								</table>
								
							</div>
						</div>
					</div>
					<!--캘린더 끝-->
					
					<div class="btnRight">
						<input type="button" onclick="location.href='/mypage/myCalendar'" value="캘린더 수정" class="mypageChangeBtn">		
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

