<%--
  Created by IntelliJ IDEA.
  User: choiinhwan
  Date: 4/17/24
  Time: 5:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/member/css/yourId.css">
    <script defer  src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<%--    <script defer src="/member/js/yourId.js"></script>--%>
</head>
<body>
<div id="find_wrap" class="wrap">
    <div class="di_wrap">
        <tr class="result">
            <th>회원님의 아이디는</th>
            <br>
            <td id="MEM_ID" name="MEM_ID">"${MEMBER}"</td>
        </tr>
    </div>
    <br><br><br><br><br><br><br><br><br>
    <p class="pre_btn" id="befor">
        <a href="/">HOME</a> /
        <a href="/member/findPwd">비밀번호 찾기</a></ㅔ>
    </p>
</div>
</body>
</html>
