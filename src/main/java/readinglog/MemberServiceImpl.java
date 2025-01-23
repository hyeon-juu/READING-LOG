package readinglog;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;
	
	// chawon part
		
	@Override
	public boolean registerMember(MemberDTO member) {
		if (dao.existsByMemId(member.getMem_id())) {
            return false;
        }
        dao.registerMember(member);
        return true;
	}

	@Override
	public MemberDTO loginMember(String memId, String memPw) {
		MemberDTO member = dao.findByMemId(memId);
        if (member != null && member.getMem_pw().equals(memPw)) {
            return member;
        }
        return null;
	}

	// ----------
	
	// juhee part
	
	@Override
	public MemberDTO findByMemId(String id) {
		return dao.findByMemId(id);
	}

	@Override
	public int updateMember(HashMap map) {
		return dao.updateMember(map);
	}

	@Override
	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}
	
}
