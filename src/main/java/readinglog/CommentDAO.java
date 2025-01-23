package readinglog;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	
	@Autowired
	SqlSession session;
	
    int insertComment(CommentDTO dto) {
    	return session.selectOne("insertComment", dto);
    }
    
    List<CommentDTO> getCommentsByBoardNo(int board_no){
    	return session.selectList("getCommentsByBoardNo", board_no);
    }
    
    int deleteComment(int comment_id) {
    	return session.selectOne("deleteComment", comment_id);
    }
    
}
