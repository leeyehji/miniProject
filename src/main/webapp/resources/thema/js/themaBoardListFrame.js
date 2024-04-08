/*
 
 */
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/thema/getThemaList',
		data: {'pg': $('#pg').val()},
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				
				var result=`<div class="boxContent">`
								+`<div class="themaBoard">`
								+`<div class="themaBoardImg">`+items.img+`</div>`
								+`<div class="vertical-container">`
									+`<div class="themaTitle"><a href="/miniProject/detail/detailPage.jsp?seq=`+items.seq+`">경복궁</a></div>`
									+`<br><div class="themaText">`+items.content+`</div><br>`
									+`<div class="themaAddress>"`+items.zipcode+`</div></div></div></div>`;
				$('#박스만들어').append(result);
			}); //$.each
			
			//페이징 처리
			$('#boardButtons').html(data.userPaging.pagingHTML);

			//글을 클릭했을 때 해당 글 상세 페이지로 이동
			$('.themaBoard').click(function(){
				//alert('seq = ' + $(this).text());
								
				location.href = '/miniProject/detail/detailPage.jsp?seq=' + $(this).text() + '&pg=' + $('#pg').val();
			});//themaBoard.click
		},error: function(e){
			console.log(e);
		}
	}); //$.ajax
	
	//태그 선택 시 출력 list 변화
	$('.themaTag').click(function(){
		//기존 리스트 날리고
		
		//새로운 리스트 할당
		
		//전체보기 태그 클릭 시 
		location.href='/miniProject/thema/themaBoardList.jsp?pg=1';
		
	});//.themaTag.click
	
});