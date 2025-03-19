<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="/css/style.css">
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){
	
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
 <h2>${param.word }에 대한 검색 결과입니다. </h2> <br>
<table border="3">
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
	<c:forEach items="${boardsearchlist }" var="dto">
		<tr><td>${dto.board_no }</td><td><a href="boarddetail?board_no=${dto.board_no }">${dto.board_title }</a></td><td>${dto.board_writer }</td><td>${dto.board_viewcount }</td>
	</c:forEach> 
</table> 

<div class="pagination">

<a href="boardlist?pagenum=1">전체</a>
<a href="boardsearchlist?pagenum=1&&item=${param.item }&word=${param.word}">처음</a>
            <% 
            int totalboard = (Integer)request.getAttribute("totalsearchboard");
            int totalpage = 0;
            if(totalboard % 5 == 0){
            	totalpage = totalboard / 5;
            }
            else{
            	totalpage = totalboard / 5 + 1;
            }

            for(int i = 1; i <= totalpage; i++){
            %>
            <a href="boardsearchlist?pagenum=<%=i%>&item=${param.item }&word=${param.word }" > <%=i%> </a> 
            <%
            }
            
            if (totalpage > 0) { %>
    <a href="boardsearchlist?pagenum=<%=totalpage%>&item=${param.item}&word=${param.word}" >
        끝
    </a> 
<% } %>
        </div>
<div class="search-form">
    <form action="boardsearchlist" onsubmit="return validateSearchForm()">
        검색항목 :
        <input type="radio" name="item" value="all">모두
        <input type="radio" name="item" value="board_title">제목
        <input type="radio" name="item" value="board_contents">내용
        <input type="radio" name="item" value="board_writer">작성자
        <input type="text" name="word" id="searchWord">
        <input type="hidden" name="pagenum" value="1">
        <input type="submit" value="검색" >
    </form>
</div>
</main>
</body>
</html>





