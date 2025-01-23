<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bookDetail</title>
<link rel="stylesheet" href="css/style.css">

<script src="jquery-3.7.1.min.js"></script>   
<script>
	var loginStatus = ${loginStatus};
	
	$(document).ready(function(){
		
	 	// login status true/false
		if(loginStatus) {
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
		
		
	});
	</script>
	<script>
	    //페이지 스크롤시 상단 이동 앵커 버튼
	    function scrollToTop() {
	        window.scrollTo({
	            top: 0,
	            behavior: 'smooth'
	        });
	    }

	    //등록된 게시판 리뷰 데이터(임시)
	    const reviews = [{
	            writer: "작성자1",
	            date: "2024.04.23",
	            review_content: "이번 책은 돈과 투자 영역은 물론이고, 인간의 본성과 세상의 이치에 관한 이야기를 두루 다루어 한층 더 다층적이고 복합적인 메시지를 담아냈다는 평가를 받는다." +
	                "모건 하우절은 사람들은 무엇이 변할 것인지에 대해 늘 관심을 갖지만, 미래에 대비하기 위해서는 오히려 과거에도 지금도 미래에도 변함이 없는‘불변의 법칙’에 대해 알아야 한다고 강조한다." +
	                "이에 1000년 후에도 유효할 인간의 행동양식과 반복패턴에 대한 흥미로운 역사 스토리와 일화들을 들려준다."
	        },
	        {
	            writer: "작성자2",
	            date: "2024.04.24",
	            review_content: "테스트 데이터2입니다."
	        },
	        {
	            writer: "작성자3",
	            date: "2024.04.24",
	            review_content: "테스트 데이터3입니다."
	        },
	        {
	            writer: "작성자4",
	            date: "2024.04.24",
	            review_content: "테스트 데이터4입니다."
	        },
	        {
	            writer: "작성자5",
	            date: "2024.04.24",
	            review_content: "테스트 데이터5입니다."
	        },
	    ];

	    function updateReviewCount() {
	        const reviewCountElement1 = document.querySelector('.btn_detail_purchase');
	        const reviewCountElement2 = document.querySelector('.nav_button_review');

	        reviewCountElement1.textContent = `${reviews.length}개의 리뷰`;
	        reviewCountElement2.textContent = `리뷰(${reviews.length})`;
	    }

	    // 초기 업데이트
	    updateReviewCount();


	    const reviewTable = document.querySelector('.review table');

	    reviews.forEach((review, index) => {
	        const row = document.createElement('tr');

	        // 테이블 내 작성자 정보 추가
	        const writerCell = document.createElement('td');
	        writerCell.textContent = review.writer;
	        row.appendChild(writerCell);

	        // 테이블 내 날짜 정보 추가
	        const dateCell = document.createElement('td');
	        dateCell.textContent = review.date;
	        row.appendChild(dateCell);

	        // 테이블 내 리뷰 내용 추가
	        const reviewCell = document.createElement('td');
	        const contentSpan = document.createElement('span');
	        contentSpan.textContent = review.review_content.substring(0, 100) + '...';
	        contentSpan.classList.add('review-content');

	        const moreBtn = document.createElement('button');
	        moreBtn.textContent = '펼치기';
	        moreBtn.classList.add('more-btn');

	        const lessBtn = document.createElement('button');
	        lessBtn.textContent = '접기';
	        lessBtn.classList.add('less-btn');
	        lessBtn.style.display = 'none';

	        reviewCell.appendChild(contentSpan);
	        reviewCell.appendChild(moreBtn);
	        reviewCell.appendChild(lessBtn);

	        row.appendChild(reviewCell);
	        reviewTable.appendChild(row);

	        moreBtn.addEventListener('click', function () {
	            contentSpan.textContent = review.review_content;
	            moreBtn.style.display = 'none';
	            lessBtn.style.display = 'inline-block';
	        });

	        lessBtn.addEventListener('click', function () {
	            contentSpan.textContent = review.review_content.substring(0, 100) + '...';
	            lessBtn.style.display = 'none';
	            moreBtn.style.display = 'inline-block';
	        });

	        const hrTag = document.createElement('hr');
	        reviewTable.appendChild(hrTag);
	    });


	    //페이지 번호 생성 및 클릭 이벤트 추가
	    document.addEventListener("DOMContentLoaded", function () {
	        let paginationDiv = document.querySelector(".pagination");
	        let totalPages = 10;
	        let currentPage = 1;

	        for (let i = 1; i <= totalPages; i++) {
	            let pageLink = document.createElement("a");
	            pageLink.href = "#";
	            pageLink.classList.add("page-link");
	            pageLink.textContent = i;
	            paginationDiv.appendChild(pageLink);
	        }

	        let pageLinks = document.querySelectorAll(".page-link");
	        pageLinks.forEach(function (pageLink) {
	            pageLink.addEventListener("click", function (event) {
	                event.preventDefault();
	                currentPage = parseInt(pageLink.textContent);
	                console.log("Clicked page:", currentPage);
	            });
	        });
	    });
	</script>
	    
	</head>
	<body>
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
            <li><a href="bookBoard.html">Community</a></li>
        </ul>
    </nav>

    <header id="main_detail_header">
        <h2>${book.book_title }</h2>
    </header>

    <main>
        <section id="main_top">
            <div class="book_detail_top">
                <img class="book_detail_thumb_image"
                    src="${book.book_image_url }" alt="${book.book_title }">
                <div class="book_summary">
                    <span class="book_detail_price">가격 : ${book.book_price }원</span><br>
                    <span class="detail_rank"> 리딩로그 Best1</span><br>
                    <div class="book_detail_btn_wrap">
                        <a class="btn_detail_purchase" href="">()개의 리뷰</a>
                        <a class="btn_detail_review" href="">구매하기</a>
                        <a class="btn_detail_cart" href="">장바구니</a>
                    </div>
                </div>
            </div> <!-- book_detail_top ends -->
        </section>

        <div class="nav">
            <a class="nav_anchor_detail" href="#detail">
                <span class="nav_button_detail">상품정보</span>
            </a>
            <a class="nav_anchor_review" href="#review_title">
                <span class="nav_button_review">리뷰()</span>
            </a>
        </div>
        <hr>

        <div class="detail" id="detail">
            <img class="book_detail_image"
                src="https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/425/i9791198517425.jpg"
                alt="불변의 법칙">
            <h3 class="book_description_title">책 소개</h3>
            <hr>
            <p class="book_description">${book.book_content }</p>
        </div>

        <div class="review">
            <h3 id="review_title">리딩로그 리뷰</h3>
            <hr>
            <table class="review_table">
                <!-- 임시 리뷰 데이터 -->
            </table>
        </div>

        <div class="pagination">
            <!-- 페이지 번호 -->
        </div>

        <!-- 페이지 스크롤시 상단 이동 앵커 버튼-->
        <button class="detail_btn_top" onClick="scrollToTop()">Top</button>
    </main>
</body>
</html>