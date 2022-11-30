package kh.nt.spring_02.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.nt.spring_02.model.Member;

@Repository
public class MemberDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory ssf) {
		super.setSqlSessionFactory(ssf);
	}
	
	public Member login(Member member) {
		return getSqlSession().selectOne("memberlogin",member);
	}
	
	public boolean signup(Member member) {
		try{
			if(getSqlSession().insert("membersignup", member)==1)
				return true;
		}catch(Exception e){
			logger.error("SQL Constraints Error");
		}
		return false;
	}
	public boolean editid(Member member) {
		try{
			if(getSqlSession().update("membereditid", member)==1)
				return true;
		}catch(Exception e){
			logger.error("SQL Constraints Error");
		}
		return false;
	}
	public boolean idcheck(String id) {
		if(getSqlSession().selectOne("idcheck",id)==null)
			return true;
		return false;
	}
	public boolean phonecheck(String phone) {
		if(getSqlSession().selectOne("phonecheck",phone)==null)
			return true;
		return false;
	}
	public boolean emailcheck(String email) {
		if(getSqlSession().selectOne("emailcheck",email)==null)
			return true;
		return false;
	}
	public boolean leave(Member member) {
		if(getSqlSession().delete("memberleave", member)==1)
			return true;
		return false;
	}
}