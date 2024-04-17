<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <link rel="icon" href="data:,">
</head>

<header class="banner">

  <div class="menu">

    <div class="logobar">

      <nav>
        <a class="logo" href="/">Nadeuli</a>
      </nav>

      <div class="search">
        <input type="text" placeholder="여행을 가고싶다면 어디로.." title="검색" id="inp_search" name="inp_search" autocomplete="off" oninput="" />
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

        <li class="a1"><a href="/">홈</a></li>
        <li class="a2"><a href="/map/map">여행지</a></li>
        <li class="a3"><a href="/review/review">후기</a></li>
        <li class="a5"><a href="/serviceCenter/ServiceCenter">고객센터</a></li>
      </ul>
    </div>

  </div>

  <div class="nav_section">
    <div id="여행지" class="sub_menu travel">
      <ul>
        <li><a href="/map/map">지도로 보는 여행지</a></li>
        <li><a href="/thema/themaBoardList">테마별 여행지</a></li>
      </ul>
    </div>

    <div id="후기" class="sub_menu review">
      <ul>
        <li><a href="/review/reviewList">후기 목록</a></li>
        <li><a href="/review/reviewWrite">후기 작성</a></li>
      </ul>
    </div>

    <div id="고객센터" class="sub_menu service-center">
      <ul>
        <li><a href="/serviceCenter/ServiceCenter">공지사항</a></li>
        <li><a href="/serviceCenter/Inquiry">1 : 1 문의</a></li>
        <li><a href="/serviceCenter/Faq">F A Q</a></li>
      </ul>
    </div>
  </div>
  <script src="/frame/js/headerSearch.js"></script>
</header>
