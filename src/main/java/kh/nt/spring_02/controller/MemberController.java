package kh.nt.spring_02.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kh.nt.spring_02.dao.MemberDAO;
import kh.nt.spring_02.model.Member;

@Controller
@RequestMapping(value="/member/")
@SessionAttributes("signin")
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private ApplicationContext ac=new GenericXmlApplicationContext("classpath:context.xml");
	private Encryption en=(Encryption) ac.getBean(Encryption.class);
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Locale locale, Model model, Member member, HttpSession hs, SessionStatus ss){
		if(hs.getAttribute("signin")==null&&member!=null) {
			member.setPw(en.SHA256(member.getPw()));
			model.addAttribute("signin", memberDAO.login(member));
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
		return memberDAO.idcheck(id);
	}
	@RequestMapping(value="phone_check", method=RequestMethod.POST)
	@ResponseBody
	public boolean phone_check(String phone){
		return memberDAO.phonecheck(phone);
	}
	@RequestMapping(value="email_check", method=RequestMethod.POST)
	@ResponseBody
	public boolean email_check(String email){
		return memberDAO.emailcheck(email);
	}
	@RequestMapping(value="signup_check", method=RequestMethod.POST)
	public String signup_check(Member member){
		member.setPw(en.SHA256(member.getPw()));
		if(memberDAO.signup(member))
			return "redirect:/";
		logger.error("signup fails");
		return "member/signup";
	}
	@RequestMapping(value="editid_check", method=RequestMethod.POST)
	public String editid_check(Member member, HttpSession hs, SessionStatus ss){
		member.setId(((Member) hs.getAttribute("signin")).getId());
		member.setPhone(((Member) hs.getAttribute("signin")).getPhone());
		member.setEmail(((Member) hs.getAttribute("signin")).getEmail());
		member.setPw(en.SHA256(member.getPw()));
		if(memberDAO.editid(member)) {
			ss.setComplete();
			return "redirect:/";
		}
		logger.error("editid fails");
		return "member/toeditid";
	}
	@RequestMapping(value="leave", method=RequestMethod.POST)
	@ResponseBody
	public boolean member_leave(HttpSession hs, SessionStatus ss){
		ss.setComplete();
		return memberDAO.leave((Member) hs.getAttribute("signin"));
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