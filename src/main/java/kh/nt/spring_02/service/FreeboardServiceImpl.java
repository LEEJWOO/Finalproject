package kh.nt.spring_02.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.nt.spring_02.dao.FreeboardDAO;
import kh.nt.spring_02.model.Freeboard;
import kh.nt.spring_02.model.Freefile;

@Service
public class FreeboardServiceImpl implements FreeboardService{

	@Autowired
	private FreeboardDAO fd;
	
	public List<Freeboard> home(int page) {
		return fd.home(page);
	}
	public int homepage(){
		return fd.homepage();
	}
	
	public boolean create(Freeboard freeboard) {
		if(fd.create(freeboard)==1)
			return true;
		return false;
	}
	public Freeboard view(int no) {
		return fd.view(no);
	}
	public List<Freefile> viewfile(int no) {
		return fd.viewfile(no);
	}
	public boolean delete(Freeboard free) {
		if(fd.delete(free)==1)
			return true;
		return false;
	}
	public boolean update(Freeboard free) {
		if(fd.update(free)==1)
			return true;
		return false;
	}
	@Transactional
	public boolean create(Freeboard free, ArrayList<Freefile> files) {
		if(fd.create(free)==1&&files!=null) {
			for(Freefile file:files) {
				if(fd.create(file)!=1)
					return false;
			}
			return true;
		}
		return false;
	}

	public String downloadFile(Freefile file) {
		Freefile ff=fd.downloadFile(file);
		return ff.getUuid()+"_"+ff.getName();
	}
}