package readinglog;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookDAO dao;

    // hyunju part
    
    @Override
    public List<BookDTO> getTodayBook() {
        return dao.getTodayBook();
    }
    
    // -------
    
    // miyeon part
    
    @Override
	public List<BookDTO> getAllBooks() {
		return dao.getAllBooks();
	}

	@Override
	public int getTotalCount() {
		return dao.totalCount();
	}

	@Override
	public List<BookDTO> getPagingBookNewList(int[] limit) {
		return dao.getPagingBookNewList(limit);
	}

	@Override
	public BookDTO getBookByTitle(String title) {
		return dao.getBookByTitle(title);
	}	
}
