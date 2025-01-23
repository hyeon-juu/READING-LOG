<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
	<title>마이페이지</title>
	<script src="/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function() {			
			$(".modifyBtn").on('click', function(e) {
				$("#" + e.target.name + "update").toggle();
				$("#" + e.target.name + "update2").toggle();
			}); // modifyBtns onclick end
			
			$(".modifyCompBtn").on('click', function(e) {
				$("#" + e.target.name + "update").toggle();
				$("#" + e.target.name + "update2").toggle();
			}); // modifyCompBtns onclick end
			
			$("#pwModifyBtn").on('click', function(e) {
				window.open("modifypw", "_blank", "width=600, height=500, top=250, left=400");
			}); // pwModifyBtn onclick end
			
		}); // ready end
	</script>
</head>

<body>
	<header class="screen-header">
		<span><a href="index.html">READING LOG</a></span>

		<div class="screen-header__user">
			<a href="index.html">Log Out</a>
		</div>
	</header>

	<main class="main-screen">
		<section class="memberInfoModify">
			<article>
				<h1>회원정보 수정</h1>
				<br>
				<table id="myInfo_table">
					<tr>
						<th>아이디</th>
						<td>${ memberdto.mem_id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${ memberdto.mem_name }</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${ memberdto.mem_gender }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${ memberdto.mem_birth }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div id="emailupdate">
								<span>${ memberdto.mem_email }</span>
								<button class="modifyBtn" name="email">수정</button>
							</div>
							<div id="emailupdate2" hidden>
								<form action="modifyaccount" method="post">
									<input type="email" name="mem_email">
									<input type="submit" class='modifyCompBtn' value="수정완료" name="email">
								</form>
							</div>
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><div id="phoneupdate">
								<span>${ memberdto.mem_phone }</span>
								<button class="modifyBtn" name="phone">수정</button>
							</div>
							<div id="phoneupdate2" hidden>
								<form action="modifyaccount" method="post">
									<input type="text" name="mem_phone">
									<input type="submit" class='modifyCompBtn' value="수정완료" name="phone">
								</form>
							</div></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><button id="pwModifyBtn" class="modifyBtn">비밀번호 변경</button></td>
					</tr>
				</table>
			</article>
		</section>
	</main>
</body>
</html>