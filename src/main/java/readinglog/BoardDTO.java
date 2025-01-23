package readinglog;

public class BoardDTO {
    int board_no;
    String board_title, board_contents, board_writer;
    int  board_viewcount;
    String board_pw, board_writingtime;

    public int getBoard_no() {
        return board_no;
    }

    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }

    public String getBoard_title() {
        return board_title;
    }

    public void setBoard_title(String board_title) {
        this.board_title = board_title;
    }

    public String getBoard_contents() {
        return board_contents;
    }

    public void setBoard_contents(String board_contents) {
        this.board_contents = board_contents;
    }

    public String getBoard_writer() {
        return board_writer;
    }

    public void setBoard_writer(String board_writer) {
        this.board_writer = board_writer;
    }

    public String getBoard_pw() {
        return board_pw;
    }

    public void setBoard_pw(String board_pw) {
        this.board_pw = board_pw;
    }

    public int getBoard_viewcount() {
        return board_viewcount;
    }

    public void setBoard_viewcount(int board_viewcount) {
        this.board_viewcount = board_viewcount;
    }

    public String getBoard_writingtime() {
        return board_writingtime;
    }

    public void setBoard_writingtime(String board_writingtime) {
        this.board_writingtime = board_writingtime;
    }

    @Override
    public String toString() {
        return "BoardDTO [board_no=" + board_no + ", board_title=" + board_title + ", board_contents=" + board_contents + ", board_writer=" + board_writer + ", board_viewcount=" + board_viewcount + ", board_writingtime=" + board_writingtime 
                + ", board_pw=" + board_pw + "]";
    }
}
