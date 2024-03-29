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
    top: document.body.scrollTop,
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
  if (footerPosition.top < window.innerHeight) {
    toBottomBtn.style.display = 'none'; // 버튼 숨김
  } else {
    toBottomBtn.style.display = 'block'; // 버튼 표시
  }
});
//빈

// 스크롤 시 버튼 디스플레이 로직을 처리하는 함수
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

// 스크롤 이벤트에 함수 연결
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


// mulslide.js

var slides = document.querySelector('.slides'),
  slide = document.querySelectorAll('.slides li'),
  currentIdx = 0,
  slideCount = slide.length,
  slideWidth = 300,
  slideMargin = 30,
  prevBtn = document.querySelector('.prev'),
  nextBtn = document.querySelector('.next'),
  moveLeftBtn = document.querySelector('.move-left'),
  moveRightBtn = document.querySelector('.move-right');

slides.style.width =
  (slideWidth + slideMargin) * slideCount - slideMargin + 'px';

function moveSlide(num) {
  slides.style.left = -num * 330 + 'px';
  currentIdx = num;
}

nextBtn.addEventListener('click', function () {
  if (currentIdx < slideCount - 3) {
    moveSlide(currentIdx + 1);
  } else {
    moveSlide(0);
  }
});

prevBtn.addEventListener('click', function () {
  if (currentIdx > 0) {
    moveSlide(currentIdx - 1);
  } else {
    moveSlide(slideCount - 3);
  }
});

// 좌 우로 이동하는 버튼 동작 추가
moveLeftBtn.addEventListener('click', function () {
  if (currentIdx > 0) {
    moveSlide(currentIdx - 1);
  } else {
    moveSlide(slideCount - 3);
  }
});

moveRightBtn.addEventListener('click', function () {
  if (currentIdx < slideCount - 3) {
    moveSlide(currentIdx + 1);
  } else {
    moveSlide(0);
  }
});
//  mulslide.js

// slide.js
let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) { slideIndex = 1 }
  if (n < 1) { slideIndex = slides.length }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}
// slide.js

//캘린더-------------------------------------------------------------------------------------

$.datepicker.setDefaults({
  dateFormat: 'yy년 mm월 dd일',
  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  showMonthAfterYear: true,
  yearSuffix: '년'
});

$(document).ready(function () {
  $("#datepicker").datepicker({
    onSelect: function (dateText) {
      $("#selectDate").text("선택한 날짜: " + dateText);
    }
  });
});

// $(document).ready(function() {
//   $("ui-datepicker-calendar").datepicker({
//     onSelect: function() {
//       var selectedDate = $(this).datepicker('getDate'); // 선택된 날짜 가져오기
//       var day = selectedDate.getDate(); // 일
//       var month = selectedDate.getMonth() + 1; // 월 (0부터 시작하므로 1을 더함)
//       var year = selectedDate.getFullYear(); // 연
//       var dayOfWeek = selectedDate.getDay(); // 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)

//       // 요일 이름 배열에서 해당 요일 이름을 가져옵니다.
//       var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
//       var dayName = dayNames[dayOfWeek];

//       // 선택된 날짜 정보를 DIV에 출력합니다.
//       $(".ui-datepicker-header.ui-widget-header.ui-helper-clearfix.ui-corner-all").text(`${year}년 ${month}월 ${day}일 ${dayName}요일`);
//     }
//   });
// });

$(function () {
  // 기존에 설정된 datepicker에 대한 참조를 저장
  var originalOnSelect = $("#datepicker").datepicker("option", "onSelect");

  // 새로운 onSelect 핸들러를 설정
  $("#datepicker").datepicker("option", "onSelect", function (dateText, inst) {
    var dateComponents = dateText.replace(/년|월|일/g, "").split(" ");
    var year = parseInt(dateComponents[0], 10);
    var month = parseInt(dateComponents[1], 10) - 1;
    var day = parseInt(dateComponents[2], 10);
    var date = new Date(year, month, day);
    var weekdays = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekday = weekdays[date.getDay()];
    // 기존 onSelect 핸들러 호출
    if (originalOnSelect) originalOnSelect(dateText, inst);

    // 새로운 로직 추가
    $("#cldout").text("" + dateText + " " + weekday);
  });
});

//캘린더