<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
	<title>회원탈퇴</title>
	<script src="/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$("#deleteAccountBtn").on('click', function(e) {
				
				const myPw = ${ memberdto.mem_pw };
				const pwCheck = $("#pwCheck").val();
				
				const deleteCheck = confirm("정말 탈퇴하시겠습니까?");
				
				if(deleteCheck) {
					if(myPw == pwCheck) {
						alert("탈퇴처리되었습니다.")
					} else {
						e.preventDefault();
						alert("비밀번호가 일치하지않습니다.");
					}
				}
				
			}); // deleteAccountBtn onclick end
			
			
		}); // ready end
	</script>
</head>
<body>
	<header class="screen-header">
		<span><a href="index">READING LOG</a></span>

	</header>

	<main class="main-screen">
		<section class="deleteAccount">
			<article>
				<h3>회원탈퇴</h3>
				<br>
				<div class="deleteAccountGuide">
					<h2>아래 내용을 꼭 확인해주세요.</h2>
					<hr>
					<p class="deleteAccountGuide__msg">회원탈퇴 즉시 회원정보는 모두 삭제되며, 재가입시에도 복원되지않습니다.</p>
					<hr>
					<p>정확한 본인확인을 위해 비밀번호를 입력해주세요.</p>
					<form action="deleteaccount" method="post">
						비밀번호 확인<input type="password" id="pwCheck" name="pwCheck">
						<input type="submit" id="deleteAccountBtn" value="회원탈퇴">
					</form>
				</div>
			</article>
		</section>
	</main>
	
</body>
</html>