<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/screens/boardWriteStyle.css">
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){
	 $("#cancel-button").click(function() {
         window.location.href = "/boardlist";
     });
});
</script>
</head>
<body>

    <header class="screen-header">
        <span><a href="/bookMain.html">READING LOG</a></span>
        <div class="screen-header__search">
            <input type="text" id="searchInput" placeholder="검색어 입력" onkeydown="handleSearch(event)">
            <i onclick="searchBooks()" class="fa-solid fa-magnifying-glass fa-lg"></i>
        </div>

        <div class="screen-header__user">
            <a href="/bookLogIn.html">Log In</a>
            <a href="/bookSignIn.html">Sign In</a>
        </div>
    </header>

    <nav class="header-nav">
        <ul class="header-nav__lists">
            <li><a href="/bookBest.html">Best</a></li>
            <li><a href="/bookNew.html">New</a></li>
            <li><a href="boardlist">Community</a></li>
        </ul>
    </nav>
    <main>
<main>
    <div class="form-container">
        <form action="boardwrite" method="post">
            <label for="board_title">제목 :</label>
            <input type="text" id="board_title" name="board_title">
            
            <label for="board_contents">내용 :</label>
            <textarea id="board_contents" name="board_contents" rows="5" cols="50" placeholder="여기에 내용을 입력하세요"></textarea>
            
            <label for="board_writer">작성자 :</label>
            <input type="text" id="board_writer" name="board_writer" value="${sessionid}" readonly>
            
            <label for="board_pw">글암호 :</label>
            <input type="password" id="board_pw" name="board_pw">
            
            <div class="button-group">
                <button type="submit">글쓰기</button>
                <button type="button" id="cancel-button">취소</button>
            </div>
        </form>
    </div>
</main>

</body>
</html>
