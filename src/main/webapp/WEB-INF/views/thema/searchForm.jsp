<%--
  Created by IntelliJ IDEA.
  User: riddl
  Date: 2024-04-06
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        .ui-autocomplete {
            max-height: 300px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
        }
        /* IE 6 doesn't support max-height
         * we use height instead, but this forces the menu to always be this tall
         */
        * html .ui-autocomplete {
            height: 300px;
        }

        #searchText{
            top: 10px;
            position: relative;
            padding-left: 10px;
            border: 2px solid #CAE9FF;
            text-align: left;
            background-color: #ffffff;
            width: 400px;
            height: 41px;
            font-size: 20px;
            border-radius: 10px;
        }

        #searchBtn {
            bottom: 2px;
            width: 100px;
            height: 35px;
            margin-left: 10px;
            /* 박스의 넓이 */
            /* 내부 여백 */
            background-color: #ffffff;
            /* 백그라운드 색상 */
            border: 2px solid #CAE9FF;
            /* 박스의 테두리 */
        }
    </style>
</head>
<body>
        <input type="text" id="searchText" oninput="inputChange()">
        <input type="button" id="searchBtn" value="검색">

        <script>
            var T_CONTENTNO;
            var T_CONTENTNAME;

            function inputChange(){
                T_CONTENTNO="";
                T_CONTENTNAME="";
            }

            $('#searchText').autocomplete({
                source : function(request, response) { //source: 입력시 보일 목록
                    $.ajax({
                        url : "autoComplete"
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
                    T_CONTENTNO = ui.item.idx;
                    T_CONTENTNAME = ui.item.label;
                    location.href="searchSelect?no="+T_CONTENTNO+"&name="+T_CONTENTNAME;

                    //상세페이지로 바로 이동 하도록 구현
                }
            });

            $('#searchBtn').click(function(){
                if(T_CONTENTNO == ""){
                    location.href="searchResultForm?keyword="+$('#searchText').val();
                }
                //검색 결과 페이지로 이동하도록 변경
            })


        </script>


</body>
</html>
