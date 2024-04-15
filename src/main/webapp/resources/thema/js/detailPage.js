var btnOpenModal = $(".btn-open-modal");
var modal = $("#modal");

btnOpenModal.click(function() {
	window.scrollTo(0, 0);
	var text = $("#detailTitle > h1").text();
	$("#modalTitle").val(text);
	$("#modal").css("display", "block");
});

$("#save").click(function() {
	$("#modal").css("display", "none");
});
$("#cancel").click(function() {

	$("#modal").css("display", "none");
});
function inputData(themaDTO){
	$('#detailTitle h1').text(themaDTO.t_CONTENTNAME);
	$('#detailTitle h5').text(themaDTO.t_ADDRESS);
	$('#detailTitle h3').text("임시 정보");
	$('#detailImg img').attr("src",themaDTO.t_MAIN_IMAGE);
	$('#detailContents').html(themaDTO.t_INFORMATION);
	$('#detailInfo #homepage').html(themaDTO.t_HOMEPAGE);
	$('#detailInfo #phone').text(themaDTO.t_PHONE);
	$('#detailFoot #view span').text(themaDTO.t_VIEW);
	$('#detailFoot #like span').text(themaDTO.t_LIKE);

	//thema 별 상세정보 
	if(themaDTO.t_CONTENTTYPEID === 12){
		 themaTwelve(themaDTO.typeTwelve);
	}
	
	
}

function themaTwelve(themaTypeData){
		console.log(JSON.stringify(themaTypeData));
		if(themaTypeData.a_chkbabycarriage !== "없음"){
			$('#stoller').removeClass("noAllow");
		}
		if(themaTypeData.a_chkpet !== "불가"){
			$('#pet').removeClass("noAllow");
		}

		if(themaTypeData.a_parking !== null && themaTypeData.a_parking !== "없음" && themaTypeData.a_parking !== ""){
			$('#parking').removeClass("noAllow")
						 .attr("title",themaTypeData.a_parking);
		}
		if($('#detailInfo #phone').text() === ""){
			$('#detailInfo #phone').text(themaTypeData.a_infocenter);
		}

		const result = `
								<td colspan="2">*이용시간</td>
								<td>`
							        +themaTypeData.a_usetime+
			  					`</td> `;

		$('#themaData').append(result);
}






$('#detailFoot button').click(function(){
	var like = Number($('#detailFoot #like span').text());
	$.ajax({
		type : "POST",
		url : "themaLikeUp",
		data : {"contentNo" : $('#T_CONTENTNO').val() },
		success : function(){
			$('#detailFoot #like span').text(like+1);
		}, error : function(){
			consoel.log(e);
		}
	})

})