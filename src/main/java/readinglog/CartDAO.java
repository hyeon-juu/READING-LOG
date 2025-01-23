package readinglog;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSession session;
	
	// 해당 id 회원 장바구니 목록 조회
	public List<CartDTO> getOneMemberCartList(String id) {
		List<CartDTO> cartlist = session.selectList("getOneMemberCartList", id);
		return cartlist;
	}

	// 주문한 상품 장바구니에서 삭제
	public int deleteCartOrderedItem(String id) {
		return session.delete("deleteCartOrderedItem", id);
	}

	// 장바구니에 책 추가
	public int addBookInCart(CartDTO dto) {
		return session.insert("addBookInCart", dto);
	}


}
