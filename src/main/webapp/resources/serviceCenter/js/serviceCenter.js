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
///////////////////////////////////////////////공지 사항 ////////////////////////////////////

document.addEventListener('DOMContentLoaded', function () {
  document.getElementById("writeNoticeBtn").addEventListener("click", function() {
    document.getElementById("writeModal").style.display = "block";
  });
  document.getElementById("closeBtn").addEventListener("click", function() {
    document.getElementById("writeModal").style.display = "none";
    // 입력 필드 초기화
    document.getElementById("title").value = "";
    document.getElementById("content2").value = "";});
  document.getElementById("submitBtn").addEventListener("click", function() {
    var title = document.getElementById("title").value;
    var content = document.getElementById("content2").value;
    // 제목과 내용이 비어있는지 확인
    if (title === "" || content === "") {
      alert("제목과 내용을 모두 입력해주세요.");
      return; // 추가 로직을 실행하지 않고 함수 종료
    }
    var image = document.getElementById("imageUpload").value; // 이미지 파일 경로(또는 이름) 추출
    var today = new Date().toISOString().slice(0, 10).replace(/-/g, ".");
    // 신규 공지사항 데이터에 이미지 경로 추가
    notices.push({
      id: notices.length + 1,
      author: '작성자',
      title: title,
      content: content,
      date: today,
      image: image
    }); // 이미지 경로 또는 이름 추가하는 부분 닫는 괄호가 누락되었습니다.

    // Ajax 요청을 추가합니다.
    $.ajax({
      type: "POST",
      url: "/getNoticeDetail", // 서버의 공지사항 추가 처리 URL
      data: JSON.stringify({
        nSubject: title,
        nContent: content,
        nWriter: '작성자', // 실제 사용 시에는 현재 사용자를 나타내는 데이터를 사용해야 합니다.
        nCreateTime: today // 서버에서 LocalDateTime으로 파싱이 가능한 형식이어야 합니다.
      }),
      contentType: "json; charset=utf-8",
      dataType: "json",
      success: function(response) {
        console.log("공지사항이 성공적으로 추가되었습니다.", response);
      },
      error: function(xhr, status, error) {
        console.error("공지사항 추가 실패:", error);
      }
    });

    document.getElementById("imageUpload").addEventListener("change", function() {
      var preview = document.getElementById("imagePreview");
      preview.innerHTML = ''; // 이전 미리보기 초기화
      var file = this.files[0];
      if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
          var img = document.createElement("img");
          img.setAttribute("src", e.target.result);
          img.setAttribute("style", "max-width: 500px; max-height: 500px;");
          preview.appendChild(img);
        };
        reader.readAsDataURL(file);
      }
    });

    document.getElementById("writeModal").style.display = "none";
    // 작성 후 입력 필드 초기화
    document.getElementById("title").value = "";
    document.getElementById("content2").value = "";
    // 새로운 공지사항을 포함하여 목록을 다시 표시
    displayNotices(currentPage);
  });

  // 초기 페이지 로딩 시 첫 번째 페이지의 공지사항을 표시합니다.
  displayNotices(currentPage);
});

let notices = Array.from({length: 0}, (_, i) => ({id: i + 1, author: '작성자', title: `제목`, date: new Date().toISOString().slice(0, 10).replace(/-/g, ".")}));
let currentPage = 1; // 현재 페이지
const noticesPerPage = 10; // 페이지당 공지사항 수

function displayNotices(page) {
  const tbody = document.querySelector(".type1 tbody");
  tbody.innerHTML = ""; // 기존 목록을 비웁니다.

  // 페이지에 맞는 공지사항 분할
  const startIndex = (page - 1) * noticesPerPage;
  const endIndex = startIndex + noticesPerPage;
  const noticesToDisplay = notices.slice(startIndex, endIndex);

  // 테이블에 공지사항 목록 추가
  noticesToDisplay.forEach((notice, index) => {
    const row = tbody.insertRow();
    const cell1 = row.insertCell(0);
    const cell2 = row.insertCell(1);
    const cell3 = row.insertCell(2);
    const cell4 = row.insertCell(3);

    cell1.innerText = startIndex + index + 1;
    cell2.innerText = notice.author;
    // 제목에 클릭 이벤트 리스너 추가
    const title = document.createElement('a');
    title.href = 'javascript:void(0);'; // 클릭 시 페이지 리로드 방지
    title.innerText = notice.title;
    title.addEventListener('click', function() {
      // 공지사항 상세 페이지로 이동하는 로직
      // 예: sessionStorage를 사용하여 공지사항 데이터를 임시 저장
      sessionStorage.setItem('noticeTitle', notice.title);
      sessionStorage.setItem('noticeDate', notice.date);
      sessionStorage.setItem('noticeContent', notice.content);
      sessionStorage.setItem('noticeImage', notice.image);
      // 상세 페이지로 이동
      window.location.href = 'NoticeDetail'; // 상세 페이지의 URL

      var noticeContentElement = document.createElement('div');
      noticeContentElement.classList.add('notice-content');
      noticeContentElement.innerText = notice.content; // 공지사항 내용을 설정
      // 상세 페이지의 적절한 위치에 noticeContentElement를 추가하는 코드가 필요합니다.

    });
    cell3.appendChild(title);
    cell4.innerText = notice.date;

    // 생성된 번호와 작성자에 클래스 적용
    cell1.classList.add("center-align");
    cell2.classList.add("center-align");
    cell3.classList.add("left-align");
    cell4.classList.add("center-align");
  });

  updatePagination();
}

function updatePagination() {
  const pagination = document.querySelector(".paginate span");
  const prevButton = document.querySelector(".paginate .prev");
  const nextButton = document.querySelector(".paginate .next");

  pagination.innerHTML = ""; // 기존 페이지 번호를 비웁니다.

  const totalPages = Math.ceil(notices.length / noticesPerPage);

  if (currentPage > 1) {
    prevButton.style.display = "inline-block"; // 현재 페이지가 1보다 크면 이전 버튼 보이기
  } else {
    prevButton.style.display = "none"; // 현재 페이지가 1이면 이전 버튼 숨기기
  }

  if (currentPage < totalPages) {
    nextButton.style.display = "inline-block"; // 현재 페이지가 마지막 페이지보다 작으면 다음 버튼 보이기
  } else {
    nextButton.style.display = "none"; // 현재 페이지가 마지막 페이지이면 다음 버튼 숨기기
  }

  // 이전 버튼 클릭 이벤트
  prevButton.addEventListener("click", function(e) {
    e.preventDefault();
    currentPage -= 1; // 현재 페이지를 1 감소
    displayNotices(currentPage); // 페이지를 다시 로드
    updatePagination(); // 페이지네이션 업데이트
  });

  // 다음 버튼 클릭 이벤트
  nextButton.addEventListener("click", function(e) {
    e.preventDefault();
    currentPage += 1; // 현재 페이지를 1 증가
    displayNotices(currentPage); // 페이지를 다시 로드
    updatePagination(); // 페이지네이션 업데이트
  });

  for (let i = 1; i <= totalPages; i++) {
    const pageLink = document.createElement("a");
    pageLink.href = "#";
    pageLink.innerText = i;
    pageLink.addEventListener("click", function(e) {
      e.preventDefault();
      currentPage = i;
      displayNotices(currentPage);
      updatePagination(); // 페이지네이션 업데이트
    });

    if (i === currentPage) {
      const strong = document.createElement("strong");
      strong.innerText = i;
      pagination.appendChild(strong);
    } else {
      pagination.appendChild(pageLink);
    }
  }
}