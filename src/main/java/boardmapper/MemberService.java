package boardmapper;

public interface MemberService {//기능 선언. 인터페이스 객테 생성불가능
	MemberDTO login(String id);
	String insertMember(MemberDTO dto);
	String deleteMember(String id);
}
