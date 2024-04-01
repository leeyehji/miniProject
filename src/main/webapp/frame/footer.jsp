<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<footer>
	<div id="siteMap">
		<div class="selectBox">
			<select id="site-select1" class="site-select">
				<option value="">관광 사이트 선택...</option>
				<option value="https://korean1.visitkorea.or.kr/kor/tt/pr_gallery/new_photo_gallery/main/main_ssot.jsp">관광사진갤러리</option>
				<option value="https://korean.visitkorea.or.kr/notice/guide_book.do">가이드북</option>
				<option value="https://www.wififree.kr/index.do">공공와이파이</option>
				<option value="https://www.templestay.com/">템플스테이</option>
				<option value="https://api.visitkorea.or.kr/#/">TourAPI4.0</option>
				<option value="https://conlab.visitkorea.or.kr/">한국관광콘텐츠랩</option>
			</select> <span class="siteSelectBtn"><img
				src="https://design-science.or.kr/app/dubu_subcontent/docs/imgs/1586411111_arrow.png"></span>
		</div>
		<button id="goSite1" onclick="goToSite1()">이동</button>
		
		<div class="selectBox">
			<select id="site-select2" class="site-select">
				<option value="">기관 사이트 선택...</option>
				<option value="https://k-mice.visitkorea.or.kr/main.kto?func_name=mainStart">국가mice포털</option>
				<option value="https://www.mmca.go.kr/">국립현대미술관</option>
				<option value="http://www.seoulwelcome.com/">서울관광재단</option>
				<option value="https://www.mcst.go.kr/kor/main.jsp">문화체육관광부</option>
				<option value="https://www.culture.go.kr/wday/index.do">문화가 있는 날</option>
				<option value="https://museumonroad.org/">박물관 길위의 인문학</option>
			</select> 
			<span class="siteSelectBtn">
				<img src="https://design-science.or.kr/app/dubu_subcontent/docs/imgs/1586411111_arrow.png">
			</span>
		</div>
		<button id="goSite2" onclick="goToSite2()">이동</button>
	</div>

	<div id="titcontent">
		<div class="tit">여행 후기를 SNS에 남겨주세요!</div>
		<div class="sns_list">

			<ul>
				<li>
					<a href="http://blog.naver.com" target="_blank" title="새창">
						<span class="icon icon_blog"></span>
						<em class="sns_name">네이버<br />블로그</em>
					</a>
				</li>
				<li>
					<a href="http://post.naver.com" target="_blank" title="새창">
						<span class="icon icon_post"></span>
						<em class="sns_name">포스트</em>
					</a>
				</li>
				<li>
					<a href="https://band.us" target="_blank" title="새창">
						<span class="icon icon_band"></span>
						<em class="sns_name">네이버<br />밴드</em>
					</a>
				</li>
				<li>
					<a href="https://www.facebook.com" target="_blank" title="새창">
						<span class="icon icon_facebook"></span>
						<em class="sns_name">페이스북</em>
					</a>
				</li>
				<li>
					<a href="https://twitter.com" target="_blank" title="새창">
						<span class="icon icon_twitter"></span>
						<em class="sns_name">엑스</em>
					</a>
				</li>
				<li>
					<a href="https://story.kakao.com" target="_blank" title="새창">
						<span class="icon icon_kakaostory"></span>
						<em class="sns_name">카카오<br />스토리</em>
					</a>
				</li>
				<li>
					<a href="https://www.instagram.com" target="_blank" title="새창">
						<span class="icon icon_instagram"></span>
						<em class="sns_name">인스타<br />그램</em>
					</a>
				</li>
			</ul>
		</div>
	</div>



	<div>
		<ul class="btm_menu">
			<li><a href="javascript:" onclick="goTerm(1);" class="personal_info">개인정보처리방침</a></li>
			<li><a href="javascript:" onclick="goTerm(2);">이용약관</a></li><!-- 0703 추가 -->
			<li><a href="javascript:" onclick="goTerm(3);">위치기반서비스 이용약관</a></li><!-- 0717 추가 -->
			<li><a href="" target="_blank" title="새창">저작권정책</a></li>
			<li><a href="" target="_blank" title="새창">고객서비스헌장</a></li>
			<li><a href="" target="_blank" title="새창">전자우편무단수집거부</a></li>
			<li><a href="serviceCenter.html#qna" onclick="goQA();" title="페이지이동">Q&amp;A</a></li>
			<li><a href="" target="_blank" title="새창">찾아오시는 길</a></li>
		</ul>
	</div>

	<div class="badak">
		<p class="cliud_camp">
			<a href="https://naver.com">NCC 미니프로젝트</a>
		</p>
		<div class="TourAPI">
			<a href="https://api.visitkorea.or.kr/#/" id="TourAPI" target="_blank" title="새창"><img
					src="../css/image/Tour_api.png" alt="TourAPI 4.0"></a>
		</div>
	</div>
</footer>
