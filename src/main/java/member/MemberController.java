package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	// login --- 로그인폼 view
	@Autowired
	
	@Qualifier("memberServiceImpl")
	MemberService service ;

	@RequestMapping("/")
	String main(){ return "main";}
	
	@RequestMapping("/login")
	String loginform(){
	 return "login/loginform";//입력뷰
	}

	@RequestMapping("/loginprocess")
	String loginprocess(MemberDTO dto , HttpSession session) {
	 //id, password 변수 전 -- dto id, password 동일명 변수 자동 저장 
	 System.out.println(dto.getId());
	/* 1, select * from membertbl where id=? 정의 
	 * 2. Mapper 인터페이스ㅜ- dao
	 * 3.service 인터페이스+하위래
	 * 4. 컨트롤러 - 3 - 2 - 1 - db sql 전송 
	 */
	 MemberDTO resultdto = service.login(dto.getId());
	 if(resultdto != null && resultdto.getPassword().equals(dto.getPassword())){
		 session.setAttribute("memberdto", resultdto);
	 }
	 System.out.println("controller==>"+session.getAttribute("memberdto"));
	 return "main";//결과뷰
	 
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
 String myinfo(/*HttpSession session*/) {
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



