package readinglog;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;
	
	@Override
	public int registerBoard(BoardDTO dto) {
		return dao.insertBoard(dto);
	}

	@Override
	public int getTotalBoard() {
		return dao.totalCount();
	}

	@Override
	public List<BoardDTO> getPagingBoardList(int[] limit) {
		return dao.pagingBoardList(limit);
	}

	@Override
	public BoardDTO updateViewcountAndGetDetail(int board_no) {
		dao.updateViewcount(board_no);
		return dao.getDetail(board_no);
	}

	@Override
	public int deleteBoard(int board_no) {
		return dao.deleteBoard(board_no);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public List<BoardDTO> getSearchPagingBoardList(HashMap map) {
		return dao.boardSearchList(map);
	}

	@Override
	public int getBoardSearchCount(HashMap map) {
		return dao.boardSearchCount(map);
	}
	
	
	
	
}
