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
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){

    $("#deletebtn").on('click', function(){
        let userpw = prompt("글암호를 입력하세요");
        let dbpw = $("#board_pw").val();
        if(userpw == dbpw){
            location.href = "boarddelete?board_no=${detaildto.board_no}";
        } else {
            alert("암호를 확인하세요");
        }
    });

    // 댓글 등록
    $("#comment_form").on('submit', function(event){
        event.preventDefault();
        const commentText = $("#comment-text").val();
        if(commentText.trim() === ""){
            alert("댓글을 입력하세요");
            return;
        }
        $.post("addComment", {
            board_no: ${detaildto.board_no},
            comment_text: commentText
        }, function(data){
            if(data.success){
                location.reload(); // 페이지 새로고침으로 댓글 목록 갱신
            } else {
                alert("댓글 등록에 실패했습니다.");
            }
        }, "json");
    });
});//ready
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

<main class="board_detail_box">

	<div class="board_detail">
		<div class="board_title">
			<h5>no.${detaildto.board_no }</h5><h1>${detaildto.board_title }</h1>
			<div class="metadata">
				<span class="board_writingtime"><h4>작성일 : ${detaildto.board_writingtime }</h4></span> 
				<span class="board_viewcount"><h4>조회수 : ${detaildto.board_viewcount }</h4></span>
			</div>
			<span class="board_writer"><h4>작성자 : ${detaildto.board_writer }</h4></span>

			<p class="board-contents">
			<h2>내용</h2>
			<textarea name="board_contents" rows="5" cols="50">${detaildto.board_contents}</textarea>
			</p>
		</div>
		<div>

			<input type="button" value="게시글 삭제" id="deletebtn">
		</div>
		<br>
	</div>
	<input type="hidden" id="board_pw" name="board_pw" value="${detaildto.board_pw}">

	
	<div id="comment-section">
	    <form id="comment_form" action="/comments/add" method="post">
	        <textarea id="comment-text" name="comment_content" placeholder="댓글을 입력하세요"></textarea>
	        <input type="hidden" name="board_no" value="${detaildto.board_no}">
	        <input type="hidden" name="comment_writer" value="${user}">
	        <button type="submit">등록</button>
	    </form>
	    <div class="comment-list">
	        <c:forEach var="comment" items="${comments}">
	            <div class="comment">
	                <p>${comment.comment_writer}: ${comment.comment_content}</p>
	                <span>${comment.comment_writingtime}</span>
	                <form action="/comments/delete" method="post" style="display:inline;">
	                    <input type="hidden" name="comment_id" value="${comment.comment_id}">
	                    <input type="hidden" name="board_no" value="${detaildto.board_no}">
	                    <button type="submit">삭제</button>
	                </form>
	            </div>
	        </c:forEach>
	    </div>
	</div>
        
    </main>
</body>
</html>

