package readinglog;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	SqlSession session;

	public List<OrderDTO> getPagingOneMemberOrderList(HashMap map) {
		return session.selectList("pagingOneMemberOrderList", map);
	}

	public int getOneMemberOrderListCnt(String id) {
		return session.selectOne("oneMemberOrderListCnt", id);
	}

	public int addOrder(OrderDTO dto) {
		return session.insert("addOrder", dto);
	}
	
	public String[] getBestBookList() {
		
		List<String> bestBookList = session.selectList("getBestBookList");
	    String[] bestBookArr = bestBookList.toArray(new String[bestBookList.size()]);
	    
	    return bestBookArr;
	}

}
