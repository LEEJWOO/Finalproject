package kh.nt.spring_02.service;

import java.util.ArrayList;
import java.util.List;

import kh.nt.spring_02.model.Freeboard;
import kh.nt.spring_02.model.Freefile;

public interface FreeboardService {
	public List<Freeboard> home(int page);
	public int homepage();
	public boolean create(Freeboard freeboard);
	public Freeboard view(int no);
	public List<Freefile> viewfile(int no);
	public boolean delete(Freeboard free);
	public boolean update(Freeboard free);
	public boolean create(Freeboard free, ArrayList<Freefile> files);
	public String downloadFile(Freefile file);
}