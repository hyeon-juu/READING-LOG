package readinglog;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession session;

    int insertBoard(BoardDTO dto) {
    	return session.selectOne("insertBoard", dto);
    }
   
    int totalCount() {
    	return session.selectOne("boardTotalCount");
    }
    
    List<BoardDTO> pagingBoardList(int limit[]){
    	return session.selectList("pagingBoardList", limit);
    }
  
    int updateViewcount(int board_no) {
    	return session.selectOne("updateViewcount", board_no);
    }
    
    BoardDTO getDetail(int board_no) {
    	return session.selectOne("getDetail", board_no);
    }
   
    int deleteBoard(int board_no) {
    	return session.selectOne("deleteBoard", board_no);
    }
    
    int updateBoard(BoardDTO dto) {
    	return session.selectOne("updateBoard", dto);
    }
  
    List<BoardDTO> boardSearchList(HashMap map){
    	return session.selectList("boardSearchList", map);
    }
    
    int boardSearchCount(HashMap map) {
    	return session.selectOne("boardSearchCount", map);
    }
}





