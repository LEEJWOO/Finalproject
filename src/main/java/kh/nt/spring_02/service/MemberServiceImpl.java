package kh.nt.spring_02.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import kh.nt.spring_02.commons.Encryption;
import kh.nt.spring_02.dao.MemberDAO;
import kh.nt.spring_02.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	private ApplicationContext ac=new GenericXmlApplicationContext("classpath:context.xml");
	private Encryption en=(Encryption) ac.getBean(Encryption.class);
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private MemberDAO md;
	
	public Member login(Member member) {
		member.setPw(en.SHA256(member.getPw()));
		return md.login(member);
	}
	
	public boolean signup(Member member) {
		try{
			member.setPw(en.SHA256(member.getPw()));
			if(md.signup(member)==1)
				return true;
		}catch(Exception e){
			logger.error("SQL Constraints Error");
		}
		return false;
	}
	public boolean editid(Member member) {
		try{
			member.setPw(en.SHA256(member.getPw()));
			if(md.editid(member)==1)
				return true;
		}catch(Exception e){
			logger.error("SQL Constraints Error");
		}
		return false;
	}
	public boolean idcheck(String id) {
		if(md.idcheck(id)==null)
			return true;
		return false;
	}
	public boolean phonecheck(String phone) {
		if(md.phonecheck(phone)==null)
			return true;
		return false;
	}
	public boolean emailcheck(String email) {
		if(md.emailcheck(email)==null)
			return true;
		return false;
	}
	public boolean leave(Member member) {
		if(md.leave(member)==1)
			return true;
		return false;
	}
}
