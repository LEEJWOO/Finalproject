package kh.nt.spring_02.controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import kh.nt.spring_02.dao.FreeboardDAO;
import kh.nt.spring_02.model.Freeboard;
import kh.nt.spring_02.model.Freefile;
import kh.nt.spring_02.model.Member;

@Controller
@RequestMapping(value="/freeboard/")
@SessionAttributes("signin")
@MultipartConfig(
		fileSizeThreshold=1024*1024*2,
		maxFileSize=1024*1024*2,
		maxRequestSize=1024*1024*4,
		location="C://resource//"
		)
public class FreeboardController {
	
	@Autowired
	private FreeboardDAO freeboardDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(FreeboardController.class);
//	private ApplicationContext ac=new GenericXmlApplicationContext("classpath:context.xml");
//	private Encryption en=(Encryption) ac.getBean(Encryption.class);

	private static final String DOWNLOAD_PATH = "C://resource//";
	
	@RequestMapping(value="home")
	public String home(Model model, int page){
		model.addAttribute("freeboard",freeboardDAO.home(page));
		model.addAttribute("freepage",freeboardDAO.homepage());
		return "freeboard/freeboard";
	}
	@RequestMapping(value="create")
	public String create(){
		return "freeboard/create";
	}
	
	@RequestMapping(value="create_check")
	public String create_check(Freeboard freeboard,HttpSession hs,@RequestParam("file") MultipartFile[] files){
		try {
			freeboard.setId(((Member)hs.getAttribute("signin")).getId());
			if(files.length==0) {
				if(freeboardDAO.create(freeboard))
					return "redirect:home?page=1";
			}
			else {
				ArrayList<Freefile> ff=new ArrayList<Freefile>();
				for(MultipartFile file:files) {
					if(!file.getOriginalFilename().isEmpty()) {
						String uuid=UUID.randomUUID().toString();
						file.transferTo(new File(DOWNLOAD_PATH + "/"+uuid+"_"+file.getOriginalFilename()));
						ff.add(new Freefile(uuid,((Member)hs.getAttribute("signin")).getId(),file.getOriginalFilename()));
					}
				}
				if(freeboardDAO.create(freeboard,ff))
					return "redirect:home?page=1";
			}
		}catch(Exception e) {
			logger.info("writing fails");
		}
		return"freeboard/create";
	}
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view_page(Model model ,int no){
		HashMap<String,Object> free = new HashMap<String,Object>();
		free.put("board",freeboardDAO.view(no));
		free.put("file",freeboardDAO.viewfile(no));
		model.addAttribute("free",free);
		return "freeboard/view"; 
	}
	
	@RequestMapping(value="deleteboard", method=RequestMethod.GET)
	public String delete_board(Model model ,int no, HttpSession hs){
		Freeboard free=new Freeboard();
		free.setNo(no);
		free.setId(((Member)hs.getAttribute("signin")).getId());
		if(freeboardDAO.delete(free))
			return "freeboard/home?page=1";
		logger.info("delete fails");
		return "freeboard/view?no="+no;
	}
	
	@RequestMapping(value="download")
	@ResponseBody
	public String download(Freefile reqfile, HttpServletResponse response) {
		String downPath=freeboardDAO.downloadFile(reqfile);
		if(downPath!=null){	
			File file=new File("C:\\resource\\"+downPath);
			try(OutputStream os = response.getOutputStream();FileInputStream fis = new FileInputStream(file);DataInputStream dis=new DataInputStream(fis)){
				response.setHeader("content-Disposition","attachment;filename="+new String(reqfile.getName().getBytes("utf8"),"ISO-8859-1"));
				byte[] fileContents= new byte[(int)file.length()];
				dis.readFully(fileContents);
				os.write(fileContents);
				os.flush();
			} catch (IOException e) {
				logger.error("download fails"+e);
			}
		}
		return null;
	}
	@RequestMapping(value="updateboard", method=RequestMethod.GET)
	@ResponseBody
	public boolean updateboard(Freeboard freeboard,HttpSession hs) {
		freeboard.setId(((Member)hs.getAttribute("signin")).getId());
		return freeboardDAO.update(freeboard);
	}
	
	@ExceptionHandler(Exception.class)
	public String error(Exception e) {
//		StringWriter sw = new StringWriter();
//		e.printStackTrace(new PrintWriter(new StringWriter()));
//		logger.error(sw.toString());
		logger.error(e.toString());
		return "error";
	}
}