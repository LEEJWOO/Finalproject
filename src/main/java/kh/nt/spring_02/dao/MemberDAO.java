package kh.nt.spring_02.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.nt.spring_02.dao.mapper.MemberMapper;
import kh.nt.spring_02.model.Member;

@Repository
public class MemberDAO{
	@Autowired
	private MemberMapper mm;
	
	public Member login(Member member) {
		return mm.memberlogin(member);
	}
	public int signup(Member member) {
		return mm.membersignup(member);
	}
	public int editid(Member member) {
		return mm.membereditid(member);
	}
	public Member idcheck(String id) {
		return mm.idcheck(id);
	}
	public Member phonecheck(String phone) {
		return mm.phonecheck(phone);
	}
	public Member emailcheck(String email) {
		return mm.emailcheck(email);
	}
	public int leave(Member member) {
		return mm.memberleave(member);
	}
}