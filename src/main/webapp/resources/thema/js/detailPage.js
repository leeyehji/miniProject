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
    if (themaDTO.t_CONTENTTYPEID === 15) {
        themaFifteen(themaDTO.typeFifteen);
    }
    if (themaDTO.t_CONTENTTYPEID === 28) {
        themaTwoEight(themaDTO.typeTwoEight);
    }
    if (themaDTO.t_CONTENTTYPEID === 32) {
        themaThirtyTwo(themaDTO.typeThirtyTwo)
    }
    if (themaDTO.t_CONTENTTYPEID === 38){
        themaThirtyEight(themaDTO.typeThirtyEight)
    }
    if (themaDTO.t_CONTENTTYPEID === 39){
        themaThirtyNine(themaDTO.typeThirtyNine)
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

    if (themaTypeData.a_parkingculture !== null && themaTypeData.a_parkingculture !== "없음" && themaTypeData.a_parkingculture !== "") {
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

function themaFifteen(themaTypeData) {

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
        + themaTypeData.a_playtime + `</td>`
    let resultFestivalTd3 = `<td colspan="2">* 주요 컨텐츠 </td>
									<td colspan="2">`
        + themaTypeData.f_CONTENT + `</td>`
    if ($('#detailContents').text === "") {
        $('#detailContents').html(themaTypeData.f_SUBJECT + "<br>" + themaTypeData.f_CONTENT)
    }
    $('#themaData').append(resultFestivalTd);
    $('#themaData2').append(resultFestivalTd2);
    $('#themaData3').append(resultFestivalTd3)
}

function themaTwoEight(themaTypeData) {

    if (themaTypeData.a_chkbabycarriageleports !== "없음") {
        $('#stoller').removeClass("noAllow");
    }
    if (themaTypeData.a_chkpetleports !== "불가" && themaTypeData.a_chkpetleports !== "없음") {
        $('#pet').removeClass("noAllow");
    }

    if (themaTypeData.a_parkingleports !== null && themaTypeData.a_parkingleports !== "없음" && themaTypeData.a_parkingleports !== "") {
        $('#parking').removeClass("noAllow")
            .attr("title", themaTypeData.a_parkingleports);
    }
    if ($('#detailInfo #phone').text() === "") {
        $('#detailInfo #phone').html(themaTypeData.a_infocenterleports);
    }
    let resultLeportsTd = ` <td>*예약 방법</td>
 								<td>`
        + themaTypeData.a_reservation + `</td>
								<td>*기타</td>
								<td>`
        + "없음" +
        `</td> `;
    let resultLeportsTd2 = `<td>*휴일</td>
									<td>`
        + themaTypeData.a_restdateleports + `</td>
                                    <td>*이용 시간</td>
                                    <td>`
        + themaTypeData.a_usetimeleports + `</td>`
    $('#themaData').append(resultLeportsTd);
    $('#themaData2').append(resultLeportsTd2);
}

function themaThirtyTwo(themaTypeData) {


    if (themaTypeData.a_parkinglodging !== null && themaTypeData.a_parkinglodging !== "없음" && themaTypeData.a_parkinglodging !== "" && themaTypeData.a_parkinglodging !== "불가능" && themaTypeData.a_parkinglodging !== "불가") {
        $('#parking').removeClass("noAllow")
            .attr("title", themaTypeData.a_parkinglodging);
    }
    if ($('#detailInfo #phone').text() === "") {
        $('#detailInfo #phone').html(themaTypeData.a_infocenterlodging);
    }

    let resultLodgingTd = ` <td>*예약 방법</td>
 								<td>`
        + themaTypeData.a_reservationlodging + `</td>
								<td>*예약 사이트</td>
								<td>`
        + themaTypeData.a_reservationurl +
        `</td> `;
    let resultLodgingTd2 = `<td>*체크인 시간</td>
									<td>`
        + themaTypeData.a_checkintime + `</td>
                                    <td>*체크아웃 시간</td>
                                    <td>`
        + themaTypeData.a_checkouttime + `</td>`
    let resultLodgingTd3 = `<td>*식사 장소</td>
									<td>`
        + themaTypeData.a_foodplace + `</td>
                                    <td>*부대 시설</td>
                                    <td>`
        + themaTypeData.a_subfacility + `</td>`
    let resultLodgingTd4 = `<td>*객실 개수</td>
									<td>`
        + themaTypeData.a_roomcount + `</td>
                                    <td>*객실 형태</td>
                                    <td>`
        + themaTypeData.a_roomtype + `</td>`
    
    $('#themaData').append(resultLodgingTd);
    $('#themaData2').append(resultLodgingTd2);
    $(document).find('#themaData a').text("예약 사이트로 이동")
    $('#themaData3').append(resultLodgingTd3);
    $('#themaData4').append(resultLodgingTd4);
}

function themaThirtyEight(themaTypeData){
    console.log(themaTypeData);
    if (themaTypeData.a_chkbabycarriageshopping !== "없음" && themaTypeData.a_chkbabycarriageshopping !== "") {
        $('#stoller').removeClass("noAllow");
    }
    if (themaTypeData.a_chkpetshopping !== "불가" && themaTypeData.a_chkpetshopping !== "없음"  && themaTypeData.a_chkbabycarriageshopping !== "") {
        $('#pet').removeClass("noAllow");
    }

    if (themaTypeData.a_parkingshopping !== null && themaTypeData.a_parkingshopping !== "없음" && themaTypeData.a_parkingshopping !== "") {
        $('#parking').removeClass("noAllow")
            .attr("title", themaTypeData.a_parkingshopping);
    }
    if ($('#detailInfo #phone').text() === "") {
        $('#detailInfo #phone').html(themaTypeData.a_infocentershopping);
    }

    let resultShoppingTd = ` <td>*여는 날</td>
 								<td>`
        + themaTypeData.a_fairday + `</td>
								<td>*오픈 시간</td>
								<td>`
        + themaTypeData.a_opentime +
        `</td> `;
    let resultShoppingTd2 = `<td>*쉬는 날</td>
									<td>`
        + themaTypeData.a_restdateshopping + `</td>
                                    <td>*카드 사용 가능 여부</td>
                                    <td>`
        + themaTypeData.a_chkcreditcardshopping + `</td>`
    let resultShoppingTd3 = `<td>*취급 상품</td>
									<td>`
        + themaTypeData.a_saleitem + `</td>
                                    <td>*환급 서비스</td>
                                    <td>`
        + themaTypeData.a_shopguide + `</td>`

    $('#themaData').append(resultShoppingTd);
    $('#themaData2').append(resultShoppingTd2);
    $('#themaData3').append(resultShoppingTd3);

}
function themaThirtyNine(themaTypeData){
    console.log(themaTypeData);
    $('#stoller').removeClass("noAllow");
    $('#pet').removeClass("noAllow");

    if (themaTypeData.parkingfood !== null && themaTypeData.parkingfood !== "없음" && themaTypeData.parkingfood !== "") {
        $('#parking').removeClass("noAllow")
            .attr("title", themaTypeData.a_parkingshopping);
    }
    if ($('#detailInfo #phone').text() === "") {
        $('#detailInfo #phone').html(themaTypeData.infocenterfood);
    }
    let resultFoodTd = `<td>*오픈 시간</td>
								<td>`
        + themaTypeData.opentimefood +
        `</td> 
								<td>*쉬는 날</td>
									<td>`
        + themaTypeData.restdatefood + `</td>`;

    if(themaTypeData.kidsfacility === "0"){
        themaTypeData.kidsfacility = "없음"
    }

    let resultFoodTd2 =
                                    `<td>*카드 가능 여부</td>
                                    <td>`
        + themaTypeData.chkcreditcardfood +  `</td>
                                    <td>*흡연 가능 여부</td>
                                    <td>`
        + themaTypeData.smoking + `</td>
                                    <td>*어린이 시설</td>
                                    <td>`
        + themaTypeData.kidsfacility + `</td>`

    let resultFoodTd3 =
                                   `<td>*좌석</td>
                                    <td>`
        + themaTypeData.seat +  `</td>
                                    <td>*할인</td>
                                    <td>`
        + themaTypeData.discountinfofood + `</td>
                                    </td>
                                    <td>*포장</td>
                                    <td>`
        + themaTypeData.packing + `</td>`

    let resultFoodTd4 =
        `<td>*메인 메뉴</td>
                                    <td>`
        + themaTypeData.treatmenu +  `</td>
                                    <td colspan="2">*취급 메뉴</td>
                                    <td>`
        + themaTypeData.treatmenu + `</td>`



    $('#themaData').append(resultFoodTd);
    $('#themaData2').append(resultFoodTd2);
    $('#themaData3').append(resultFoodTd3);
    $('#themaData4').append(resultFoodTd4);

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