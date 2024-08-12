package boardmapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;
	
	@GetMapping("/boardwrite")
	String writeform() throws Exception{
		return "board/writeform";
	}
	
	@PostMapping("/boardwrite")
    public ModelAndView writeprocess(BoardDTO dto, RedirectAttributes redirectAttributes){
        int insertrow = service.registerBoard(dto);
        ModelAndView mv = new ModelAndView();

        if(insertrow > 0) {
            redirectAttributes.addAttribute("insertrow", insertrow);
            mv.setViewName("redirect:/board");
        } else { 
            mv.addObject("message", "게시물 등록에 실패하였습니다. 다시 시도해주세요.");
            mv.setViewName("board/writeform");
        }
        return mv;
    }

	
	@RequestMapping("/boardupdate")
	ModelAndView boardupdate(int seq) {
		BoardDTO dto = service.updateViewcountAndGetDetail(seq);
		
		ModelAndView mv= new ModelAndView();
		mv.addObject("detaildto", dto);
		mv.setViewName("board/updateform");
		return mv;
	}
	@RequestMapping("/board")
	public ModelAndView boardlist(@RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum) {
	    int pagecount = 15;
	    int start = (pagenum - 1) * pagecount;
	    int[] limit = {start, pagecount};
	    
	    String boardname = "전체";
	    int totalboard = service.getTotalBoard();
	    List<BoardDTO> boardlist = service.getPagingBoardList(boardname, limit);

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("totalboard", totalboard);
	    mv.addObject("boardlist", boardlist);
	    mv.setViewName("board/list");
	    return mv;
	}
	
	@RequestMapping("/communityboard")
	public ModelAndView commboardlist(@RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum) {
	    int pagecount = 15;
	    int start = (pagenum - 1) * pagecount;
	    int[] limit = {start, pagecount};
	    
	    String boardname = "커뮤니티"; // 커뮤니티 게시판
	    int totalboard = service.getTotalBoard();
	    List<BoardDTO> boardlist = service.getPagingBoardList(boardname, limit);

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("totalboard", totalboard);
	    mv.addObject("boardlist", boardlist);
	    mv.setViewName("board/commlist");
	    return mv;
	}
	
	@RequestMapping("/itemboard")
	public ModelAndView itemboardlist(@RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum) {
	    int pagecount = 15;
	    int start = (pagenum - 1) * pagecount;
	    int[] limit = {start, pagecount};
	    
	    String boardname = "상품거래";
	    int totalboard = service.getTotalBoard();
	    List<BoardDTO> boardlist = service.getPagingBoardList(boardname, limit);

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("totalboard", totalboard);
	    mv.addObject("boardlist", boardlist);
	    mv.setViewName("board/itemlist");
	    return mv;
	}

	
	@RequestMapping("/boarddetail")
	ModelAndView boarddetail(int seq) {
		BoardDTO dto = service.updateViewcountAndGetDetail(seq);
		
        Integer nextSeq = service.getNextSeq(seq);
        Integer prevSeq = service.getPrevSeq(seq);
		
		ModelAndView mv= new ModelAndView();
		mv.addObject("detaildto", dto);
        mv.addObject("nextSeq", nextSeq);
        mv.addObject("prevSeq", prevSeq);
		mv.setViewName("board/detail");
		return mv;
	}

	@RequestMapping("/communityboarddelete")
	String commboarddelete(int seq) {
	    int delete = service.deleteBoard(seq);
	    return "redirect:/communityboard";
	   
	}

	@RequestMapping("/itemboarddelete")
	String itemboarddelete(int seq) {
	    int delete = service.deleteBoard(seq);
	    return "redirect:/itemboard";
	   
	}
	
	@RequestMapping("/communityboardupdate")
	String commboardupdate(BoardDTO dto) {
		service.updateBoard(dto);
		return "redirect:/communityboard";
	}
	
	@RequestMapping("/itemboardupdate")
	String itemboardupdate(BoardDTO dto) {
		service.updateBoard(dto);
		return "redirect:/itemboard";
	}
	
	@RequestMapping("/boardsearchlist")
	ModelAndView boardsearchlist(
	String item, String word, @RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum	) {
		int pagecount = 15;
		int start = (pagenum -1) * pagecount;
		int limit[] = {start, pagecount};
		

	
		HashMap map = new HashMap();
		if(item.equals("all")) {
			map.put("searchcolname", null);
		}
		else {
			map.put("searchcolname", item);
		}
		map.put("searchvalue", "%" + word + "%");
		
		map.put("limit", limit);
		//
		int totalsearchboard = service.getBoardSearchCount(map);
		List<BoardDTO> boardsearchlist = service.getSearchPagingBoardList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalsearchboard", totalsearchboard);
		mv.addObject("boardsearchlist", boardsearchlist);
		mv.setViewName("searchlist");
		return mv;
		
	}
	
	@GetMapping("/recentPost")
	public String getRecentPosts(HttpServletRequest request) {
	    HashMap map = new HashMap();
	    List<BoardDTO> recentPost = service.getRecentPost(map);
	    request.setAttribute("recentPost", recentPost);
	    return "recentPost";
	}
}