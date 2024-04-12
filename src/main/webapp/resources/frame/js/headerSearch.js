let searchContentNo;
let searchContentName;

$('#searchBtn').click(function(){
    if(searchContentNo == ""){
        location.href="searchResultForm?keyword="+$('#searchText').val();
    }
    //검색 결과 페이지로 이동하도록 변경
})
function inputChange(){
    searchContentNo="";
    searchContentName="";
}

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
                            , idx : item.T_CONTENTNO // index
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
        searchContentNo = ui.item.idx;
        searchContentName = ui.item.label;
        location.href="searchSelect?no="+T_CONTENTNO+"&name="+searchContentName;

        //상세페이지로 바로 이동 하도록 구현
    }
});



