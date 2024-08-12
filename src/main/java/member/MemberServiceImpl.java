package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public MemberDTO login(String id) {
		return mapper.onemember(id);
	}
	
	@Override
	public String insertMember(MemberDTO dto) {
		System.out.println(dto.getId());
		MemberDTO mybatis_dto = mapper.onemember(dto.getId());
		if(mybatis_dto != null ) {
			return "아이디 중복 - 회원가입할 수 없습니다.";
		}
		else {
			mapper.insertMember(dto);
			return "정상적으로 회원가입되었습니다.";
		}
	}
	
	@Override
	public String deleteMember(String id) {
		MemberDTO mybatis_dto = mapper.onemember(id);
		if(mybatis_dto == null) {
			return "삭제할 회원 정보가 없습니다.";
		}
		else {
			mapper.deleteMember(id);
			return "정상적으로 탈퇴처리되었습니다.";
		}
	}
}
