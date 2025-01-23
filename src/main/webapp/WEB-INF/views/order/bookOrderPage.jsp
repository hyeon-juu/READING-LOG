<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/style.css">
	<title>책 구매 페이지</title>
	<script src="/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$("#paymentBtn").on('click', function(e) {
				
				var check = confirm("결제하시겠습니까?");
				
				if(check) {
					alert("주문 완료되었습니다.");
				} else {
					e.preventDefault();
				}
				
			}); // paymentBtn onclick end
			
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

    <main class="main-screen-orderpage">
    
        <section class="ordersection">
            <article class="ordercheck_article">
                <h1>상품 확인</h1>
                <table id="ordercheck_table">
                    <tr><th class="greeen">상품명</th><th class="greeen">가격</th><th class="greeen">수량</th><th class="greeen">금액합계</th></tr>
					<%
					java.util.ArrayList<readinglog.CartDTO> cartlist = (java.util.ArrayList)request.getAttribute("cartlist");
					
					int totalprice = 0; 
					
					for(readinglog.CartDTO dto : cartlist) { %>
						<tr>
							<td><%=dto.getCart_book_title() %></td>
							<% int book_price = dto.getCart_book_price() / dto.getCart_book_quantity(); %>
							<td><%=book_price %>원</td>
							<td><%=dto.getCart_book_quantity() %></td>
							<td><%=dto.getCart_book_price() %>원</td>
						</tr>
					<%	totalprice += dto.getCart_book_price();
					} %>
						
                </table>
            </article>
            
            <article class="order_article">
                <form action="orderprocess" method="post">
                	<h1>배송 정보 확인</h1>
	                <table id="deliveryinfo_table">
	                    <tr><td class="greeen">이름</td><td><input type="text" value="${memberdto.mem_name}" readonly></td></tr>
	                    <tr><td class="greeen">주소</td><td><input type="text" name="address"></td></tr>
	                    <tr><td class="greeen">휴대폰</td><td><input type="text" value="${memberdto.mem_phone}" readonly></td></tr>
	                </table>
	            	<h1>결제</h1>
	                <span class="fprice">최종 결제금액 : <%=totalprice %>원</span>
	                <input type="submit" id="paymentBtn" value="결제하기" name="payment">              
	            </form>
            </article>
        </section>
        
    </main>
</body>
</html>