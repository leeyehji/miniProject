var btnOpenModal = $(".btn-open-modal");
var modal = $("#modal");

btnOpenModal.click(function () {
    window.scrollTo(0, 0);
    var text = $("#detailTitle > h1").text();
    $("#modalTitle").val(text);
    $("#modal").css("display", "block");
});

$("#save").click(function () {
    $("#modal").css("display", "none");
});
$("#cancel").click(function () {

    $("#modal").css("display", "none");
});

function inputData(themaDTO) {
    $('#detailTitle h1').text(themaDTO.t_CONTENTNAME);
    $('#detailTitle h5').text(themaDTO.t_ADDRESS);
    $('#detailTitle h3').text("임시 정보");
    $('#detailImg img').attr("src", themaDTO.t_MAIN_IMAGE);
    $('#detailContents').html(themaDTO.t_INFORMATION);
    $('#detailInfo #homepage').html(themaDTO.t_HOMEPAGE);
    $('#detailInfo #phone').text(themaDTO.t_PHONE);
    $('#detailFoot #view span').text(themaDTO.t_VIEW);
    $('#detailFoot #like span').text(themaDTO.t_LIKE);

    //thema 별 상세정보
    if (themaDTO.t_CONTENTTYPEID === 12) {
        themaTwelve(themaDTO.typeTwelve);
    }
    if (themaDTO.t_CONTENTTYPEID === 14) {
        themaFourteen(themaDTO.typeFourteen);
    }
    if (themaDTO.t_CONTENTTYPEID === 15){
        themaFifteen(themaDTO.typeFifteen);
    }

}

function themaTwelve(themaTypeData) {

    if (themaTypeData.a_chkbabycarriage !== "없음") {
        $('#stoller').removeClass("noAllow");
    }
    if (themaTypeData.a_chkpet !== "불가") {
        $('#pet').removeClass("noAllow");
    }

    if (themaTypeData.a_parking !== null && themaTypeData.a_parking !== "없음" && themaTypeData.a_parking !== "") {
        $('#parking').removeClass("noAllow")
            .attr("title", themaTypeData.a_parking);
    }
    if ($('#detailInfo #phone').text() === "") {
        $('#detailInfo #phone').html(themaTypeData.a_infocenter);
    }

    const result = ` <td>*휴무일</td>
 								<td>`
        + themaTypeData.a_restdate + `</td>
								<td>*이용시간</td>
								<td>`
        + themaTypeData.a_usetime +
        `</td> `;

    $('#themaData').append(result);
}

function themaFourteen(themaTypeData) {

    if (themaTypeData.a_chkbabycarriageculture !== "없음") {
        $('#stoller').removeClass("noAllow");
    }
    if (themaTypeData.a_chkpetculture !== "불가") {
        $('#pet').removeClass("noAllow");
    }

    if (themaTypeData.a_parking !== null && themaTypeData.a_parking !== "없음" && themaTypeData.a_parking !== "") {
        $('#parking').removeClass("noAllow")
            .attr("title", themaTypeData.a_parkingculture + " " + themaTypeData.a_parkingfee);
    }
    if ($('#detailInfo #phone').text() === "") {
        $('#detailInfo #phone').html(themaTypeData.a_infocenterculture);
    }

    let resultCultureTd = ` <td>*휴무일</td>
 								<td>`
        + themaTypeData.a_restdateculture + `</td>
								<td>*이용시간</td>
								<td>`
        + themaTypeData.a_usetimeculture +
        `</td> `;
    let resultCultureTd2 = `<td>*이용 요금</td>
									<td>`
        + themaTypeData.a_usefee + `</td>
                                    <td>*기타 정보</td>
                                    <td>없음</td>`

    $('#themaData').append(resultCultureTd);
    $('#themaData2').append(resultCultureTd2);
}
function themaFifteen(themaTypeData){

    let resultFestivalTd = ` <td>*시작 일자</td>
 								<td>`
        + themaTypeData.a_eventstartdate + `</td>
								<td>*종료 일자</td>
								<td>`
        + themaTypeData.a_eventenddate +
        `</td> `;
    let resultFestivalTd2 = `<td>*이벤트 장소</td>
									<td>`
        + themaTypeData.a_eventplace + `</td>
                                    <td>*이용 시간</td>
                                    <td>`
                                 +themaTypeData.a_playtime+`</td>`
    let resultFestivalTd3 =`<td colspan="2">* 주요 컨텐츠 </td>
									<td colspan="2">`
        + themaTypeData.f_CONTENT + `</td>`
    if($('#detailContents').text === ""){
        $('#detailContents').html(themaTypeData.f_SUBJECT +"<br>"+themaTypeData.f_CONTENT)
    }
    $('#themaData').append(resultFestivalTd);
    $('#themaData2').append(resultFestivalTd2);
    $('#themaData3').append(resultFestivalTd3)
}






$('#detailFoot #like').click(function () {
    var like = Number($('#detailFoot #like span').text());
    $.ajax({
        type: "POST",
        url: "themaLikeUp",
        data: {"contentNo": $('#T_CONTENTNO').val()},
        success: function (data) {
            if (data === "firstClick") {
                $('#detailFoot #like span').text(like + 1);
            } else {
                alert("좋아요는 1일 1회 클릭 가능합니다.")
            }

        }, error: function () {
            consoel.log(e);
        }
    })

})