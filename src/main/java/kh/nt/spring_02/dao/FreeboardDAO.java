package kh.nt.spring_02.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.nt.spring_02.dao.mapper.FreeboardMapper;
import kh.nt.spring_02.model.Freeboard;
import kh.nt.spring_02.model.Freefile;

@Repository
public class FreeboardDAO{
	@Autowired
	private FreeboardMapper fm;
	
	public List<Freeboard> home(int page) {
		return (List<Freeboard>) fm.home(page);
	}
	public int homepage(){
		return fm.homepage();
	}
	public int create(Freeboard freeboard) {
		return fm.createboard(freeboard);
	}
	public Freeboard view(int no) {
		fm.viewcountadd(no);
		return fm.viewboard(no);
	}
	public List<Freefile> viewfile(int no) {
		return (List<Freefile>) fm.viewfile(no);
	}
	public int delete(Freeboard free) {
		return fm.deleteboard(free);
	}
	public int update(Freeboard free) {
		return fm.updateboard(free);
	}
	public int create(Freefile file) {
		return fm.createfile(file);
	}
	public Freefile downloadFile(Freefile file) {
		return fm.downloadfile(file);
	}
}