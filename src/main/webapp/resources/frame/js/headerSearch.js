let searchContentNo;
let searchContentName;
let searchContentTypeId;

function inputChange(){
    searchContentNo="";
    searchContentName="";
    searchContentTypeId="";
}
$('#searchBtn').click(function(){
    if($('#inp_search').val() === ""){
        alert("검색어를 입력하세요")
    }else {
        location.href = "/search/searchResultForm?keyword=" + $('#inp_search').val();
    }
    //검색 결과 페이지로 이동하도록 변경
})
$('#inp_search').keypress(function(e){
    if(e.which == 13){ // 13 is the enter key's keycode
        if($('#inp_search').val() === ""){
            alert("검색어를 입력하세요")
        }else {
            location.href = "/search/searchResultForm?keyword=" + $('#inp_search').val();
        }
    }
});


$('#inp_search').autocomplete({
    source : function(request, response) { //source: 입력시 보일 목록
        $.ajax({
            url : "/search/autoComplete"
            , type : "POST"
            , dataType: "JSON"
            , data : {value: request.term}	// 검색 키워드
            , success : function(data){ 	// 성공
                response(
                    $.map(data.resultList, function(item) {
                        return {
                            label : item.T_CONTENTNAME    	// 목록에 표시되는 값
                            , value : item.T_CONTENTNAME 		// 선택 시 input창에 표시되는 값
                            , contentNo : item.T_CONTENTNO // index
                            , typeId : item.T_CONTENTTYPEID // 테마 번호
                        };
                    })
                );    //response
            }
            ,error : function(){ //실패
                alert("오류가 발생했습니다.");
            }
        });
    }
    ,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌
        return false;
    }
    ,minLength: 1// 최소 글자수
    ,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
    ,delay: 100	//autocomplete 딜레이 시간(ms)
    ,select : function(evt, ui) {
        searchContentNo = ui.item.contentNo;
        searchContentTypeId = ui.item.typeId;
        location.href="/thema/themaDetailPage?contentNo="+searchContentNo+"&typeId="+searchContentTypeId;

        //상세페이지로 바로 이동 하도록 구현
    }
});



