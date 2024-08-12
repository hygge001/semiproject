package boardmapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	// login --- 로그인폼 view
	@Autowired
	
	@Qualifier("memberServiceImpl")
	MemberService service ;

	@RequestMapping("/login")
	String loginform(){
	 return "member/loginform";
	}

	@RequestMapping("/loginprocess")
	String loginprocess(MemberDTO dto , HttpSession session) {

	 MemberDTO resultdto = service.login(dto.getId());
	 if(resultdto != null && resultdto.getPassword().equals(dto.getPassword())){
		 session.setAttribute("memberdto", resultdto);
	 }
	 return "member/loginSuccess";
	 
 }

	@RequestMapping("/logout")
	String logout(HttpSession session) {
	// service - mapper - sql매핑xml 
	 if(session.getAttribute("memberdto") != null){
		 session.removeAttribute("memberdto");
	 } 
	 return "main";	 
 }
 
    @RequestMapping("/myinfo")
    String myinfo(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("memberdto") == null) {
            redirectAttributes.addFlashAttribute("loginMessage", "로그인해주세요");
            return "member/loginFailure";
        }
        return "member/myinfo";
    }

    
    @GetMapping("/addMember")
    String addForm() {
    	return "member/addMember";
    }
 
    @PostMapping("/addMember")
 	ModelAndView addMember(HttpServletRequest request , MemberDTO dto){
	    dto.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2") );
		dto.setPhonenumber(request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3") );
	    System.out.println("==>"+dto);
		
		String insertMember = service.insertMember(dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("insertMember", insertMember);
		mv.setViewName("main");
		return mv;
 }
 
 	@GetMapping("/withdraw")
 	String withdraw(String id) {
 		System.out.println("withdraw"+ id);
	 String deleteMember = service.deleteMember(id);
	 return "main";
 	}
 
 
 
// url -- model -- view
}



