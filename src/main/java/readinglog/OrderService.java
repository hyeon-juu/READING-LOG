package readinglog;

import java.util.HashMap;
import java.util.List;

public interface OrderService {
	// 1명 회원 주문내역 리스트
	List<OrderDTO> getPagingOneMemberOrderList(HashMap map);
	
	// 1명 회원 주문내역 전체 개수
	int getOneMemberOrderListCnt(String id);

	// 주문 접수
	int addOrder(OrderDTO dto);
	
	// 베스트 도서 3권 조회
	String[] getBestBookList();
}
