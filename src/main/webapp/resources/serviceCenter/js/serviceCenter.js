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
    document.getElementById("writeNoticeBtn").addEventListener("click", function () {
        document.getElementById("writeModal").style.display = "block";
    });
    document.getElementById("closeBtn").addEventListener("click", function () {
        document.getElementById("writeModal").style.display = "none";
        // 입력 필드 초기화
        document.getElementById("subject").value = "";
        document.getElementById("content").value = "";
    });
    document.getElementById("submitBtn").addEventListener("click", function () {
        var subject = document.getElementById("subject").value;
        var content = document.getElementById("content").value;
        // 제목과 내용이 비어있는지 확인
        if (subject === "" || content === "") {
            alert("제목과 내용을 모두 입력해주세요.");
            return; // 추가 로직을 실행하지 않고 함수 종료
        }

    })
});
