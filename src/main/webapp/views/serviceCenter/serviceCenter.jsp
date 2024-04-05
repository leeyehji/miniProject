<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>


  <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
  <script src="../../resources/serviceCenter/js/serviceCenter.js"></script>
  <link rel="stylesheet" href="../../resources/serviceCenter/css/serviceCenter.css" />
  <link rel="stylesheet" type="text/css" href="../../resources/frame/css/frame.css">
</head>

<body>


  <header><jsp:include page="../frame/header.jsp"></jsp:include></header>

  <div id="frameContent">

    <div id="frameNav"><jsp:include page="../frame/nav.jsp"></jsp:include></div>

    <div id="content" style="padding: 0px">

      <div id="wrap">

        <div id="container">
          <div id="servicecontent">

            <div id="noticeContent">
              <h2>공지사항</h2>
              <div class="notices">

              </div>
              <button id="createBtn" onclick="showPopup();">작성</button>
            </div>
            <!------------------------------------------------------------------>

            <div id="inquiryContent">
              <h2>1 : 1 문의</h2>
              <form id="inquiryForm">
                <div class="form-group">
                  <label for="userName">이름:</label>
                  <input type="text" id="userName" name="userName" required>
                </div>
                <div class="form-group">
                  <label for="userEmail">이메일:</label>
                  <input type="email" id="userEmail" name="userEmail" required>
                </div>
                <div class="form-group">
                  <label for="userInquiry">문의 내용:</label>
                  <textarea id="userInquiry" name="userInquiry" rows="4" required></textarea>
                </div>

                <button type="submit" id="inquiryBtn">문의하기</button>
              </form>
            </div><!-- inquiryContent -->

          </div><!-- content -->


          <div id="faqContent">
            <h2>자주 묻는 질문</h2>
            <h1>F&nbsp; A&nbsp; Q</h1>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <div class="faqItem">
              <div class="question">Q: 여기에 질문을 입력하세요.</div>
              <div class="answer">A: 여기에 답변을 입력하세요.</div>
            </div>
            <!-- 추가적인 질문과 답변 항목을 이곳에 삽입할 수 있습니다. -->
          </div>
          </div><!-- faqContent -->

        </div><!--container-->

      </div> <!-- wrap -->



    </div>

  </div>

  <div id="upDownBtn">
    <button onclick="topFunction()" id="upBtn">위로</button>
    <button onclick="bottomFunction()" id="downBtn">아래</button>
  </div>

  <footer><jsp:include page= "../frame/footer.jsp"></jsp:include></footer>
  <script src="../../resources/serviceCenter/js/serviceCenter.js"></script>
  <div id="bottom"></div>

</body>
</html>