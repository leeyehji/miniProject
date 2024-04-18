
//review View
//review ,comment 동적생성
$(function(){



	$.ajax({
		type : 'post',
		url : 'getReviewView',
		data : {"no" : B_NO},
		dataType : 'JSON',
		success : function(data) {
			console.log(JSON.stringify(data))

			$(".prevView").attr("onclick","prevView("+data.prevViewNo+")")
			$(".nextView").attr("onclick","nextView("+data.nextViewNo+")")


			const dto = data.reviewDTO;
			reviewViewInput(dto.b_TITLE, dto.mem_ID, dto.b_CREATETIME, dto.b_VIEW, dto.b_CONTENT, dto.b_LIKE);
			if(data.isLogin === "false"){
				$('.myArticle').hide();
				$('#commentBtn').attr("value","로그인");
			}else if(data.isLogin !== dto.mem_ID){
				$('.myArticle').hide();
			}else if(data.isLogin === dto.mem_ID){
				$('.myArticle').show();
			}
			const commentList = data.commentList;
			if(commentList.length === 0) {
				$('#commentConsole').text("댓글이 없습니다.")
			}else{
				let commentImageURL = "https://kr.object.ncloudstorage.com/miniproject/storage/profile/defaultProfileImage.png";
				$.each(commentList, function (idx, item) {
					if(item.mem_PROFILEIMAGE !== null){
						commentImageURL = item.mem_PROFILEIMAGE;
					}
					createComment(commentImageURL, item.mem_ID, item.c_CONTENT, item.c_CREATETIME);

				})
			}
		},
		error : function(e){
			console.log(e);
		}

	})
})

function reviewViewInput(B_TITLE,MEM_ID,B_CREATETIME,B_VIEW,B_CONTENT,B_LIKE){
	$('#reviewTitle').text(B_TITLE);
	$('#reviewInfo #userId').text(MEM_ID);
	$('#reviewInfo #date').text(B_CREATETIME);
	$('#reviewInfo #view').text(B_VIEW);
	$('#reviewContent').html(B_CONTENT);
	$('.reviewLike').text(B_LIKE);
}
//

//좋아요 버튼 클릭시
$('#reviewlike button').click(function(){
	const like = Number($('.reviewLike').text());
	$.ajax({
		type : "POST",
		url : "clickLike",
		data : { "no" : B_NO },
		success:function(data){

			if(data === "firstClick") {
				$('.reviewLike').text(like + 1);
			}
			else{
				alert("좋아요는 1일 1회 클릭 가능합니다.")
			}
		},
		error : function(e){
			console.log("실패");
		}

	})
})
//

//comment 틀 생성
function createComment(imageURL, USERID, commentContent, commentDate) {

	var result = `<tr>
					<td colspan="2" style='padding:10px'></td>
				  </tr>
					<tr>
					<td rowspan="4" id="imgTd"> <img src="`
		+ imageURL +
		`" alt="이미지"> </td>
				  </tr>
				  
				  <tr>
				  	<td colspan="2">작성자 :
				  		<span id="commentUserId">`
		+ USERID +
		`</span>
					</td>
				  </tr>
				  
				  <tr>
					<td colspan="2">
						<span id="commentContent">`
		+ commentContent +
		`</span>
					</td>
				  </tr>
				  <tr>
					<td colspan="2" >
						<span id="commentDate">`
		+ commentDate +
		`</span>
					</td>
				  </tr>
				  <tr id="commentTr">
					<td colspan="2" style='padding:10px'></td>
				  </tr>`

	$('#commentConsole #commentTable').append(result);

}
//틀 생성 종료

//댓글 insert
$("#commentBtn").click(function() {
	const commentBtnVal = $('#commentBtn').val();

	const comment = $("#commentText").val();
	if(commentBtnVal === "로그인"){
		if(confirm("로그인 하시겠습니까?")){
			location.href="/member/loginForm";
		}
	}
	else if (comment === "") {
		alert("댓글을 입력해주세요");
		return false;
	} else {

		$.ajax({
			type: 'POST',
			url: 'commentWrite',
			data: {
				'B_NO': B_NO,
				'C_CONTENT': comment
			},
			success: function (data) {

				location.reload();
			},
			error: function (e) {
				console.log(e)
			}

		})
	}
})


//- End Comment

