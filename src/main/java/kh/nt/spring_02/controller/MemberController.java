package kh.nt.spring_02.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kh.nt.spring_02.model.Member;
import kh.nt.spring_02.service.MemberServiceImpl;

@RequestMapping(value="/member/")
@SessionAttributes("signin")
@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private HttpSession hs;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Locale locale, Model model, Member member, SessionStatus ss){
		if(hs.getAttribute("signin")==null&&member!=null) {
			model.addAttribute("signin", memberService.login(member));
		}else if(hs.getAttribute("signin")!=null)
			ss.setComplete();
		return "redirect:/";
	}
	@RequestMapping(value="signup")
	public String tosignup(){
		return "member/tosignup";
	}
	@RequestMapping(value="editid")
	public String toeditid(){
		return "member/toeditid";
	}
	@RequestMapping(value="id_check", method=RequestMethod.POST)
	@ResponseBody
	public boolean id_check(String id){
		return memberService.idcheck(id);
	}
	@RequestMapping(value="phone_check", method=RequestMethod.POST)
	@ResponseBody
	public boolean phone_check(String phone){
		return memberService.phonecheck(phone);
	}
	@RequestMapping(value="email_check", method=RequestMethod.POST)
	@ResponseBody
	public boolean email_check(String email){
		return memberService.emailcheck(email);
	}
	@RequestMapping(value="signup_check", method=RequestMethod.POST)
	public String signup_check(Member member){
		if(memberService.signup(member))
			return "redirect:/";
		logger.error("signup fails");
		return "member/signup";
	}
	@RequestMapping(value="editid_check", method=RequestMethod.POST)
	public String editid_check(Member member, SessionStatus ss){
		member.setId(((Member) hs.getAttribute("signin")).getId());
		member.setPhone(((Member) hs.getAttribute("signin")).getPhone());
		member.setEmail(((Member) hs.getAttribute("signin")).getEmail());
		if(memberService.editid(member)) {
			ss.setComplete();
			return "redirect:/";
		}
		logger.error("editid fails");
		return "member/toeditid";
	}
	@RequestMapping(value="leave", method=RequestMethod.POST)
	@ResponseBody
	public boolean member_leave(SessionStatus ss){
		ss.setComplete();
		return memberService.leave((Member) hs.getAttribute("signin"));
	}
	@ExceptionHandler(Exception.class)
	public String error(Exception e) {
//		StringWriter sw = new StringWriter();
//		e.printStackTrace(new PrintWriter(new StringWriter()));
//		logger.error(sw.toString());
		logger.error(e.toString());
		return "error";
	}
}