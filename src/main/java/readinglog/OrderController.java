package readinglog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	MemberService member_service;
	
	@Autowired
	CartService cart_service;
	
	@Autowired
	OrderService order_service;
	
	// 책 주문 화면
	@RequestMapping("order")
	ModelAndView orderPage(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		MemberDTO memberDTO = member_service.findByMemId(id);
		List<CartDTO> cartlist = cart_service.getOneMemberCartList(id);

		if(memberDTO != null) {
			mv.addObject("memberdto", memberDTO);
			mv.addObject("cartlist", cartlist);
			mv.setViewName("order/bookOrderPage");
		} else {
			System.out.println("dto is null, Do login");
			mv.setViewName("login_tmp");
		}
		
		return mv;
		
	}
	
	// 책 주문 과정
	@PostMapping("orderprocess")
	String orderBookProcess(String address, HttpSession session) {
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		List<CartDTO> cartlist = cart_service.getOneMemberCartList(id);
		
		OrderDTO newOrderDTO = new OrderDTO();
		
		for(CartDTO dto : cartlist) {
			newOrderDTO.setOrder_book_title(dto.getCart_book_title());
			newOrderDTO.setOrder_quantity(dto.getCart_book_quantity());
			newOrderDTO.setOrder_address(address);
			newOrderDTO.setOrder_mem_id(id);
			newOrderDTO.setOrder_state("주문접수");
			newOrderDTO.setOrder_payprice(dto.getCart_book_price());
			
			int updaterows = order_service.addOrder(newOrderDTO);
		}
		
		
		int deleterows = cart_service.deleteCartOrderedItem(id);
		
		return "redirect:/mypage";
		
	}
	
}
