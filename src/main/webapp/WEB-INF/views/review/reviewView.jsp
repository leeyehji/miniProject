<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 후기 게시판</title>
    <link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
    <link rel="stylesheet" type="text/css" href="/review/css/review.css">
</head>

<body>


<header><jsp:include page="../frame/header.jsp"></jsp:include></header>

<div id="frameContent">
    <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
    <div id="content">
        <!-- 리뷰 시작 -->

        <div id="reviewMain" class="reviewMain">

            <div id="backList">
                <a href="reviewList?pg=1">여행 게시판> </a>
            </div>

            <div id="reviewItem" style="background-color: white;">

                <div style="text-align: center;">
                    <h1 id="reviewTitle"></h1>
                </div>

                <hr width="200">

                <div id="reviewInfo">

                    <p>
                        작성자 : <span id="userId"></span>
                    </p>
                    <p>
                        작성일 : <span id="date"></span>
                    </p>
                    <p>
                        조회수 : <span id="view"></span>
                    </p>

                </div>
                <hr>
                <div id="reviewContent">


                </div>
                <div id="reviewUtil">

                    <div id="reviewlike">
                        <button>
                            좋아요 &emsp; <span class="reviewLike"></span>
                        </button>
                    </div>

                    <div id="delUpdate" style='margin-top: 20px'>
                        <button>이전글</button>
                        <button>글 수정</button>
                        <button>글 삭제</button>
                        <button>다음글</button>
                    </div>

                </div>
            </div>


            <div id="reviewComment" style="background-color: white;">

                <p>&emsp;&emsp;&emsp;댓글</p>
                <hr>
                <div id="commentWrite">
                    <textarea name="commentText" id="commentText" cols="30" rows="5"
                              placeholder="로그인 후 글쓰기가 가능합니다. "></textarea>
                    <button id="commentBtn">로그인</button>
                </div>
                <hr>
                <div id="commentConsole" >
                    <table id="commentTable" >

                    </table>
                </div>
            </div>

            <input id="reviewListBtn" type="button" value="목록으로 > " >
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


<script>
    var B_NO = ${no};
</script>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="/frame/js/frame.js"></script>
<script src="/review/js/reviewView.js"></script>




</body>

</html>