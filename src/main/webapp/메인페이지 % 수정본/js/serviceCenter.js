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
  var toTopBtn = document.getElementById('myBtnTop');
  var toBottomBtn = document.getElementById('myBtnBottom');

  var menuPosition = menu.getBoundingClientRect();
  var footerPosition = footer.getBoundingClientRect();

  // div.menu가 화면에서 사라졌는지 확인합니다.
  if (menuPosition.bottom < 0) {
    toTopBtn.style.display = 'block'; // 버튼 표시
  } else {
    toTopBtn.style.display = 'none'; // 버튼 숨김
  }

  // footer가 화면에 보이는지 확인합니다.
  if (footerPosition.top < 0) {
    toBottomBtn.style.display = 'none'; // 버튼 숨김
  } else {
    toBottomBtn.style.display = 'block'; // 버튼 표시
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

// 지정된 ID의 내용만 보여주는 함수입니다.
function showContent(contentId) {
  document.getElementById('noticeContent').style.display = 'none';
  document.getElementById('inquiryContent').style.display = 'none';
  document.getElementById('faqContent').style.display = 'none';

  document.getElementById(contentId).style.display = 'block';
}

function handleHashChange() {
  var hash = window.location.hash;

  if (hash === "#inquiry") {
    showContent('inquiryContent');
  } else if (hash === "#faq") {
    showContent('faqContent');
  } else {
    showContent('noticeContent');
  }
};

document.addEventListener('DOMContentLoaded', handleHashChange);
window.addEventListener('hashchange', handleHashChange);

document.getElementById('showNotice').addEventListener('click', function(e) {
  e.preventDefault();
  showContent('noticeContent');
  window.location.hash = 'notice';
});

document.getElementById('showInquiry').addEventListener('click', function(e) {
  e.preventDefault();
  showContent('inquiryContent');
  window.location.hash = 'inquiry';
});

document.getElementById('showFaq').addEventListener('click', function(e) {
  e.preventDefault();
  showContent('faqContent');
  window.location.hash = 'faq';
});

////////////////////////////// 1:1 문의 하기/////////////////////

document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('comment11_form').addEventListener('submit', function(e) {
    e.preventDefault();

    var inquiryContent = document.getElementById('inquirycomment').value.trim();
    var isSecret = document.querySelector('#secret input[type="checkbox"]').checked;
    var userName = document.getElementById('user11_name').value;

    if (inquiryContent === "") {
      document.getElementById('inquirycomment_error').style.display = 'block';
    } else {
      document.getElementById('inquirycomment_error').style.display = 'none';

      var inquiryDiv = document.createElement('div');
      inquiryDiv.classList.add('inquiry-item');
      if (isSecret) {
        inquiryDiv.innerHTML = `<strong>${userName}</strong>: 비밀글입니다.`;
      } else {
        inquiryDiv.innerHTML = `<strong>${userName}</strong>: ${inquiryContent}`;
      }

      document.getElementById('inquirycom_list').appendChild(inquiryDiv);

      document.getElementById('inquirycomment').value = '';
      document.querySelector('#secret input[type="checkbox"]').checked = false;
    }
  });
});

//////////////////////////////////////FAQ//////////////////////////////////////

// 가정: 특정 사용자만 버튼을 볼 수 있음
var hasPermission = true; // 실제 애플리케이션에서는 사용자 권한 검사 로직으로 대체

window.onload = function() {
  if (hasPermission) {
    var editButtons = document.querySelectorAll('.edit-btn');
    var deleteButtons = document.querySelectorAll('.delete-btn');
    var createButton = document.querySelector('.create-btn');

    editButtons.forEach(function(button) {
      button.style.display = 'inline'; // 수정 버튼 보이기
    });

    deleteButtons.forEach(function(button) {
      button.style.display = 'inline'; // 삭제 버튼 보이기
    });

    createButton.style.display = 'block'; // 작성 버튼 보이기
  }
};

// 페이지 로드 시 저장된 FAQ 불러오기 및 사용자 역할 확인
document.addEventListener('DOMContentLoaded', function() {
  loadFAQs();
  checkUserRole();
});

// FAQ 생성 함수

function createFAQ(questionText = '질문을 여기에 작성하세요.', answerText = '답변을 여기에 작성하세요.') {
  var faqDiv = document.querySelector('.faq');

  var faqContainer = document.createElement('div'); // FAQ 항목을 담을 컨테이너
  faqContainer.className = 'faq-container';
  var faqPairId = 'faq-' + faqId++;
  faqContainer.id = faqPairId;

  var questionDiv = document.createElement('div');
  questionDiv.className = 'question';
  questionDiv.contentEditable = true;
  questionDiv.innerText = questionText;

  var answerDiv = document.createElement('div');
  answerDiv.className = 'answer';
  answerDiv.contentEditable = true;
  answerDiv.innerText = answerText;

  var deleteBtn = document.createElement('button');
  deleteBtn.className = 'delete-btn';
  deleteBtn.innerText = '삭제';
  deleteBtn.onclick = function() { deleteFAQ(faqPairId); };

  var editBtn = document.createElement('button');
  editBtn.className = 'edit-btn';
  editBtn.innerText = '수정';
  editBtn.onclick = function() { editFAQ(faqPairId); };

  faqContainer.appendChild(questionDiv);
  faqContainer.appendChild(answerDiv);
  faqContainer.appendChild(editBtn);
  faqContainer.appendChild(deleteBtn);
  faqDiv.appendChild(faqContainer);

  function deleteFAQ(faqPairId) {
    var faqContainer = document.getElementById(faqPairId);
    faqContainer.remove(); // FAQ 컨테이너 및 하위 요소 모두 삭제
    localStorage.removeItem(faqPairId);
  }

  questionDiv.addEventListener('focus', function() {
    if (questionDiv.innerText === '질문을 여기에 작성하세요.') {
      questionDiv.innerText = '';
    }
  });

  answerDiv.addEventListener('focus', function() {
    if (answerDiv.innerText === '답변을 여기에 작성하세요.') {
      answerDiv.innerText = '';
    }
  });

  questionDiv.addEventListener('input', function() {
    saveFAQ(faqPairId, questionDiv.innerText, answerDiv.innerText);
  });

  answerDiv.addEventListener('input', function() {
    saveFAQ(faqPairId, questionDiv.innerText, answerDiv.innerText);
  });
}

// FAQ 저장 함수
function saveFAQ(faqPairId, question, answer) {
  var faqData = {
    question: question,
    answer: answer
  };
  localStorage.setItem(faqPairId, JSON.stringify(faqData));
}

// 저장된 FAQ 불러오기
function loadFAQs() {
  for (var i = 0; i < localStorage.length; i++) {
    var key = localStorage.key(i);
    if (key.startsWith('faq-')) {
      var faqData = JSON.parse(localStorage.getItem(key));
      createFAQ(faqData.question, faqData.answer);
    }
  }
}

// FAQ 삭제 함수
function deleteFAQ(faqPairId) {
  var faqContainer = document.getElementById(faqPairId);
  faqContainer.remove(); // FAQ 컨테이너 및 하위 요소 모두 삭제
  localStorage.removeItem(faqPairId);
}
// FAQ 수정 함수
function editFAQ(faqPairId) {
  // 해당 FAQ 항목의 질문과 답변 요소를 찾음
  var questionElement = document.querySelector(`#faq-${faqPairId} .faq-question`);
  var answerElement = document.querySelector(`#faq-${faqPairId} .faq-answer`);

  // 요소가 편집 가능한 상태인지 확인
  if (questionElement.isContentEditable) {
    // 편집 가능한 상태라면, 편집을 종료하고 내용을 저장
    questionElement.contentEditable = "false";
    answerElement.contentEditable = "false";
    questionElement.style.border = "none";
    answerElement.style.border = "none";

    // 여기에 변경된 내용을 서버에 저장하는 코드를 추가할 수 있습니다.
    // 예: saveFAQ(faqPairId, questionElement.textContent, answerElement.textContent);
  } else {
    // 편집 가능한 상태가 아니라면, 편집을 시작
    questionElement.contentEditable = "true";
    answerElement.contentEditable = "true";
    questionElement.style.border = "1px solid #ccc";
    answerElement.style.border = "1px solid #ccc";
    questionElement.focus(); // 사용자가 바로 편집할 수 있도록 질문에 포커스를 줌
  }
}

// 사용자 역할 확인 함수
function checkUserRole() {
  var userRole = localStorage.getItem('userRole'); // 예시로 'admin' 설정
  if (userRole !== 'admin') {
    var buttons = document.querySelectorAll('.faq button');
    buttons.forEach(function(button) {
      button.style.display = 'none'; // 관리자가 아니면 버튼 숨기기
    });
  }
}

// FAQ ID를 위한 글로벌 변수 설정
var faqId = 0;

// FAQ 추가 버튼 이벤트 리스너
document.getElementById('add-faq-btn').addEventListener('click', function() {
  createFAQ(); // 새 FAQ 생성
});

// 초기 설정
function init() {
  // 필요한 초기 설정 로직을 여기에 추가하세요.
  // 예를 들어, 최초 FAQ ID를 로컬 스토리지에서 가져오거나, 없으면 0부터 시작하도록 설정할 수 있습니다.
  var lastFaqId = localStorage.getItem('lastFaqId');
  faqId = lastFaqId ? parseInt(lastFaqId) : 0;
}

init(); // 페이지 로드 시 초기 설정 실행

///////////////////////////////////////////////공지 사항 ////////////////////////////////////

// 공지사항 수정 및 삭제를 위한 전역 변수
var currentNotice = null;

function showPopup(edit = false) {
  var title = "", text = "";
  if (edit && currentNotice) {
    title = currentNotice.querySelector('.toggleBtn').textContent;
    text = currentNotice.querySelector('.ntccontent').textContent;
  }

  var myWindow = window.open("", "a", "width=400, height=300, left=100, top=50");

  myWindow.document.write('<html><head><title>공지사항 ' + (edit ? '수정' : '작성') + '</title></head><body>');
  myWindow.document.write('<div id="writeForm">');
  myWindow.document.write('<h2>공지사항 ' + (edit ? '수정' : '작성') + '</h2>');
  myWindow.document.write('<label for="titleText">제목:</label><br>');
  myWindow.document.write('<input type="text" id="titleText" name="title" style="width: 95%;" value="' + title + '"><br>');
  myWindow.document.write('<label for="noticeText">내용:</label><br>');
  myWindow.document.write('<textarea id="noticeText" rows="4" cols="50">' + text + '</textarea><br>');
  myWindow.document.write('<button id="saveBtn">' + (edit ? '수정하기' : '저장') + '</button>');
  if (edit) {
    myWindow.document.write('<button id="deleteBtn">삭제하기</button>');
  }
  myWindow.document.write('<button id="cancelBtn">취소</button>');
  myWindow.document.write('</div>');
  myWindow.document.write('</body></html>');
  myWindow.document.close();

  myWindow.onload = function() {
    myWindow.document.getElementById('saveBtn').onclick = function() {
      var newTitle = myWindow.document.getElementById('titleText').value;
      var newText = myWindow.document.getElementById('noticeText').value;
      if (newTitle.trim() !== "" && newText.trim() !== "") {
        if (edit && currentNotice) {
          currentNotice.querySelector('.toggleBtn').textContent = newTitle;
          currentNotice.querySelector('.ntccontent').textContent = newText;
        } else {
          var noticesDiv = document.querySelector('.notices');
          var newNotice = document.createElement('div');
          newNotice.innerHTML = `<button class="toggleBtn">${newTitle}</button><div class="ntccontent" style="display:none;">${newText}</div>`;
          newNotice.querySelector('.toggleBtn').addEventListener('click', function(event) {
            const content = event.currentTarget.nextElementSibling;
            content.style.display = content.style.display === "none" ? "block" : "none";
          });
          noticesDiv.appendChild(newNotice);
        }
      }
      myWindow.close();
    };

    myWindow.document.getElementById('cancelBtn').onclick = function() {
      myWindow.close();
    };

    if (edit) {
      myWindow.document.getElementById('deleteBtn').onclick = function() {
        if (currentNotice) {
          currentNotice.remove();
          myWindow.close();
        }
      };
    }
  };
}

document.getElementById('createBtn').addEventListener('click', function() {
  showPopup();
});

document.getElementById('editBtn').addEventListener('click', function() {
  var notices = document.querySelectorAll('.notices div');
  if (notices.length > 0) {
    // 현재 공지사항을 선택합니다 (예시에서는 첫 번째 공지사항을 선택합니다).
    currentNotice = notices[0]; // 실제 애플리케이션에서는 사용자가 선택할 수 있도록 구현해야 합니다.
    showPopup(true);
  } else {
    alert("수정할 공지사항이 없습니다.");
  }
});