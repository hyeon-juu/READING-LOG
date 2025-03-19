<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		
	}); // ready end
</script>
</head>
<body>
	<h1>임시 로그인폼</h1>
	<form action="mypagelogin" method="post">
		아이디 : <input type=text name="id"><br>
		암호 : <input type=password name="pw"><br>
		<input type=submit value="로그인(sessionid 저장)">
	</form>
	<br>
	<form action="mypage" method="post">
		<button>(로그인후가능)마이페이지로 이동</button>
	</form>
	<br>
	<form action="cart" method="post">
		(장바구니 저장용 임시)책 제목 : 세이노의 가르침
		<input type="submit" value="(로그인후가능)장바구니추가">
	</form>
	<br>
	<form action="order" method="post">
		<button>(로그인후가능)결제하기</button>
	</form>
</body>
</html>