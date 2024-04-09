


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