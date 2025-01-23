<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
	<title>비밀번호 변경</title>
	<script src="/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$("#newPwCheck").on('input', function() {
				
				const newPw = $("#newPw").val();
				const newPwCheck = $("#newPwCheck").val();
				
				if(newPw != newPwCheck) {
					$("#pwCheckText").html("입력하신 비밀번호가 일치하지 않습니다.");
				} else {
					$("#pwCheckText").html("<p></p>");
				}
				
			}); // newPwCheck input end
			
			$("#pwModifyEndBtn").on("click", function(e) {
				
				const newPw = $("#newPw").val();
				const newPwCheck = $("#newPwCheck").val();
				
				if(newPw == newPwCheck && newPw != "") {
					alert("비밀번호 변경이 완료되었습니다.");
				} else {
					e.preventDefault();
					alert("비밀번호가 일치하지 않습니다.");
				}
				
			}); // pwModifyEndBtn onclick end
			
		}); // ready end
	</script>
</head>

<body>

	<div class="screen-pwModify">
		<h1>비밀번호 변경</h1>
		<br>
		<div>
		<form action="modifypw" method="post">
			새 비밀번호<input type="password" id="newPw">
			<br>	
			새 비밀번호 재확인<input type="password" id="newPwCheck" name="mem_pw">
			<br>
			<p id="pwCheckText">비밀번호를 한번 더 입력해주세요.</p>
			<br>
			<input type="submit" id="pwModifyEndBtn" value="비밀번호 변경" name="pw">		
		</form>
		</div>
	</div>
	
</body>

</html>