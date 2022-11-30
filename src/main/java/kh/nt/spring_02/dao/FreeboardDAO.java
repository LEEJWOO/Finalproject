package kh.nt.spring_02.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.nt.spring_02.model.Freeboard;
import kh.nt.spring_02.model.Freefile;

@Repository
public class FreeboardDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory ssf) {
		super.setSqlSessionFactory(ssf);
	}
	
	public List<Freeboard> home(int page) {
		return getSqlSession().selectList("home",page);
	}
	public int homepage(){
		return getSqlSession().selectOne("homepage");
	}
	
	public boolean create(Freeboard freeboard) {
		if(getSqlSession().insert("createboard", freeboard)==1)
			return true;
		return false;
	}
	public Freeboard view(int no) {
		getSqlSession().update("viewcountadd",no);
		return ((Freeboard)getSqlSession().selectOne("viewboard", no));
	}
	public List<Freefile> viewfile(int no) {
		return getSqlSession().selectList("viewfile", no);
	}
	public boolean delete(Freeboard free) {
		if(getSqlSession().delete("deleteboard",free)==1)
			return true;
		return false;
	}
	public boolean update(Freeboard free) {
		if(getSqlSession().update("updateboard",free)==1)
			return true;
		return false;
	}
	public boolean create(Freeboard free, ArrayList<Freefile> files) {
		SqlSession session=getSqlSession();
		if(session.insert("createboard", free)==1) {
			for(Freefile file:files)
				session.insert("createfile",file);
			return true;
		}
		return false;
	}

	public String downloadFile(Freefile file) {
		Freefile ff=getSqlSession().selectOne("downloadfile",file);
		return ff.getUuid()+"_"+ff.getName();
	}
}