
//review View
//review ,comment 동적생성
$(function(){

	const commentImageURL = '/review/icon/like.png';

	$.ajax({
		type : 'post',
		url : 'getReviewView',
		data : {"no" : B_NO},
		dataType : 'JSON',
		success : function(data) {
			const dto = data.reviewDTO;
			reviewViewInput(dto.b_TITLE, dto.mem_NO, dto.b_CREATETIME, dto.b_VIEW, dto.b_CONTENT, dto.b_like);
			const commentList = data.commentList;
			if(commentList.length === 0) {
				$('#commentConsole').text("댓글이 없습니다.")
			}else{
				$.each(commentList, function (idx, item) {

					createComment(commentImageURL, 'userId', item.c_CONTENT, item.c_CREATETIME);

				})
			}
		},
		error : function(e){
			console.log(e);
		}

	})
})

function reviewViewInput(B_TITLE,MEM_NO,B_CREATETIME,B_VIEW,B_CONTENT,B_like){
	$('#reviewTitle').text(B_TITLE);
	$('#reviewInfo #userId').text(MEM_NO);
	$('#reviewInfo #date').text(B_CREATETIME);
	$('#reviewInfo #view').text(B_VIEW);
	$('#reviewContent').html(B_CONTENT);
	$('.reviewLike').text(B_like);
}
//

//좋아요 버튼 클릭시
$('#reviewlike button').click(function(){
	var like = Number($('.reviewLike').text());
	$.ajax({
		type : "POST",
		url : "clickLike",
		data : { "no" : B_NO },
		success:function(data){
			console.log("성공");
			$('.reviewLike').text(like+1);
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

	const comment = $("#commentText").val();
	if (comment === "") {
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

