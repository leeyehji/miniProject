<%--
  Created by IntelliJ IDEA.
  User: choiinhwan
  Date: 4/15/24
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'noto Sans KR', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url(../img/background.png);
            background-size: cover;
        }

        body::before {
            content: "";
            position: absolute;
            z-index: 1;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
        }
        .wrap{
            background-color: white;
            height: 500px;
            width: 400px;
            text-align: center;
        }
        .di_wrap{

            font-size: 20px;
            margin-top: 200px;
        }
        .pre_btn{
            margin-bottom: 20px;

        }

    </style>
</head>
<body>
<div id="find_wrap" class="wrap">
    <div class="di_wrap">
        <tr class="result">
            <th>회원님의 아이디는</th>
            <br>
            <td id="MEM_ID" name="MEM_ID">입니다.</td>
        </tr>
    </div>

    <br><br><br><br><br><br><br><br><br>

    <p class="pre_btn" id="befor">
        <a href="">로그인</a> /
        <a href="">비밀번호 찾기</a>
    </p>

</div>


</body>
</body>
</html>
