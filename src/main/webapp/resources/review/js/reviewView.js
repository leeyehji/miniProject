
//review View
$(function(){
	$.ajax({
		type : 'post',
		url : 'getReviewView',
		data : {"no" : B_NO},
		dataType : 'JSON',
		success : function(data){
			console.log(JSON.stringify(data));
			reviewViewInput(data.b_TITLE,data.mem_NO,data.b_CREATETIME,data.b_VIEW,data.b_CONTENT,data.b_like);
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


//-Comment 동적 생성
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


$("#commentBtn").click(function() {
	let today = new Date();

	var comment = $("#commentText").val();
	var imageURL = '../icon/like.png';
	var USERID = $('#commentWrite #userID').val();
	var commentDate = today;
	if (comment == "") {
		alert("댓글을 입력해주세요");
		return false;
	} else (

		createComment(imageURL, USERID, comment, commentDate)

	)
})


//- End Comment