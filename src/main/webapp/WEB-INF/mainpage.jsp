<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>miniproject</title>

    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script defer src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- 캘린더 -->
    <script defer src="./js/miniP.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/><!-- 캘린더 -->
    <link rel="stylesheet" href="./css/miniP.css" />

</head>

<body>
<button onclick="topFunction()" style="display: none;" id="myBtnTop" title="Go to top">위로</button>
<button onclick="bottomFunction()" style="display: none;" id="myBtnBottom" title="Go to bottom">아래로</button>


<header class="banner">
    <div class="menu">

        <div class="logobar">

            <nav>
                <a class="logo" href="./mainpage.html">Nadeuli</a>
            </nav>

            <div class="search">
                <input type="text" placeholder="여행을 가고싶다면 어디로.." title="검색" id="inp_search" autocomplete="off" />
                <input type="button" id="searchBtn" value="검색하기" />
            </div>

            <div class="login">
                <input type="button" id="loginBtn" value="로그인" />
                <input type="button" id="JoinBtn" value="회원가입" />
            </div>

        </div>



        <div class="nav">
            <ul>
                <div class="menu-icon" onclick="toggleNavSections()">
                    <span></span>
                </div>

                <li class="a1"><a href="/miniProject/mainpage.jsp">홈</a></li>
          <li class="a2"><a href="/miniProject/map/map.jsp">여행지</a></li>
                <li class="a3"><a href="./miniproject.html">후기</a></li>
                <li class="a4"><a href="./miniproject.html">이벤트</a></li>
                <li class="a5"><a href="./serviceCenter.html">고객센터</a></li>
            </ul>
        </div>

    </div>

    <div class="nav_section">
        <div id="여행지" class="sub_menu travel">
            <ul>
                <li><a href="#1">테마별 여행지</a></li>
                <li><a href="#2">여행지 TOP 10</a></li>
            </ul>
        </div>

        <div id="후기" class="sub_menu review">
            <ul>
                <li><a href="#3">여행 후기</a></li>
                <li><a href="#4">블로그 후기</a></li>
            </ul>
        </div>

        <div id="이벤트" class="sub_menu event">
            <ul>
                <li><a href="#5">진행중인 이벤트</a></li>
                <li><a href="#6">종료된 이벤트</a></li>
            </ul>
        </div>

        <div id="고객센터" class="sub_menu service-center">
            <ul>
                <li><a href="serviceCenter.html#notice">공지사항</a></li>
                <li><a href="serviceCenter.html#inquiry">1 : 1 문의</a></li>
                <li><a href="serviceCenter.html#qna" style="margin-left: 6%;">FQA</a></li>
            </ul>
        </div>
    </div>

</header>

<table class="main">
    <thead>

    <div class="slideshow-container">

        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="./css/image/slide1.jpeg">
            <div class="text">내용입력</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="./css/image/slide2.jpeg">
            <div class="text">내용입력</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="./css/image/slide3.jpeg">
            <div class="text">내용입력</div>
        </div>

        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
        <ul class="slides flex">
            <span class="move-left"></span>
            <span class="move-right"></span>


            <!-- The dots/circles -->
            <div class="dotBtn">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>

    </div>

    <br>
    </thead>

    <br>
    <hr>
    <br>
    <tbody>
    <h2 id="cln">캘린더</h2>
    <div id="datepicker"></div>
    <!-- <input type="text" id="datepicker" /> -->
    <div id="cldout"></div>
    </tbody>

    <br>
    <hr>


    <tfoot>
    <section class="hot">
        <h2>추천 여행지</h2>
        <div class="destination-grid">

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_1.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지1</h3>
                <p>여행지1에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_2.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지2</h3>
                <p>여행지2에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_3.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지3</h3>
                <p>여행지3에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_4.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지4</h3>
                <p>여행지4에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_13.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지5</h3>
                <p>여행지5에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_13.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지6</h3>
                <p>여행지6에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_4.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지7</h3>
                <p>여행지7에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_1.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지8</h3>
                <p>여행지8에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_2.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지9</h3>
                <p>여행지9에 대한 설명</p>
            </div>

            <div class="destination-card">
                <a href="miniproject.html">
                    <img src="./css/image/seoul_cherry_blossom_3.jpeg" alt="여행지 이미지">
                </a>
                <h3>여행지10</h3>
                <p>여행지10에 대한 설명</p>
            </div>
        </div>
    </section>
    </tfoot>


</table>

<br>
<hr>

<footer>

    <strong class="tit">여행 후기를 SNS에 남겨주세요!</strong>

    <div class="sns_list">
        <ul>
            <li>
                <a href="http://blog.naver.com" target="_blank" title="새창">
                    <span class="icon icon_blog"></span>
                    <em class="sns_name">네이버 블로그</em>
                </a>
            </li>
            <li>
                <a href="http://post.naver.com" target="_blank" title="새창">
                    <span class="icon icon_post"></span>
                    <em class="sns_name">포스트</em>
                </a>
            </li>
            <li>
                <a href="https://band.us" target="_blank" title="새창">
                    <span class="icon icon_band"></span>
                    <em class="sns_name">네이버<br />밴드</em>
                </a>
            </li>
            <li>
                <a href="https://www.facebook.com" target="_blank" title="새창">
                    <span class="icon icon_facebook"></span>
                    <em class="sns_name">페이스북</em>
                </a>
            </li>
            <li>
                <a href="https://twitter.com" target="_blank" title="새창">
                    <span class="icon icon_twitter"></span>
                    <em class="sns_name">엑스</em>
                </a>
            </li>
            <li>
                <a href="https://story.kakao.com" target="_blank" title="새창">
                    <span class="icon icon_kakaostory"></span>
                    <em class="sns_name">카카오<br />스토리</em>
                </a>
            </li>
            <li>
                <a href="https://www.instagram.com" target="_blank" title="새창">
                    <span class="icon icon_instagram"></span>
                    <em class="sns_name">인스타<br />그램</em>
                </a>
            </li>
        </ul>
    </div>

    <hr />
    <br>
    <div>
        <ul class="btm_menu">
            <li><a href="javascript:" onclick="goTerm(1);" class="personal_info">개인정보처리방침</a></li>
            <li><a href="javascript:" onclick="goTerm(2);">이용약관</a></li><!-- 0703 추가 -->
            <li><a href="javascript:" onclick="goTerm(3);">위치기반서비스 이용약관</a></li><!-- 0717 추가 -->
            <li><a href="" target="_blank" title="새창">저작권정책</a></li>
            <li><a href="" target="_blank" title="새창">고객서비스헌장</a></li>
            <li><a href="" target="_blank" title="새창">전자우편무단수집거부</a></li>
            <li><a href="serviceCenter.html#qna" onclick="goQA();" title="페이지이동">Q&amp;A</a></li>
            <li><a href="" target="_blank" title="새창">찾아오시는 길</a></li>
        </ul>
    </div>
    <br>
    <hr />
    <div class="badak">
        <p>
            미니프로젝트
            <a href="https://naver.com">naver_cloud_camp</a>
        </p>
        <div>
            <a href="https://api.visitkorea.or.kr/#/" id="TourAPI" target="_blank" title="새창"><img
                    src="./css/image/Tour_api.png" alt="TourAPI 4.0"></a>
        </div>
    </div>
</footer>

</body>

<!-- <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script> -->
<script>

</script>
</html>
