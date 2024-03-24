<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 후기 게시판</title>

<link rel="stylesheet" type="text/css" href="../css/frame.css">
<link rel="stylesheet" type="text/css" href="../css/detailPage.css">

</head>

<body>


	<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

	<div id="frameContent">
		<div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
		<div id="content">

			<div id="detailWrap">
				<div id="detailBody">
					<div id="detailTitle" style="margin-bottom: 30px;">
						<h1>경복궁</h1>
						<h5>서울특별시 종로구 사직로 161</h5>
						<h3>그 시절부터 우리가 사랑한 서울의 다섯 궁궐 ①</h3>

					</div>
					<hr>

					<div id="detailMain">
						<div id="detailImg">
							<img src="../css/image/경복궁.jpg" alt="경복궁">
						</div>
						<div>
							<h3>상세정보</h3>
							<hr>
						</div>
						<div id="detailContents" style="text-align: left;">
							<pre style="overflow: auto; white-space: normal;">경복궁은 1395년 태조 이성계에 의해서 새로운 조선왕조의 법궁으로 지어졌다. 경복궁은 동궐(창덕궁)이나 서궐(경희궁)에 비해 위치가 북쪽에 있어 ''북궐''이라 불리기도 했다. 경복궁은 5대 궁궐 가운데 으뜸의 규모와 건축미를 자랑한다. 경복궁 근정전에서 즉위식을 가진 왕들을 보면 제2대 정종, 제4대 세종, 제6대 단종, 제7대 세조, 제9대 성종, 제11대 중종, 제13대 명종 등이다. 경복궁은 임진왜란 때 상당수의 건물이 불타 없어진 아픔을 갖고 있으며, 고종 때에 흥선대원군의 주도 아래 7,700여칸에 이르는 건물들을 다시 세웠다. 그러나 또 다시 명성황후 시해사건이 일어나면서 왕조의 몰락과 함께 경복궁도 왕궁으로서의 기능을 상실하고 말았다. 경복궁에는 조선시대의 대표적인 건축물인 경회루와 향원정의 연못이 원형대로 남아 있으며, 근정전의 월대와 조각상들은 당시의 조각미술을 대표한다. 현재 흥례문 밖 서편에는 국립고궁 박물관이 위치하고 있고, 경복궁 내 향원정의 동편에는 국립민속 박물관이 위치하고 있다.
                        <br>
                        <br>
                        * 주요문화재
                        <br>
                        1) 사적 경복궁
                        <br>
                        2) 국보 경복궁 근정전
                        <br>
                        3) 국보 경복궁 경회루
                        <br>
                        4) 보물 경복궁 자경전
                        <br>
                        5) 보물 경복궁 자경전 십장생 굴뚝
                        <br>
                        6) 보물 경복궁 아미산굴뚝
                        <br>
                        7) 보물 경복궁 근정문 및 행각
                        <br>
                        8) 보물 경복궁 풍기대
                        
                    </pre>

						</div>

					</div>
					<hr>
					<div id="datailInfo">
						<table style="font-size: 11pt; margin: 0 auto;">
							<tr>
								<td><span></span>* 문의 및 안내</td>
								<td>02-3700-3900</td>
								<td>* 홈페이지</td>
								<td>경복궁 http://www.royalpalace.go.kr<br> 궁궐길라잡이
									http://www.palaceguide.or.kr<br> 한국의재발견
									http://www.rekor.or.kr<br> 야간관람
									예매https://ticket.11st.co.kr/
								</td>
							</tr>
							<tr>
								<td>* 공휴일</td>
								<td>일요일</td>
								<td>* 이용요금</td>
								<td>무료</td>
							</tr>
							<tr>
							<td colspan="4" id="icon">
								<img src="../icon/pet.png" id="pet" class="noAllow"/>
								<img src="../icon/stoller.png" id="stoller" class="noAllow"/>
								<img src="../icon/parking.png" id="parking" class="noAllow"/>
								<img src="../icon/wheelchair.png" id="wheelchair" class="noAllow"/>
								<img src="../icon/disabled.png" id="disabled" class="noAllow"/>
							</td>
							</tr>
						</table>
					</div>
					<hr>
					<div id="detailFoot" style="text-align: center;">
						<button>조회수 &emsp; <span>100</span></button>
						<button>좋아요 &emsp; <span>22</span></button>
						<button class="btn-open-modal" onclick="">일정 추가</button>

					</div>


				</div>
			</div>

			<div id="modal">
				<div id="detailModal" style="text-align: center;">
					<div>
						<span>여행지</span> <input type="text" id="modalTitle" readonly>
					</div>
					<div>
						<span>시작 날짜</span> <select name="year" id="year">
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
						</select> <select name="month" id="month">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <select name="day" id="day">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
					<div>
						<span>종료 날짜</span> <select name="year" id="year">
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
						</select> <select name="month" id="month">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <select name="day" id="day">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
					</div>
					<div>
						<span>메모</span> <br>
						<textarea name="memo" id="memo" cols="30" rows="10"
							style="resize: none;"></textarea>
					</div>
					<div>
						<button id="save">저장</button>
						<button id="cancel">취소</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="upDownBtn">
		<a href="#"><button id="upBtn">위로</button></a> <a href="#bottom"><button
				id="downBtn">아래</button></a>
	</div>

	<footer><jsp:include page="../frame/footer.jsp"></jsp:include></footer>
	<div id="bottom"></div>




	<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
	<script src="../js/frame.js"></script>
	<script src="../js/detailPage.js"></script>
	<script>
		$('#pet').removeClass('noAllow');
		$('#disabled').removeClass('noAllow');
	
	</script>
</body>

</html>