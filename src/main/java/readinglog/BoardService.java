package readinglog;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	int registerBoard(BoardDTO dto);
	
	int getTotalBoard();
	
	List<BoardDTO> getPagingBoardList(int [] limit);
	
	BoardDTO updateViewcountAndGetDetail(int board_no);
	
	int deleteBoard(int board_no);
	
	int updateBoard(BoardDTO dto);
	
	List<BoardDTO> getSearchPagingBoardList(HashMap map);
	
	int getBoardSearchCount(HashMap map);
}
