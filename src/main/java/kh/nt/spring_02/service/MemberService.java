package kh.nt.spring_02.service;

import kh.nt.spring_02.model.Member;

public interface MemberService {
	public Member login(Member member);	
	public boolean signup(Member member);
	public boolean editid(Member member);
	public boolean idcheck(String id);
	public boolean phonecheck(String phone);
	public boolean emailcheck(String email);
	public boolean leave(Member member);
}