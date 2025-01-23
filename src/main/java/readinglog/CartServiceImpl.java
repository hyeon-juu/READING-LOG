package readinglog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO dao;

	@Override
	public List<CartDTO> getOneMemberCartList(String id) {
		return dao.getOneMemberCartList(id);
	}

	@Override
	public int deleteCartOrderedItem(String id) {
		return dao.deleteCartOrderedItem(id);
	}

	@Override
	public int addBookInCart(CartDTO dto) {
		return dao.addBookInCart(dto);
	}
	
}
