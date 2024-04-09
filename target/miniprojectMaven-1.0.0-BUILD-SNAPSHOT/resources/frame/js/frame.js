/*header*/
// 메뉴바 시작
function toggleNavSections() {
  var navSection = document.querySelector('.nav_section');
  navSection.classList.toggle('show');
}



/*contnent*/
/*nav*/


$(function() {
	$(".nav-content").hide();

	$("#nadeuliNav > li").click(function(event) { // event 매개변수 추가
		$(this).children(".nav-content").slideToggle(300);
		event.stopPropagation();
	});
	$(".nav-content").click(function(event) {
		event.stopPropagation();
	});
});


/*로그인 페이지 */
$("#loginBtn").click(function(){
	window.location.href="/miniProject/member/login.jsp";
} );
/*회원가입페이지 */
$("#JoinBtn").click(function(){
	window.location.href="/miniProject/member/memberJoin.jsp";
} );
/*page content*/


/*footer*/
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

/*site map*/
function goToSite1() {
	var selectedSite1 = document.getElementById('site-select1').value;
	if (selectedSite1 != "") {
		window.open(selectedSite1, '_blank'); // 새 탭에서 선택한 사이트를 엽니다.
	}
}
function goToSite2() {
	var selectedSite2 = document.getElementById('site-select2').value;
	if (selectedSite2 != "") {
		window.open(selectedSite2, '_blank'); // 새 탭에서 선택한 사이트를 엽니다.
	}
}
/*main footer*/
