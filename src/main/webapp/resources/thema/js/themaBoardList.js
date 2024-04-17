/*
 
 */

function themaBoardListDivForm(imageUrl,title,text,address,sido,cat1,cat2,cat3,contentNo,contentTypeId){

    let boxContent = $('<div></div>').addClass("boxContent");

    let themaBoard = $('<div></div>').addClass("themaBoard");

    let themaBoardImg = $('<div></div>').addClass("themaBoardImg");
    let img = $('<img/>').attr("src",imageUrl);
    themaBoardImg.append(img);

    let verticalContainer = $('<div></div>').addClass("vertical-container");

    let themaTitle = $('<div></div>').addClass("themaTitle");
    let titleA = $('<a></a>').attr("href","/thema/themaDetailPage?contentNo="+contentNo+"&typeId="+contentTypeId);
    titleA.html(title);
    themaTitle.append(titleA);

    let themaText = $('<div></div>').addClass("themaText");
    themaText.html(text);

    let themaAddress = $('<div></div>').addClass("themaAddress");
    themaAddress.text(address);

    let themaHashTag = $('<div></div>').attr("id" ,"themaHashTags");

    $.getJSON('/thema/json/data.json', function(data) {
        const hashArr = [sido,cat1,cat2,cat3];

        for(let i=0; i<4 ; i++){
            let nameValue = "";
            data.contentTypeId.forEach(function(type) {
                type.cat1.forEach(function(cat1) {
                    if(cat1.code === hashArr[i]) {
                        nameValue = cat1.name;
                    }
                    cat1.cat2.forEach(function(cat2) {
                        if(cat2.code === hashArr[i]) {
                            nameValue = cat2.name;
                        }
                        cat2.cat3.forEach(function(cat3) {
                            if(cat3.code === hashArr[i]) {
                                nameValue = cat3.name;
                            }
                        });
                    });
                });
            });

            const hashTagSpan = $('<button></button>').addClass("themaHashTag");
            hashTagSpan.text("#"+ (nameValue || hashArr[i]));
            themaHashTag.append(hashTagSpan);
        }
    });

    verticalContainer.append(themaTitle).append(`<br>`)
        .append(themaText).append(`<br>`)
        .append(themaAddress).append(`<br>`)
        .append(themaHashTag);

    themaBoard.append(themaBoardImg).append(verticalContainer);

    boxContent.append(themaBoard);

    $('#themaBoardContentConsole').append(boxContent);
}

function makeSelectData(state,depthArr){
    const makeSelectData = {};
    if(state === "firstOpen"){
        depthArr[0]="";
        depthArr[1]="";
        depthArr[2]="";
        depthArr[3]="";
    }else if(state === "depth1"){
        depthArr[1]="";
        depthArr[2]="";
        depthArr[3]="";
    }else if(state === "depth2"){
        depthArr[2]="";
        depthArr[3]="";
    }else if(state === "depth3"){
        depthArr[3]="";
    }
    makeSelectData["contentTypeId"]=depthArr[0];
    makeSelectData["cat1"]=depthArr[1];
    makeSelectData["cat2"]=depthArr[2];
    makeSelectData["cat3"]=depthArr[3];
    return makeSelectData;
}
function getThemaBoardListAjax(userSelectData){

    $.ajax({
        type:'POST',
        url:"/thema/getThemaBoardList",
        contentType : 'application/json',
        data: JSON.stringify(userSelectData),
        dataType:'JSON',
        success: function(data){

           $.each(data,function(idx,item){
            themaBoardListDivForm(item.t_THUMB_IMAGE,
                item.t_CONTENTNAME,
                item.t_INFORMATION,
                item.t_ADDRESS,
                item.t_SIDO,
                item.t_CAT1,
                item.t_CAT2,
                item.t_CAT3,
                item.t_CONTENTNO,
                item.t_CONTENTTYPEID);
           })
        },
        error:function(e){
            console.log(e)
        }

    })
}
$(function () {
    var depthArr=[];
    getThemaBoardListAjax(makeSelectData("firstOpen",depthArr));

    //1 depth
    $(document).on('change', '#contentTypeId', function () {

        $('#cat1').empty();
        $('#cat2').empty();
        $('#cat3').empty();


        let typeId = $('#contentTypeId').find('option:selected').attr('value');
        depthArr = [typeId];
        categoryAjax('depth1', depthArr);
        $('#themaBoardContentConsole').empty();
        getThemaBoardListAjax(makeSelectData("depth1",depthArr));

    });
    $(document).on('change', '#cat1', function () {

        $('#cat2').empty();
        $('#cat3').empty();

        let typeId = $('#contentTypeId').find('option:selected').attr('value');
        let cat1 = $(this).find('option:selected').attr('value');
        depthArr = [typeId, cat1];
        categoryAjax('depth2', depthArr);
        $('#themaBoardContentConsole').empty();
        getThemaBoardListAjax(makeSelectData('depth2',depthArr));
    });
    //3 depth
    $(document).on('change', '#cat2', function () {

        $('#cat3').empty();

        let typeId = $('#contentTypeId').find('option:selected').attr('value');
        let cat1 =$('#cat1').find('option:selected').attr('value');
        let cat2 = $('#cat2').find('option:selected').attr('value');

        depthArr = [typeId, cat1,cat2];
        categoryAjax('depth3', depthArr);
        $('#themaBoardContentConsole').empty();
        getThemaBoardListAjax(makeSelectData('depth3',depthArr));
    });
    $(document).on('change', '#cat3', function () {
        let typeId = $('#contentTypeId').find('option:selected').attr('value');
        let cat1 =$('#cat1').find('option:selected').attr('value');
        let cat2 = $('#cat2').find('option:selected').attr('value');
        let cat3 = $('#cat3').find('option:selected').attr('value');

        depthArr = [typeId, cat1,cat2,cat3];
        $('#themaBoardContentConsole').empty();
        getThemaBoardListAjax(makeSelectData('depth4',depthArr));
    });

})

function categoryAjax(depth, optionValueCode) {

    $.getJSON({
        type: 'get',
        url: '/thema/json/data.json',
        dataType: 'JSON',
        success: function (data) {
            if (depth === 'depth1') {
                $.each(data.contentTypeId, function (depth1, typeId) {
                    if (typeId.code === optionValueCode[0]) {
                        $('#cat1').append(`<option>대분류 선택</opntion>`);
                        $.each(typeId.cat1, function (depth2, cat1) {

                            const cat1Option = $('<option></option>').attr("value", cat1.code).text(cat1.name);

                            $('#cat1').append(cat1Option)
                        })
                    }
                })
            }

            if (depth === 'depth2') {
                $.each(data.contentTypeId, function (depth1, typeId) {
                    if (typeId.code === optionValueCode[0]) {
                        $.each(typeId.cat1, function (depth2, cat1) {
                            if (cat1.code === optionValueCode[1]) {
                                $('#cat2').append(`<option>중분류 선택</opntion>`);
                                $.each(cat1.cat2, function (depth3, cat2) {
                                    const cat2Option = $('<option></option>').attr("value", cat2.code).text(cat2.name);
                                    $('#cat2').append(cat2Option)
                                })
                            }
                        })
                    }
                })
            }

            if (depth === 'depth3') {
                $.each(data.contentTypeId, function (depth1, typeId) {
                    if (typeId.code === optionValueCode[0]) {
                        $.each(typeId.cat1, function (depth2, cat1) {
                            if (cat1.code === optionValueCode[1]) {
                                $.each(cat1.cat2, function (depth3, cat2) {
                                    if (cat2.code === optionValueCode[2]) {
                                        $('#cat3').append(`<option>소분류 선택</opntion>`);
                                        $.each(cat2.cat3, function (depth4, cat3) {
                                            const cat3Option = $('<option></option>').attr("value", cat3.code).text(cat3.name);
                                            $('#cat3').append(cat3Option)
                                        })

                                    }
                                })
                            }
                        })
                    }
                })
            }
        }, error: function (e) {
            console.log(e);
        }
    })
}








// $(function(){
// 	$.ajax({
// 		type: 'post',
// 		url: '/miniProject/thema/getThemaList',
// 		data: {'pg': $('#pg').val()},
// 		dataType: 'json',
// 		success: function(data){
// 			console.log(JSON.stringify(data));
//
// 			$.each(data.list, function(index, items){
//
// 				var result=`<div class="boxContent">`
// 								+`<div class="themaBoard">`
// 								+`<div class="themaBoardImg">`+items.img+`</div>`
// 								+`<div class="vertical-container">`
// 									+`<div class="themaTitle"><a href="">경복궁</a></div>`
// 									+`<br><div class="themaText">`+items.content+`</div><br>`
// 									+`<div class="themaAddress>"`+items.zipcode+`</div></div></div></div>`;
// 				$('#박스만들어').append(result);
// 			}); //$.each
//
// 			//페이징 처리
// 			$('#boardButtons').html(data.userPaging.pagingHTML);
//
// 			//글을 클릭했을 때 해당 글 상세 페이지로 이동
// 			$('.themaBoard').click(function(){
// 				//alert('seq = ' + $(this).text());
//
// 				location.href = '';
// 			});//themaBoard.click
// 		},error: function(e){
// 			console.log(e);
// 		}
// 	}); //$.ajax
//
// 	//태그 선택 시 출력 list 변화
// 	$('.themaTag').click(function(){
// 		//기존 리스트 날리고
//
// 		//새로운 리스트 할당
//
// 		//전체보기 태그 클릭 시
// 		location.href='/miniProject/thema/themaBoardList.jsp?pg=1';
//
// 	});//.themaTag.click
//
// });