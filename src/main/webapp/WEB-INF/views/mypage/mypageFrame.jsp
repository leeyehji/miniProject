<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>



<div id="mypageContent">
	<div id="profile_userIntro">
		<div id="profileSet">
			<div class="profile"></div>
			
			<br>
			<div id="horizonBtn">
				<form  id="uploadProfile" name="uploadProfile" enctype="multipart/form-data">
					<div class="filebox">
					    <input type="file" id="changeProfileImg" accept="image/*">
						<label for="changeProfileImg">프로필 사진 변경</label> 
					</div>
				</form>
				<button id="defaultProfile">프로필 사진 삭제</button>
			</div>
		</div>

		<div id="userIntro">
			<div id="userIntroContent">
				
				<!-- <table>
					<tr>
						<th>아이디</th>
						<td><p id="memId">hong</p></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><p id="memName"></p></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><p id="memPhone"></p></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><p id="memEmail"></p></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><p id="memGender"></p></td>
					</tr>
					<tr>
						<th>가입일</th>
						<td><p id="memJoinDate"></p></td>
					</tr>
				</table> -->
				<div class="horizonBox">
					<div class="verticalBox">
						<div>&#9812; 아이디</div>
						<div><p id="memId">hong</p></div>
					</div>
					
					<div class="verticalBox">
						<div>&#9786; 이름</div>
						<div><p id="memName"></p></div>
					</div>
					
					<div class="verticalBox">
						<div>&#9743; 전화번호</div>
						<div><p id="memPhone"></p></div>
					</div>
					
					<div class="verticalBox">
						<div>&#9993; 이메일</div>
						<div><p id="memEmail"></p></div>
					</div>
					
					<div class="verticalBox">
						<div>&#9892; 성별</div>
						<div><p id="memGender"></p></div>
					</div>
					
					<div class="verticalBox" id="lastVerticalBox">
						<div>&#9752; 가입일</div>
						<div><p id="memJoinDate"></p></div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="btnRight">
		<input type="button" onclick="location.href='/mypage/memberUpdate'" value="회원정보 수정" id="mypageChangeBtn" class="mypageChangeBtn">		
	</div>
	

	<div id="boxes">
		<div class="contentBox" id="contentBox1">
			<div class="boxContent">
			
				<div id="box1Content">
					<div class="boxHeader"><strong>나의 대표 글</strong></div>
					<br><br>
					
					<div class="horizonBox">
						<div id="box1Img"></div>
						<div id="box1Txt">
							대표글 변경 버튼 누르지 마세요. 
						</div>
					</div>
					
					<br>
				</div>	
			</div>
		</div>
		<div class="btnRight">
				<input type="button" onclick="location.href='/mypage/myBoard'" value="대표글 변경" class="mypageChangeBtn">		
		</div>
			
		
		<div class="contentBox">
			<div class="boxContent">
				<div id="box2Content">
					<div class="boxHeader"><strong>나의 캘린더</strong></div><br> <br>
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
					
					
				</div>
			</div>
		</div>
		
		<div class="btnRight">
			<input type="button" onclick="location.href='/mypage/myCalendar'" value="캘린더 수정" class="mypageChangeBtn">		
		</div>
	</div>
</div>

