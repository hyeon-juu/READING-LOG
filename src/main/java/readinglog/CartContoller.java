package readinglog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartContoller {

	@Autowired
	MemberService member_service;
	
	@Autowired
	CartService cart_service;
	
	// 장바구니 담기 과정
	@PostMapping("/cart")
	String addBookInCart(HttpSession session) {
		
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		// dummy data
		CartDTO dto = new CartDTO();
		dto.setCart_mem_id(id);
		dto.setCart_book_title("세이노의 가르침");
		dto.setCart_book_quantity(1);
		dto.setCart_book_price(6480);
		
		int insertrows = cart_service.addBookInCart(dto);
		
		return "login_tmp";
	}
	
	// 장바구니 담기 버튼
	@PostMapping("/cartbtn_booknew")
	String addBookInCart_BookNewCartBtn(String cart_book_title, int cart_book_price, HttpSession session) {
		
		System.out.println(cart_book_price);
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		CartDTO dto = new CartDTO();
		
		dto.setCart_mem_id(id);
		dto.setCart_book_quantity(1);
		dto.setCart_book_title(cart_book_title);
		dto.setCart_book_price(cart_book_price);
		
		int insertrows = cart_service.addBookInCart(dto);
		
		System.out.println("goal in cart");
		
		return "redirect:/booknew";
	}
	
	// 구매하기 버튼
	@PostMapping("/purchasebtn_booknew")
	String addBookInCart_BookNewPurchaseBtn(String cart_book_title, int cart_book_price, HttpSession session) {
		
		System.out.println(cart_book_price);
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		CartDTO dto = new CartDTO();
		
		dto.setCart_mem_id(id);
		dto.setCart_book_quantity(1);
		dto.setCart_book_title(cart_book_title);
		dto.setCart_book_price(cart_book_price);
		
		int insertrows = cart_service.addBookInCart(dto);
		
		System.out.println("goal in cart");
		
		return "redirect:/order";
	}
	
	
}
