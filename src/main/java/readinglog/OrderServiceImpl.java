package readinglog;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO dao;

	@Override
	public List<OrderDTO> getPagingOneMemberOrderList(HashMap map) {
		return dao.getPagingOneMemberOrderList(map);
	}

	@Override
	public int getOneMemberOrderListCnt(String id) {
		return dao.getOneMemberOrderListCnt(id);
	}

	@Override
	public int addOrder(OrderDTO dto) {
		return dao.addOrder(dto);
	}

	@Override
	public String[] getBestBookList() {
		return dao.getBestBookList();
	}
	
}
