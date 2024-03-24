<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 후기 게시판</title>

<link rel="stylesheet" type="text/css" href="../css/frame.css">
<link rel="stylesheet" type="text/css" href="../css/reviewlist.css">
<style>
</style>
</head>

<body>


	<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

	<div id="frameContent">
		<div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
		<div id="content">

			<!-- reviewList -->

			<div id="reviewList" class="reviewList">

				<div id="reviewListMain">
					<div id="reviewListHeader">
						<h1>R E V I E W</h1>
					</div>

					<div class="reviewListItem">
						<table>
							<tr>
								<td colspan="5"><img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-04 001.jpeg"
									alt="고양이 사진" /></td>
							</tr>
							<tr>
								<td colspan="5">
									<hr>
									<a href="./review.jsp">안녕하세요 리스트입니다.</a>
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="4">HELLDIVER</td>
							</tr>

							<tr>
								<td>24.03.09</td>
								<td>조회수</td>
								<td>10</td>
								<td><img src="../icon/comment.png">5</td>
								<td><img src="../icon/like.png">3</td>
							</tr>
						</table>
					</div>
					<div class="reviewListItem">
						<table>
							<tr>
								<td colspan="5"><img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-04 002.jpeg"
									alt="고양이 사진" /></td>
							</tr>
							<tr>
								<td colspan="5">
									<hr>안녕하세요 리스트입니다.
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="4">HELLDIVER</td>
							</tr>

							<tr>
								<td>24.03.09</td>
								<td>조회수</td>
								<td>10</td>
								<td><img src="../icon/comment.png">5</td>
								<td><img src="../icon/like.png">3</td>
							</tr>
						</table>
					</div>
					<div class="reviewListItem">
						<table>
							<tr>
								<td colspan="5"><img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-04 003.jpeg"
									alt="고양이 사진" /></td>
							</tr>

							<td colspan="5">
								<hr>안녕하세요 리스트입니다.
							</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="4">HELLDIVER</td>
							</tr>

							<tr>
								<td>24.03.09</td>
								<td>조회수</td>
								<td>10</td>
								<td><img src="../icon/comment.png">5</td>
								<td><img src="../icon/like.png">3</td>
							</tr>
						</table>
					</div>

					<div class="reviewListItem">
						<table>
							<tr>
								<td colspan="5"><img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-05 004.jpeg"
									alt="고양이 사진" /></td>
							</tr>

							<td colspan="5">
								<hr>안녕하세요 리스트입니다.
							</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="4">HELLDIVER</td>
							</tr>

							<tr>
								<td>24.03.09</td>
								<td>조회수</td>
								<td>10</td>
								<td><img src="../icon/comment.png">5</td>
								<td><img src="../icon/like.png">3</td>
							</tr>
						</table>
					</div>
					<div class="reviewListItem">
						<table>
							<tr>
								<td colspan="5"><img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-05 005.jpeg"
									alt="고양이 사진" /></td>
							</tr>

							<td colspan="5">
								<hr>안녕하세요 리스트입니다.
							</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="4">HELLDIVER</td>
							</tr>

							<tr>
								<td>24.03.09</td>
								<td>조회수</td>
								<td>10</td>
								<td><img src="../icon/comment.png">5</td>
								<td><img src="../icon/like.png">3</td>
							</tr>
						</table>
					</div>
					<div class="reviewListItem">
						<table>
							<tr>
								<td colspan="5"><img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-05 007.jpeg"
									alt="고양이 사진" /></td>
							</tr>

							<td colspan="5">
								<hr>안녕하세요 리스트입니다.
							</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="4">HELLDIVER</td>
							</tr>

							<tr>
								<td>24.03.09</td>
								<td>조회수</td>
								<td>10</td>
								<td><img src="../icon/comment.png">5</td>
								<td><img src="../icon/like.png">3</td>
							</tr>
						</table>
					</div>

				</div>


				<div id="reviewListFoot">
					<div id="reviewListPage">
						<button>이전</button>
						<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
						<button>다음</button>
					</div>
					<div id="reviewListUtil">
						<button id="reviewListWriteBtn">글쓰기</button>
						<button id="reviewListUpdateBtn">글수정</button>
						<button id="reviewListDeleteBtn">글삭제</button>
					</div>
				</div>



			</div>
			<!-- reviewList end -->
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
	<script src="../js/review.js"></script>



</body>

</html>