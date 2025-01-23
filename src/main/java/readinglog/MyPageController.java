package readinglog;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	
	@Autowired
	MemberService member_service;
	
	@Autowired
	OrderService order_service;
	
	// 임시 로그인 페이지
	@GetMapping("mypagelogin")
	String myPageLoginForm() {
		
		return "login_tmp";
		
	} // myPageLoginForm() end
	
	// 로그인 과정
	@PostMapping("mypagelogin")
	String myPageLoginProcess(String id, String pw, HttpSession session) {
		
		MemberDTO dto = member_service.findByMemId(id);
		if(dto != null) {
			if(dto.getMem_pw().equals(pw)) {
				// 세션에 id 저장(로그인 정보 유지)
				session.setAttribute("loginId", dto.getMem_id());
				System.out.println("login success");
			} 
		} else { // 로그인 실패
			System.out.println("회원정보 확인하세요");
		}
		
		return "login_tmp";
		
	} // myPageLoginProcess() end
	
	// 마이페이지
	@RequestMapping("mypage")
	ModelAndView myPage(@RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		// get recent orderlist
		int pagecount = 3;
		int start = (pagenum - 1) * pagecount;
		int[] limit = {start, pagecount};
		int totalOrderCnt = order_service.getOneMemberOrderListCnt(id);
		
		HashMap map = new HashMap();
		map.put("limit", limit);
		map.put("id", id);
		
		List<OrderDTO> orderlist = order_service.getPagingOneMemberOrderList(map);
		
		
		MemberDTO dto = member_service.findByMemId(id);
		if(dto != null) {			
			mv.addObject("totalOrderCnt", totalOrderCnt);
			mv.addObject("memberdto", dto);
			mv.addObject("orderlist", orderlist);
			mv.setViewName("mypage/myPage");
		} else {
			System.out.println("dto is null, Do login");
			mv.setViewName("login_tmp");
		}
		
		return mv;
		
	} // myPage() end
	
	// 회원정보 수정 화면
	@GetMapping("/modifyaccount")
	ModelAndView modifyAccount(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		MemberDTO dto = member_service.findByMemId(id);
		
		mv.addObject("memberdto", dto);
		mv.setViewName("mypage/modifyAccountPage");
		
		return mv;
	}
	
	// 회원정보 수정 과정
	@PostMapping("/modifyaccount")
	String modifyAccountProcess(MemberDTO dto, HttpSession session) {
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		HashMap<String, String> map = new HashMap<>();
		
		if(dto.mem_email != null) {
			map.put("colname", "mem_email");
			map.put("colvalue", dto.mem_email);
			map.put("id", id);
		} else if(dto.mem_phone != null) {
			map.put("colname", "mem_phone");
			map.put("colvalue", dto.mem_phone);
			map.put("id", id);
		}
		
		int updaterows = member_service.updateMember(map);
		
		return "redirect:/modifyaccount";
	}
	
	// 비밀번호 수정 화면
	@GetMapping("/modifypw")
	ModelAndView modifyPw(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		MemberDTO dto = member_service.findByMemId(id);
				
		mv.addObject("memberdto", dto);
		mv.setViewName("mypage/modifyPwPage");
		
		return mv;
	}
	
	// 비밀번호 수정 과정
	@PostMapping("/modifypw")
	String modifyPwProcess(String mem_pw, HttpSession session) {
		
		System.out.println("modifyPWProcess");
		System.out.println(mem_pw);
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("colname", "mem_pw");
		map.put("colvalue", mem_pw);
		map.put("id", id);
		
		int updaterows = member_service.updateMember(map);
		
		return "redirect:/modifypw";
	}
	
	// 회원탈퇴 화면
	@GetMapping("/deleteaccount")
	ModelAndView deleteAccount(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		MemberDTO dto = member_service.findByMemId(id);
		
		mv.addObject("memberdto", dto);
		mv.setViewName("mypage/deleteAccountPage");
		
		return mv;
	}
	
	@PostMapping("/deleteaccount")
	ModelAndView deleteAccountProcess(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		// login member information
		String id = (String)session.getAttribute("loginId");
		
		int deleterows = member_service.deleteMember(id);
		
		session.removeAttribute("loginId");	
		
		mv.setViewName("redirect:/index");
		
		return mv;
	}
	

	
}
