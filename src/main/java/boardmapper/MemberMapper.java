package boardmapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository //@ComponentScan 에 의해 인식객체생
@Mapper  //@MapperScan 에 의해 인식. 인터페이스 상속 하위클래스 객체 생성 . 메소드명등은 sql매핑파일 정의 동
public interface MemberMapper {
 //membertbl-mapping.xml 파일 id=""sql 실
	//id="onemember" resultType="memberdto" parameterType="String"
	MemberDTO onemember(String id);
	
	int insertMember(MemberDTO dto);
	
	int deleteMember(String id);
	
}
