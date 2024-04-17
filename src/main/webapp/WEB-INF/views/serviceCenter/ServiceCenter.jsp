<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="data:,">
    <meta charset="UTF-8">
    <meta name="serviceCenter" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/serviceCenter/css/serviceCenter.css"/>
    <link rel="stylesheet" type="text/css" href="../../../resources/frame/css/frame.css">
</head>

<body>


<header>
    <jsp:include page="../frame/header.jsp"></jsp:include>
</header>

<div id="frameContent">

    <div id="frameNav">
        <jsp:include page="../frame/nav.jsp"></jsp:include>
    </div>

    <div id="content" style="padding: 0px">

        <div id="wrap">

            <div id="container">
                <div id="servicecontent">

                    <div id="noticeContent">
                        <div class="notices">
                            <div id="contents" class="contents">
                                <div class="text_wrap fix"><strong class="tit big">공지사항</strong>
                                    <span class="right_cont">
                                        <div class="search_field">
                                            <form action="#" role="search" class="noticeform">
                                                <fieldset class="noticefieldset">
                                                    <div class="box_search">
                                                        <div class="select_item">
                                                            <div class="arrow_btn">
                                                                    <span class="arrow"></span>
                                                            </div>
                                                        </div>
                                                        <ul class="selectbox items" role="menu" id="sbdd764319774"
                                                            aria-hidden="true"
                                                            style="max-height: 655px; position: absolute; visibility: visible; width: 141px; display: none; left: 0px; top: 36px;">
                                                            <li id="sbo621475285" role="option" class="selected first"
                                                                aria-disabled="">
                                                                <div class="item">
                                                                    <div class="text">제목</div>
                                                                </div>
                                                            </li>
                                                            <li id="sbo273566615" role="option" aria-disabled="">
                                                                <div class="item">
                                                                    <div class="text">내용</div>
                                                                </div>
                                                            </li>
                                                            <li id="sbo267706705" role="option" aria-disabled=""
                                                                class="last">
                                                                <div class="item">
                                                                    <div class="text">제목+내용</div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <select class="has_sb" style="">
                                                        <option value="TIT">제목</option>
                                                        <option value="CTN">내용</option>
                                                        <option value="TCN">제목+내용</option>
                                                    </select>
                                <input type="text" id="input_keyword" value="" name="" title="검색어"
                                       placeholder="검색어를 입력해 주세요." class="input_keyword">
                                <button type="submit" class="btn line">검색</button>
                                </fieldset>
                                </form>
                            </div>
                            </span>
                                </div>
                                <div id="contentArea">
                                    <div class="tbl">
                                        <table class="type1">
                                            <colgroup>
                                                <col style="width: 100px;">
                                                <col style="width: 120px;">
                                                <col style="width: 640px;">
                                                <col style="width: 130px;">
                                            </colgroup>
                                            <thead class="noticethead">
                                            <tr>
                                                <th>번호</th>
                                                <th>작성자</th>
                                                <th>제목</th>
                                                <th>등록일</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="paginate_wrap">
                                        <div class="paginate">
                                            <a href="#none" class="direction prev" style="display: none;">이전</a>
                                            <span><strong>1</strong><a href="#none">2</a><a href="#none">3</a><a
                                                    href="#none">4</a><a href="#none">5</a><a href="#none">6</a><a
                                                    href="#none">7</a><a href="#none">8</a><a href="#none">9</a><a
                                                    href="#none">10</a></span>
                                            <a href="#none" class="direction next" style="">다음</a>
                                        </div>
                                    </div>
                                </div>
                                <button id="writeNoticeBtn">작성하기</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="writeModal">
                    <h2>공지사항 작성</h2>
                    <label for="title">제목:</label>
                    <input type="text" id="title" name="title" style="width: 700px;font-size: 18px;"><br><br>
                    <label for="content" id="contentLabel">내용:</label>
                    <label>
                        <textarea id="content2" name="content"></textarea>
                    </label><br><br>
                    <!-- 이미지 추가 필드 -->
                    <label for="imageUpload">이미지 추가:</label>
                    <input type="file" id="imageUpload" name="image" accept="image/*"><br><br>
                    <!-- 이미지 미리보기 -->
                    <div id="imagePreview" style="margin-bottom: 20px;"></div>
                    <button id="submitBtn">작성 완료</button>
                    <button id="closeBtn">닫기</button>
                </div>
            </div><!-- container -->
        </div><!--wrap-->
    </div> <!-- content -->
</div><%--frameContent--%>

<div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn">위로</button>
    <button onclick="bottomFunction()" id="downBtn">아래</button>
</div>

<footer>
    <jsp:include page="../frame/footer.jsp"></jsp:include>
</footer>
<script src="../../../resources/serviceCenter/js/serviceCenter.js"></script>
<script src="../../../resources/frame/js/frame.js"></script>
<div id="bottom"></div>

</body>
</html>