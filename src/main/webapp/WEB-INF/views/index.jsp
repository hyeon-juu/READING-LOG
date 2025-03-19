<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
    <title>index</title>
    <script src="jquery-3.7.1.min.js"></script>
    <script>
        var loginStatus = $ {
            loginStatus
        };

        $(document).ready(function () {

            // login status true/false
            if (loginStatus) {
                $("#login_outBtn").text("Log Out");
                $("#login_outBtn").prop('href', "logout");

                $("#signup_mypageBtn").text("My Page");
                $("#signup_mypageBtn").prop('href', "mypage");
            } else {
                $("#login_outBtn").text("Log In");
                $("#login_outBtn").prop('href', "login");

                $("#signup_mypageBtn").text("Sign Up");
                $("#signup_mypageBtn").prop('href', "signup");

            }

        }); // ready end
    </script>
</head>

<body>

    <div class="popup" id="myPopup">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <a href="#"><img src="img/sideAd.png"></a>
        <div class="hide-popup-btn" onclick="hidePopupForToday()">오늘은 그만보기</div>
    </div>


    <div id="modal" class="modal">
        <a href="https://hottracks.kyobobook.co.kr/ht/hot/hotdealMain"><img src="img/floatAd.jpg">
            <div>
                <p>A Price Of 포인트 노트</p>
                <p>8,500원 → 5,600원[34%]</p>
                <p>by 핫트랙스</p>
            </div>
        </a>
    </div>


    <header class="screen-header">
        <span><a href="index">READING LOG</a></span>
        <div class="screen-header__search">
            <input type="text" id="searchInput" placeholder="검색어 입력" onkeydown="handleSearch(event)">
            <i onclick="searchBooks()" class="fa-solid fa-magnifying-glass fa-lg"></i>

        </div>

        <div class="screen-header__user">
            <a href="" id="login_outBtn"></a>
            <a href="" id="signup_mypageBtn"></a>
        </div>
    </header>

    <nav class="header-nav">
        <ul class="header-nav__lists">
            <li><a href="bookbest">Best</a></li>
            <li><a href="booknew">New</a></li>
            <li><a href="boardlist">Community</a></li>
        </ul>

        <!-- <a class="mypage" href="bookMyPage.html">My Page</a> -->
        <ul class="header-nav__lists2">
            <li><a href="#">할인혜택</a></li>
            <span>|</span>
            <li><a href="#">출석체크</a></li>
        </ul>
    </nav>

    <main class="main-screen">

        <div class="banner">
            <div id="banner__text">
                <!-- 배너 제목 -->
            </div>
            <img id="banner__img" src=""><!-- 배너 이미지 -->

        </div>

        <div class="many_buttons">
            <button><i class="fa-solid fa-fire"></i><span>HOT</span></button>
            <button><i class="fa-solid fa-trophy"></i><span>TOP</span></button>
            <button><i class="fa-solid fa-hand-holding-heart"></i><span>선물</span></button>
            <button><i class="fa-solid fa-truck-fast"></i><span>배송</span></button>
            <button><i class="fa-solid fa-thumbs-up"></i><span>추천</span></button>
            <button><i class="fa-solid fa-book"></i><span>작품</span></button>
            <button><i class="fa-solid fa-calendar-days"></i><span>일정</span></button>
            <button><i class="fa-regular fa-credit-card"></i><span>카드</span></button>
            <button><i class="fa-solid fa-camera-retro"></i><span>추억</span></button>
            <button><i class="fa-solid fa-compact-disc"></i><span>음반</span></button>
        </div>

        <div class="recommend">
            <span class="recommend__title">Today's book</span>
            <span class="recommend__date">[
                <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %> ]</span>
            <div class="book">
                <c:forEach var="book" items="${books}">
                    <div class="book__col">
                        <img src="${book.book_image_url}">
                    </div>
                    <div class="book__col">
                        <span class="book__title">${book.book_title}</span>
                        <span class="book__author">${book.book_author}</span>
                        <span class="book__price">${book.book_price}</span>
                        <p class="book__detail">${book.book_content}</p>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="ad">
            <div>
                영화 &lt;HER&gt;의 현실화, <br>구글, 오픈 API 혁명 예측!<br>
                최재봉 성균관대 부총장의 신작 &lt;&lt;AI사피엔스&gt;&gt;
                <img src="img/ad1.png">
            </div>
            <div>
                루이스 AI <br>
                스토리 공모전<br>
                5분만에 작가 변신! <br>상금 1천만원 도전!
                <img src="img/ad2.png">
            </div>
        </div>

        <div class="hot">
            <span class="hot__title">급상승! 많이 보고 있는 상품</span>
            <div class="hot__books">
                <div class="hot__book">
                    <img src="img/hot1.jpg">
                    <div>
                        <span>경제/경영</span>
                        <span class="hot__title-small">더 피아트 스탠다드 특별 강연 패키지</span>
                        <span>사이페딘 아모스, 다산북스</span>
                    </div>
                </div>
                <div class="hot__book">
                    <img src="img/hot2.jpg">
                    <div>
                        <span>시/에세이</span>
                        <span class="hot__title-small">전지적 푸바오 시점: 아이러푸 에디션</span>
                        <span>송영관, 위즈덤하우스</span>
                    </div>
                </div>
                <div class="hot__book">
                    <img src="img/hot3.jpg">
                    <div>
                        <span>경제/경영</span>
                        <span class="hot__title-small">어떻게 살 것인가</span>
                        <span>이광수, 이든하우스</span>
                    </div>
                </div>
                <div class="hot__book">
                    <img src="img/hot4.jpg">
                    <div>
                        <span>예술/대중문화</span>
                        <span class="hot__title-small">바오패밀리 컬러링북</span>
                        <span>Kami25, 라이카미</span>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script src="js/banner.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
    <script src="https://kit.fontawesome.com/5c3afda2cc.js" crossorigin="anonymous"></script>
</body>

</html>