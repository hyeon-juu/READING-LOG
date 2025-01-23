package readinglog;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession session;
	
	// chawon part
	
	// 회원가입
	public int registerMember(MemberDTO dto) {
		return session.insert("registerMember", dto);
	}
	
	// 해당 id 회원 존재여부 확인
	public boolean existsByMemId(String id) {
		MemberDTO dto = session.selectOne("findByMemId", id);
		if(dto != null) {
			return true;
		} else {
			return false;
		}
	}
	
	// ---------

	// juhee part
	
	// 해당 id 회원정보 조회(oneMember)
	MemberDTO findByMemId(String id) {
		MemberDTO dto = session.selectOne("findByMemId", id);
		return dto;
	}

	// 해당 id 회원 특정 컬럼 데이터 수정
	public int updateMember(HashMap map) {
		return session.update("updateMember", map);
	}

	
	// 해당 id 회원 탈퇴
	public int deleteMember(String id) {
		return session.delete("deleteMember", id);
	}
	
}
