<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 후기 게시판</title>

<link rel="stylesheet" type="text/css" href="../css/frame.css">
<link rel="stylesheet" type="text/css" href="../css/review.css">

</head>

<body>


	<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

	<div id="frameContent">
		<div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
		<div id="content">
			<!-- 리뷰 시작 -->

			<div id="reviewContent" class="reviewContent">

				<div id="backList">
					<a href="list.html">여행 게시판> </a>
				</div>

				<div id="reviewItem" style="background-color: white;">

					<div style="text-align: center;">
						<h1>여행 후기 게시판 제작</h1>
					</div>

					<hr width="200">

					<div id="reviewInfo">
						<div id="etc">
							<p>
								작성자 : <span>name</span>
							</p>
							<p>
								작성일 : <span>date</span>
							</p>
							<p>
								조회수 : <span>hit</span>
							</p>
						</div>
					</div>
					<hr>
					<div id="reviewMain">
						<div id="detail">
							<p>
								<img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-05 006.jpeg"
									alt="이미지"> 스프링에서 의존성 주입(DI)이란, 객체간 의존성을 개발자가 객체 내부에서 직접
								호출(new연산자)하는 대신, 외부(스프링 컨테이너)에서 객체를 생성해서 넣어주는 방식이다. 외부에서 두 객체 간의
								관계설정을 해주는 디자인 패턴으로, 인터페이스를 사이에 두어 클래스 레벨에서는 의존관계가 고정되지 않도록 하고,
								런타임 시 관계를 동적으로 주입하여 유연성을 확보하고 결합도를 낮출 수 있게 한다. 다음과 같이
								Controller객체가 Service객체를 사용하고 있는 경우, Controller는 Service에 의존성이
								있다고 할 수 있다.  <img
									src="../css/image/KakaoTalk_Photo_2024-02-28-21-46-05 011.jpeg"
									alt="이미지"> 의존한다는 것은 의존대상, 여기서는 Service가 변하면 그것이
								Controller 에게로 전달된다는 뜻이다.만약 Service의 test()메소드가 변경되면
								Controller에서도 그에 따른 수정이 필요하게 되거나 형식은 그대로지만 로직이 변경되면 결과적으로 
								Controller의 기능에도 영향을 미친다. 이와같이 두 객체간의 관계를 맺어주는 것을 의존성 주입이라고 하며
								스프링에서는 3가지 방법의 의존성 주입방법이 있다. 출처:
								https://cheershennah.tistory.com/227 [Today I Learned.
								@cheers_hena 치얼스헤나:티스토리]
							</p>
						</div>

					</div>
					<div id="reviewUtil">

						<div id="like">
							<button>
								좋아요 &emsp; <span>10</span>
							</button>
						</div>
						<div id="delUpdate" style='margin-top:20px'>
							
							
							<button>이전글</button>
							<button>글 수정</button>
							<button>글 삭제</button>
							<button>다음글</button>
						</div>
					</div>
				</div>


				<div id="reviewFoot" style="background-color: white;">
					<div id="comment">
						<p>&emsp;&emsp;&emsp;댓글</p>
						<hr>
						<div id="commentWrite">
							<textarea name="commentText" id="commentText" cols="30" rows="5"
								placeholder="로그인 후 글쓰기가 가능합니다. "></textarea>
							<button id="commentBtn">로그인</button>
						</div>
					</div>
					<div id="commentConsole"></div>


				</div>

				<input id="reviewListBtn" type="button" value="목록으로 >">
			</div>
		</div>
		<!-- 리뷰 끝 -->
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