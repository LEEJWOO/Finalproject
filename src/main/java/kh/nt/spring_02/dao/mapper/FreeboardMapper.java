package kh.nt.spring_02.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kh.nt.spring_02.model.Freeboard;
import kh.nt.spring_02.model.Freefile;

@Mapper
public interface FreeboardMapper{
	List<Freeboard> home(int page);
	int homepage();
	int createboard(Freeboard freeboard);
	int createfile(Freefile freefile);
	int viewcountadd(int no);
	Freeboard viewboard(int no);
	List<Freefile> viewfile(int no);
	int updateboard(Freeboard freeboard);
	int deleteboard(Freeboard freeboard);
	Freefile downloadfile(Freefile freefile);
}