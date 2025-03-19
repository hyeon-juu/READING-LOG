<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 페이지</title>
<style>
body {
    background: #283618;
}
.container {
    margin-top: 5em;
    text-align: center;
    position: relative;
}
#LogInTitle {
    font-family: "Platypi", serif;
    font-weight: bold;
}
input {
    font-size: 17px;
    border-radius: 10px;
    margin: 3px;
    border: 2px solid #fefae0;
    width: 400px;
    height: 40px;
}
#signin {
    background-color: #606c38;
    color: #fefae0;
    font-size: 20px;
    border-radius: 10px;
    margin: 5px;
    border: 2px solid #fefae0;
    width: 300px;
    height: 60px;
}
</style>
<script src="/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		
	}); // ready end
</script>

</head>
<body>
<div class="container">
    <h1 id="LogInTitle" style="color: #fefae0">READING LOG</h1>
    <br>
    <form id="login" action="/login" method="post" th:action="@{/login}">
        <input type="text" id="id" name="memId" placeholder="아이디" required>
        <br>
        <input type="password" id="pw" name="memPw" placeholder="비밀번호" required>
        <br>
        <div id="test" style="color:#fefae0" th:text="${error}"></div>
        <br>
        <br>
        <button type="submit" id="signin">로그인</button>
    </form>
</div>
</body>
</html>