<%--
  Created by IntelliJ IDEA.
  User: riddl
  Date: 2024-04-07
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

        .bold{
            font-weight: bold;
        }
        a{
            text-decoration-line : none;
            color: black;
            cursor : pointer;

        }
        #themaBoardContent {
            display: flex;
            display: inline-block;
        }

        #title{
            font-weight:bold;
            font-size:20px;
            margin-bottom: 20px;
        }

        #themaTags button {
            background: #A0E3F2;
            border: none;
            border-radius: 5px;
            margin: 10px;
        }

        #themaTags button:hover {
            cursor: pointer;
        }

        .contentBox:first-of-type {
            height: 300px; /* 원하는 높이로 수정 */
        }

        .boxContent {
            /*border: 3px white dotted;*/
            height: 190px;
            padding: 10px;
            font-weight: lighter;
            margin-bottom: 20px;
        }

        .themaBoard {
            display: flex;
            align-items: center; /* 세로 중앙 정렬 */
        }

        .themaBoardImg {
            border: #A0E3F2 solid 2px;
            width : 280px;
            height: 204px;
            margin: 10px;
            width: 280px; /* 요소들 사이의 간격을 조정 */
        }
        .themaBoardImg img{
            width:280px;
            height:204px;
        }

        .vertical-container {
            margin: 15px 30px; /* 요소들 사이의 간격을 조정 */
        }
        .themaTitle{

            font-size:20px;
        }
        #themaText {
            margin-top: 20px;
        }

        /*이전 이후 button*/
        #boardButtons {
            display: flex;
            text-align: center;
            align-items: center; /* 세로 중앙 정렬 */

        }
        #boardButtons button:first-of-type {

            margin-left:200px;
        }
        #boardButtons button {
            background: #A0E3F2;
            border: none;
            border-radius: 5px;
            margin: 50px 10px 30px 10px;
        }

        #boardButtons button:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="themaBoardContent">
    <div id="title">검색 결과</div>



</div>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(function(){

            $.ajax({
                type : 'POST',
                url : 'searchResult',
                data : {"keyword":"${keyword}"},
                dataType : 'JSON',
                success : function(data){



                    $.each(data,function(index,item){


                        divForm(item.t_THUMB_IMAGE,
                                item.t_CONTENTNAME,
                                item.d_INFORMATION,
                                item.t_ADDRESS);

                    });
                },
                error : function(e){
                    console.log(e)
                }

            })

        })

        function divForm(imageUrl,title,text,address){
            var boxContent = $('<div></div>').addClass("boxContent");

            var themaBoard = $('<div></div>').addClass("themaBoard");

            var themaBoardImg = $('<div></div>').addClass("themaBoardImg");
            var img = $('<img/>').attr("src",imageUrl);
            themaBoardImg.append(img);

            var verticalContainer = $('<div></div>').addClass("vertical-container");

            var themaTitle = $('<div></div>').addClass("themaTitle");
            var titleA = $('<a></a>').attr("href","#");
            titleA.html(title);
            themaTitle.append(titleA);

            var themaText = $('<div></div>').addClass("themaText");
            themaText.html(text);

            var themaAddress = $('<div></div>').addClass("themaAddress");
            themaAddress.text(address);

            verticalContainer.append(themaTitle).append(themaText).append(themaAddress);

            themaBoard.append(themaBoardImg).append(verticalContainer);

            boxContent.append(themaBoard);

            $('#themaBoardContent').append(boxContent);


        }

    </script>
</body>
</html>
