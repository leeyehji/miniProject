<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>


  <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
  <script src="../js/serviceCenter.js"></script>
  <link rel="stylesheet" href="../css/serviceCenter.css" />
  <link rel="stylesheet" type="text/css" href="../css/frame.css">
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
            <br>
            <div class="faq"></div>
          </div><!-- faqContent -->

        </div><!--container-->

      </div> <!-- wrap -->



    </div>

  </div>

  <div id="upDownBtn">
    <a href="#"><button id="upBtn">위로</button></a>
    <a href="#bottom"><button id="downBtn">아래</button></a>
  </div>

  <footer><jsp:include page= "../frame/footer.jsp"></jsp:include></footer>
  <div id="bottom"></div>

</body>
</html>