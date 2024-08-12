package boardmapper;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	int registerBoard(BoardDTO dto);
	///////////////////////////////////////
	int getTotalBoard();
	List<BoardDTO> getPagingBoardList(String boardname, int[] limit);
	///////////////////////////////////////
	BoardDTO updateViewcountAndGetDetail(int seq);
	
	int deleteBoard(int seq);
	
	int updateBoard(BoardDTO dto);
	
	List<BoardDTO> getSearchPagingBoardList(HashMap map);
	
	int getBoardSearchCount(HashMap map);
	
	List<BoardDTO> getRecentPost(HashMap map);
	
    Integer getNextSeq(int seq);

    Integer getPrevSeq(int seq);
}
