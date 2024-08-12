package boardmapper;

import java.time.LocalDateTime;

public class CommentDTO {
    private int seq;
    private int boardSeq;
    private String contents;
    private String writer;
    private LocalDateTime writingTime;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public int getBoardSeq() {
        return boardSeq;
    }

    public void setBoardSeq(int boardSeq) {
        this.boardSeq = boardSeq;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
 
    public LocalDateTime getWritingtime() {
        return writingTime;
    }

    public void setWritingTime(LocalDateTime writingTime) {
        this.writingTime = writingTime;
    }

	@Override
	public String toString() {
		return "BoardDTO [seq=" + seq + ", boardSeq=" + boardSeq + ", contents=" + contents + ", writer=" + writer + ","
				+ "writingTime=" + writingTime + "]";
	}
	
}