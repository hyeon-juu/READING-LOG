package readinglog;

import java.util.List;

public interface CartService {
	
	// 해당 id 회원 장바구니 목록 조회
	List<CartDTO> getOneMemberCartList(String id);
	
	// 주문한 상품 장바구니에서 삭제
	int deleteCartOrderedItem(String id);

	// 장바구니에 책 추가
	int addBookInCart(CartDTO dto);
}
