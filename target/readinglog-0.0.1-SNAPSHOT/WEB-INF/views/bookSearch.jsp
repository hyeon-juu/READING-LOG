<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>검색 결과</title>
</head>

<body>
    <header class="screen-header">
        <span><a href="index">READING LOG</a></span>
        <div class="screen-header__search">
            <input type="text" id="searchInput" placeholder="검색어 입력" onkeydown="handleSearch(event)">
            <i onclick="searchBooks()" class="fa-solid fa-magnifying-glass fa-lg"></i>

        </div>

        <div class="screen-header__user">
            <a href="bookLogIn.html">Log In</a>
            <a href="bookSignIn.html">Sign In</a>
        </div>
    </header>

    <div id="searchResults">
        <!-- 검색 결과 -->
    </div>

    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script src="js/bookSearch.js"></script>
    <script src="js/index.js"></script>
    <script src="https://kit.fontawesome.com/5c3afda2cc.js" crossorigin="anonymous"></script>
</body>

</html>