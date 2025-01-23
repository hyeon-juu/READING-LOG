package readinglog;

import java.util.HashMap;

public interface MemberService {
	
	// chawon part
	
	// 회원가입
	boolean registerMember(MemberDTO member);

	// 로그인
	MemberDTO loginMember(String memId, String memPw);
	
	// ----------
	
	// juhee part
	
	// 해당 id 회원정보 조회
	MemberDTO findByMemId(String id);

	// 해당 id 회원 특정 컬럼 데이터 수정
	int updateMember(HashMap map);

	// 해당 id 회원 탈퇴
	int deleteMember(String id);
}
