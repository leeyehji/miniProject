<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/frame/css/frame.css">
<link rel="stylesheet" type="text/css" href="/thema/css/themaBoardList.css">
    
</head>
<body>
 <header><jsp:include page="../frame/header.jsp"></jsp:include></header>

    <div id="frameContent">
        <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>
        <div id="content">
            <div id="themaBoardContent">
                <div id="title">테마여행 소개</div>

                <div id="themaDataList">
                    <label for="contentTypeId">테마 선택</label>
                    <select id="contentTypeId">
                        <option>테마 선택</option>
                        <option class="contentTypeId" value="12">관광지</option>
                        <option class="contentTypeId" value="14">문화시설</option>
                        <option class="contentTypeId" value="15">축제/공연/행사</option>
                        <option class="contentTypeId" value="28">레포츠</option>
                        <option class="contentTypeId" value="32">숙박</option>
                        <option class="contentTypeId" value="38">쇼핑</option>
                        <option class="contentTypeId" value="39">음식</option>
                    </select>
                    <label for="cat1">대분류</label>
                    <select id="cat1">
                        <option>대분류 선택</option>
                    </select>
                    <label for="cat2">중분류</label>
                    <select id="cat2">
                        <option>중분류 선택</option>
                    </select>
                    <label for="cat1">소분류</label>
                    <select id="cat3">
                        <option>소분류 선택</option>
                    </select>
                </div>
<%--                <div id="themaTags">--%>
<%--                    <button class="themaTag">#전체보기</button>--%>
<%--                    <button class="themaTag">#태그1</button>--%>
<%--                    <button class="themaTag">#태그2</button>--%>
<%--                    <button class="themaTag">#태그3</button>--%>
<%--                    <button class="themaTag">#태그4</button>--%>
<%--                    <button class="themaTag">#태그5</button>--%>
<%--                </div>--%>

                <div id="themaBoardContentConsole">



                </div>
            </div>
        </div>
    </div>
    <div id="upDownBtn">
        <a href="#"><button id="upBtn">위로</button></a>
        <a href="#bottom"><button id="downBtn">아래</button></a>
    </div>
    <footer><jsp:include page="../frame/footer.jsp"></jsp:include></footer>
<div id="bottom"></div>
</body>

<script src="/frame/js/frame.js"></script>
<script src="/thema/js/themaBoardList.js"></script>
</html>