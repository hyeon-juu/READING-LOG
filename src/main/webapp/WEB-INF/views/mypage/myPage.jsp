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
			
			$("#infomodifybtn").on("click", function(e){
				var pwCheck = prompt("비밀번호 확인", "비밀번호 입력");
				while(true) {
					if(pwCheck) { // prompt true
						if(pwCheck == ${memberdto.mem_pw}) { // pw check true
							break;
						} else { // pw check false
							pwCheck = prompt("비밀번호를 잘못 입력하셨습니다.", "비밀번호 재입력");
						}
					} else { // prompt false
						e.preventDefault();
						break;
					}
				}
				
			}); // infomodifybtn
			
		}); // ready end
	</script>
</head>
<body>
	<header class="screen-header">
        <span><a href="index">READING LOG</a></span>

        <div class="screen-header__user">
            <a href="logout">Log Out</a>
        </div>
    </header>

    <main class="main-screen-mypage">
        <aside class="myProfile">
            <div class="myProfile__info">
                <img src="img/userimg.jpg" />
                <span class="myProfile__name">
                	<%
                	if(session.getAttribute("loginId") != null) { %>
	                	${ memberdto.mem_name } 님 
	                <%
                	} else { %>
       					로그인정보없음
                	<%
                	} %>
	                
                </span>
            </div>

            <div class="mypageMenu-p">
                <span>주문내역</span>
                <a href="#">주문내역/배송조회</a>
                <span>나의 정보</span>
                <a href="modifyaccount" id="infomodifybtn">회원정보 수정</a>
                <a href="deleteaccount">회원탈퇴</a>
            </div>
        </aside>

        <section class="myorderList">
            <article>
                <h1 class="mun">최근 주문내역</h1>
                <table id="myorderList_table">
                    <tr><th>주문일자</th><th>주문번호</th><th>주문내역</th><th>주문수량</th><th>결제금액</th><th>주문상태</th></tr>
	       			<c:forEach items="${ orderlist }" var="dto">
						<tr>
							<td>${ dto.order_datetime }</td>						
							<td>${ dto.order_no }</td>
							<td>${ dto.order_book_title }</td>
							<td>${ dto.order_quantity }</td>
							<td>${ dto.order_payprice }원</td>
							<td>${ dto.order_state }</td>
						</tr>
					</c:forEach>
                </table>
                
                <div id="pagenum">
	             	<%
					int totalOrderCnt = (Integer)request.getAttribute("totalOrderCnt");
					int totalpage = 0;
					if(totalOrderCnt % 5 == 0) {
						totalpage = totalOrderCnt / 5;
					} else {
						totalpage = totalOrderCnt / 5 + 1;
					} // if-else end
						
					for(int i = 1; i <= totalpage; i++) {
					%>
					<div><a href="mypage?pagenum=<%=i%>"><%=i%>&nbsp&nbsp&nbsp</a></div>		
					<%
					} // for end
					%>
                </div>
                
			<h1 class="my_mun mun">나의 1:1 문의</h1>
			<div class="mun_container">
				<div class="mun_row">
					<a href="#"><span>주문 취소합니다.</span></a>
					<span>2020-04-02</span>
				</div>
				<div class="mun_row">
					<a href="#"><span>일주일이 넘게 지났는데..</span></a>
					<span>2020-03-24</span>
				</div>
			</div>
			
			<h1 class="level2_con mun">2단계 인증</h1>
				<div class="level2">
					<a href="#">나의 계정을 안전하게 지키는 2단계 인증 서비스를 사용해 보세요.</a>
				</div>
                
            </article>
        </section>
    </main>
</body>
</html>