package readinglog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
    @Autowired
    private MemberService memberService;

    @GetMapping("/signup")
    public String signupForm() {
        return "signup";
    }

    @PostMapping("/")
    public String signup(@RequestParam String memId, @RequestParam String memPw, @RequestParam String memName,
                         @RequestParam String memBirth, @RequestParam String memGender, @RequestParam String memEmail,
                         @RequestParam String memPhone, Model model) {
        MemberDTO member = new MemberDTO();
        member.setMem_id(memId);
        member.setMem_pw(memPw);
        member.setMem_name(memName);
        member.setMem_birth(memBirth);
        member.setMem_gender(memGender);
        member.setMem_email(memEmail);
        member.setMem_phone(memPhone);

        if (memberService.registerMember(member)) {
            return "redirect:/login";
        } else {
            model.addAttribute("error", "이미 존재하는 아이디입니다.");
            model.addAttribute("memId", memId);  // 추가
            model.addAttribute("memPw", memPw);
            model.addAttribute("memName", memName);
            model.addAttribute("memBirth", memBirth);
            model.addAttribute("memGender", memGender);
            model.addAttribute("memEmail", memEmail);
            model.addAttribute("memPhone", memPhone);
            return "signup";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String memId, @RequestParam String memPw, Model model, HttpSession session) {
        MemberDTO member = memberService.loginMember(memId, memPw);
        if (member != null) {
            session.setAttribute("loginId", member.getMem_id());
            return "redirect:/index";
        } else {
            model.addAttribute("error", "아이디 혹은 비밀번호가 다릅니다.");
            return "login";
        }
    }
    
	// 로그아웃
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		if(session.getAttribute("loginId") != null) {
			session.removeAttribute("loginId");				
		}
		return "redirect:/index";
	}

    @GetMapping("/main")
    public String main(Model model, HttpSession session) {
        String loginId = (String) session.getAttribute("loginId");
        if (loginId != null) {
            model.addAttribute("loginId", loginId);
        } else {
            return "redirect:/login"; // 세션이 없을 경우 로그인 페이지로 리디렉션
        }
        return "main";
    }
}