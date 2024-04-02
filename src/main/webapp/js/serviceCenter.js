// 메뉴바 시작
function toggleNavSections() {
  var navSection = document.querySelector('.nav_section');
  navSection.classList.toggle('show');
}
// 메뉴바 끝

// //로그인 시작
// // 로그인 성공을 가정하는 함수입니다.
// // 실제 프로젝트에서는 로그인 성공 여부를 판단하는 로직이 필요합니다.
// function loginSuccess() {
//   // 로그인 버튼을 찾아서 마이페이지 버튼으로 변경합니다.
//   var loginBtn = document.getElementById('loginBtn');
//   loginBtn.value = '마이페이지'; // 버튼의 텍스트를 변경합니다.
//   loginBtn.onclick = function () { // 버튼 클릭 시 이동할 페이지를 지정합니다.
//     window.location.href = './mypage.html'; // 마이페이지로 이동하는 경로를 설정하세요.
//   };

//   // 회원가입 버튼을 찾아서 로그아웃 버튼으로 변경합니다.
//   var joinBtn = document.getElementById('JoinBtn');
//   joinBtn.value = '로그아웃'; // 버튼의 텍스트를 변경합니다.
//   joinBtn.onclick = function () { // 버튼 클릭 시 로그아웃 처리를 수행합니다.
//     // 여기에 로그아웃을 처리하는 코드를 추가하세요.
//     // 예시에서는 간단히 페이지 새로고침으로 로그아웃을 가정합니다.
//     location.reload();
//   };
// }

// // 페이지 로드 시 로그인 성공을 가정하고 함수를 실행합니다.
// // 실제로는 로그인 성공 후에 이 함수를 호출해야 합니다.
// window.onload = function () {
//   loginSuccess();
// };
// // 로그인 끝

// 위아래 버튼 시작
// 네비게이션 섹션 토글 기능
function toggleNavSections() {
  var navSection = document.querySelector('.nav_section');
  navSection.classList.toggle('show');
}

function bottomFunction() {
  window.scrollTo({
    top: document.body.scrollHeight,
    behavior: 'smooth'
  });
}

function topFunction() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}

//재
window.addEventListener('scroll', function () {
  var menu = document.querySelector('div.menu');
  var footer = document.querySelector('footer');
  var toTopBtn = document.getElementById('upBtn');
  var toBottomBtn = document.getElementById('downBtn');

  var menuPosition = menu.getBoundingClientRect();
  var footerPosition = footer.getBoundingClientRect();

  // div.menu가 화면에서 사라졌는지 확인합니다.
  if (menuPosition.bottom < 0) {
    upBtn.style.display = 'block'; // 버튼 표시
  } else {
    upBtn.style.display = 'none'; // 버튼 숨김
  }

  // footer가 화면에 보이는지 확인합니다.
  if (footerPosition.top < 0) {
    downBtn.style.display = 'none'; // 버튼 숨김
  } else {
    downBtn.style.display = 'block'; // 버튼 표시
  }
});
//빈

// // 스크롤 시 버튼 디스플레이 로직을 처리하는 함수
// function scrollFunction() {
//   var myBtnTop = document.getElementById("myBtnTop");
//   var myBtnBottom = document.getElementById("myBtnBottom");
//   if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
//     myBtnTop.style.display = "block";
//     myBtnBottom.style.display = "block";
//   } else {
//     myBtnTop.style.display = "block";
//     myBtnBottom.style.display = "block";
//   }
// }

// // 스크롤 이벤트에 함수 연결
// window.onscroll = function () { scrollFunction() };

// // "맨 위로" 버튼에 클릭 이벤트 리스너 추가
// document.getElementById("myBtnTop").addEventListener("click", function () {
//   window.scrollTo(0, 0); // 페이지 상단으로 스크롤
// });

// // "맨 아래로" 버튼에 클릭 이벤트 리스너 추가
// document.getElementById("myBtnBottom").addEventListener("click", function () {
//   window.scrollTo(0, document.body.scrollHeight); // 페이지 하단으로 스크롤
// });
//버튼 끝

// 고객센터

function showContent(contentId) {
  var allContents = ['noticeContent', 'inquiryContent', 'faqContent'];
  allContents.forEach(function(id) {
    document.getElementById(id).style.display = 'none';
  });

  document.getElementById(contentId).style.display = 'block';
}

function handleHashChange() {
  var hash = window.location.hash;

  if (hash === "#inquiry") {
    showContent('inquiryContent');
  } else if (hash === "#faq") {
    showContent('faqContent');
  } else {
    // 기본적으로 공지사항을 보여줍니다.
    showContent('noticeContent');
  }
}

function addClickListener(id, contentId) {
  var element = document.getElementById(id);
  if (element) {
    element.addEventListener('click', function(e) {
      e.preventDefault();
      showContent(contentId);
      window.location.hash = contentId.replace('Content', '');
    });
  } else {
    console.log(id + ' 요소를 찾을 수 없습니다.');
  }
}

// DOM이 완전히 로드된 후에 실행됩니다.
document.addEventListener('DOMContentLoaded', function() {
  handleHashChange(); // 페이지 로드 시 적절한 콘텐츠를 표시합니다.
  // 각 탭에 대한 클릭 이벤트 리스너를 추가합니다.
  addClickListener('showNotice', 'noticeContent');
  addClickListener('showInquiry', 'inquiryContent');
  addClickListener('showFaq', 'faqContent');
});

// 해시 변경을 감지하여 적절한 콘텐츠를 표시합니다.
window.addEventListener('hashchange', handleHashChange);

////////////////////////////// 1:1 문의 하기/////////////////////

document.getElementById('inquiryForm').addEventListener('submit', function(event) {
  event.preventDefault();
  var userName = document.getElementById('userName').value;
  var userEmail = document.getElementById('userEmail').value;
  var userInquiry = document.getElementById('userInquiry').value;

  console.log('이름:', userName);
  console.log('이메일:', userEmail);
  console.log('문의 내용:', userInquiry);

  alert('문의가 접수되었습니다. 빠른 시일 내에 답변드리겠습니다.');

  // 여기서 서버로 데이터를 보내는 코드를 추가할 수 있습니다.
  // 예를 들어, AJAX 요청을 사용하여 서버에 데이터를 전송하고,
  // 서버에서는 이 데이터를 받아 처리한 후 데이터베이스에 저장할 수 있습니다.
  // 문의하기를 하면 문의 내용이 데이터 베이스로 저장되고 답변은 이메일로 하는 식
});


///////////////////////////////////////////////공지 사항 ////////////////////////////////////

var currentNotice = null;

function showPopup(edit = false) {
  var title = "", text = "";

  if (edit && currentNotice) {
    title = currentNotice.title;
    text = currentNotice.text;
  }

  var myWindow = window.open("", "a", "width=400, height=300, left=100, top=50");

  myWindow.document.write('<html><head><title>공지사항 작성</title></head><body>');
  myWindow.document.write('<div id="writeForm">');
  myWindow.document.write('<h2>공지사항 작성</h2>');
  myWindow.document.write('<label for="dateText">날짜:</label><br>');
  myWindow.document.write('<input type="date" id="dateText" name="date" style="width: 100%; color: #000000"><br>');
  myWindow.document.write('<label for="titleText">제목:</label><br>');
  myWindow.document.write('<input type="text" id="titleText" name="title" style="width: 100%;" value="' + title + '"><br>');
  myWindow.document.write('<label for="noticeText">내용:</label><br>');
  myWindow.document.write('<textarea id="noticeText" rows="4" cols="50">' + text + '</textarea><br>');
  myWindow.document.write('<button id="saveBtn">저장</button>');
  myWindow.document.write('<button id="cancelBtn">취소</button>');
  myWindow.document.write('</div>');
  myWindow.document.write('</body></html>');
  myWindow.document.close();

  myWindow.onload = function() {
    myWindow.document.getElementById('saveBtn').onclick = function() {
      var newTitle = myWindow.document.getElementById('titleText').value;
      var newText = myWindow.document.getElementById('noticeText').value;
      var newDate = myWindow.document.getElementById('dateText').value; // 날짜 정보 가져오기

      if (newTitle.trim() !== "" && newText.trim() !== "" && newDate.trim() !== "") {
        if (edit && currentNotice && currentNotice.element) {
          // 기존 공지사항 수정
          var existingNotice = currentNotice.element;
          existingNotice.querySelector('.toggleBtn').textContent = newTitle;
          existingNotice.querySelector('.ntccontent').innerHTML = newText;
          existingNotice.querySelector('.date').textContent = "날짜: " + newDate; // 날짜 정보 업데이트
        } else {

          // 새 공지사항 추가
          var noticesDiv = document.querySelector('.notices');
          var newNotice = document.createElement('div');
          newNotice.innerHTML = `<div style="display: flex; justify-content: space-between; align-items: center;">
                                   <button class="toggleBtn">${newTitle}</button>
                                   <div class="date">날짜: ${newDate}</div> <!-- 날짜 정보 추가 -->
                                   <button class="editBtn" style="margin-left: 10px;">편집</button>
                                   <button class="deleteBtn" style="margin-left: 10px; border-radius: 10px;">삭제</button>
                                 </div>
                                 <div class="ntccontent" style="display:none;">${newText}</div>`;
          newNotice.querySelector('.editBtn').addEventListener('click', function() {
            // 현재 편집할 공지사항으로 설정 (DOM 요소 포함)
            currentNotice = { title: newTitle, text: newText, element: newNotice };
            // 편집 모드로 팝업을 열기
            showPopup(true);
          });
          newNotice.querySelector('.toggleBtn').addEventListener('click', function(event) {
            const content = event.currentTarget.parentElement.nextElementSibling;
            if (content.style.display === "none") {
              content.style.display = "block";
            } else {
              content.style.display = "none";
            }
          });
          newNotice.querySelector('.deleteBtn').addEventListener('click', function() {
            // 공지사항 삭제
            noticesDiv.removeChild(newNotice);
          });

          noticesDiv.appendChild(newNotice);
        }
        myWindow.close();
      } else {
        alert('제목과 내용을 모두 입력해주세요.');
      }
    };

    myWindow.document.getElementById('cancelBtn').onclick = function() {
      myWindow.close();
    };
  };
}