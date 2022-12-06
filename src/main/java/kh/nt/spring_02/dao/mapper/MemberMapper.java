package kh.nt.spring_02.dao.mapper;

import org.apache.ibatis.annotations.Mapper;

import kh.nt.spring_02.model.Member;

@Mapper
public interface MemberMapper {
	Member memberlogin(Member member);
	int membersignup(Member member);
	int membereditid(Member member);
	Member idcheck(String id);
	Member phonecheck(String id);
	Member emailcheck(String id);
	int memberleave(Member member);
}
