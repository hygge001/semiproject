package boardmapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
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
	public List<BoardDTO> getPagingBoardList(String boardname, int[] limit) {
	    return dao.pagingBoardList(boardname, limit);
	}

	@Override
	public BoardDTO updateViewcountAndGetDetail(int seq) {
		dao.updateViewcount(seq);
		return dao.getDetail(seq);
	}
	
	@Override
	public Integer getNextSeq(int seq) {
	    return dao.getNextSeq(seq);
	}
	
	@Override
	public Integer getPrevSeq(int seq) {
	    return dao.getPrevSeq(seq);
	}

	@Override
	public int deleteBoard(int seq) {
		return dao.deleteBoard(seq);
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
	
	@Override
	public List<BoardDTO> getRecentPost (HashMap map) {
		return dao.selectRecentPost(map);
	}
}
