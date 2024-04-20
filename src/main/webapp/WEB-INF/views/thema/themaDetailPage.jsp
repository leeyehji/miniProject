<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>테마 여행 - 여행지 상세 정보</title>

	<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
	<link rel="stylesheet" type="text/css" href="/thema/css/detailPage.css">

</head>

<body>


<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

<div id="frameContent">
	<div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
	<div id="content">
		<div id="backPage"><a href="javascript:history.back()">< 테마여행 목록으로</a></div>
		<div id="detailWrap">
			<div id="detailBody">
				<input type="hidden" id="T_CONTENTNO" value="${T_CONTENTNO}"/>
				<input type="hidden" id="T_CONTENTTYPEID" value="${T_CONTENTTYPEID}"/>

				<div id="detailTitle" style="margin-bottom: 30px;">
					<h1></h1>
					<h5></h5>
					<h3></h3>

				</div>
				<hr >

				<div id="detailMain">
					<div id="detailImg">
						<img src="" alt="#">
					</div>
					<div>
						<h3>상세정보</h3>
						<hr>
					</div>
					<div id="detailContents" style="text-align: left;">
							<pre style="overflow: auto; white-space: normal;">

                  	  		</pre>
					</div>

				</div>
				<hr>
				<div id="detailInfo">
					<table style="font-size: 11pt; margin: 0 auto;">
						<tr>
							<td >* 문의 및 안내</td>
							<td id="phone"></td>
							<td>* 홈페이지</td>
							<td id="homepage"></td>
						</tr>
						<tr id="themaData">

						</tr>
						<tr id="themaData2">

						</tr>
						<tr id="themaData3">

						</tr>
						<tr id="themaData4">
						<tr>
						<tr id="themaData5">
						<tr>
						<tr id="themaData6">
						<tr>
						  <td colSpan="4" id="icon" style="border-bottom: none">
							<img src="/thema/icon/pet.png" id="pet" class="noAllow"/>
							<img src="/thema/icon/stoller.png" id="stoller" class="noAllow"/>
							<img src="/thema/icon/parking.png" id="parking" class="noAllow"/>
							<img src="/thema/icon/wheelchair.png" id="wheelchair" class="noAllow"/>
							<img src="/thema/icon/disabled.png" id="disabled" class="noAllow"/>
						  </td>
						</tr>
					</table>
				</div>
				<hr>
				<div id="detailFoot" style="text-align: center;">
					<button id="view">조회수 &emsp; <span></span></button>
					<button id="like">좋아요    <span></span></button>

<%--					<button class="btn-open-modal" onclick="">일정 추가</button>--%>

				</div>



			</div>
			<div id="backPage"><a href="javascript:history.back()">< 테마여행 목록으로</a></div>

		</div>

		<div id="modal">
			<div id="detailModal" style="text-align: center;">
				<div>
					<span>여행지</span> <input type="text" id="modalContentName" name="modalContentName" readonly>
				</div>
				<div>
					<span>일정 제목</span> <input type="text" id="modalTitle" name="modalTitle">
				</div>
				<div>
					<span>시작 날짜</span> <select name="startYear" id="startYear">
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
					<option value="2025">2025</option>
				</select> <select name="startMonth" id="startMonth">
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
				</select>  <select name="startDay" id="startDay">
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
					<span>종료 날짜</span> <select name="endYear" id="endYear">
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
					<option value="2025">2025</option>
				</select> <select name="endMonth" id="endMonth">
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
				</select> <select name="endDay" id="endDay">
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




<script src="/frame/js/frame.js"></script>
<script src="/thema/js/detailPage.js"></script>
<script>
	$(function(){
		$.ajax({
			type : 'POST',
			data : {"contentNo" : ${T_CONTENTNO},
					"typeId":${T_CONTENTTYPEID}},
			url : "/thema/getThemaItem",
			dataType : 'JSON',
			success : function(themaDTO){

				inputData(themaDTO);

			},
			error : function(e){
				console.log(e);
			}
		})
	})
</script>
</body>

</html>