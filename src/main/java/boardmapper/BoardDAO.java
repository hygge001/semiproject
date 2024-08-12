package boardmapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;


@Mapper
@Repository
public interface BoardDAO {

    int insertBoard(BoardDTO dto); 
   
    int totalCount();
    
    List<BoardDTO> pagingBoardList(int limit[]);
    List<BoardDTO> pagingBoardList(@Param("boardname") String boardname, @Param("limit") int[] limit);
  
    int updateViewcount(int seq);
    
    BoardDTO getDetail(int seq);
   
    int deleteBoard(int seq);
    
    int updateBoard(BoardDTO dto) ;
  
    List<BoardDTO>  boardSearchList(HashMap map) ;
    
    int boardSearchCount(HashMap map);
    
    List<BoardDTO>  selectRecentPost(HashMap map) ;

    Integer getNextSeq(int seq);

    Integer getPrevSeq(int seq);
}





