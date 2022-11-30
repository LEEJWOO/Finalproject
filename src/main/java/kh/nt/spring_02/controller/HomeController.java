package kh.nt.spring_02.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("signin")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	private ApplicationContext ac=new GenericXmlApplicationContext("classpath:context.xml");
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	@ExceptionHandler(Exception.class)
	public String error(Exception e) {
		logger.error(e.toString());
		return "error";
	}
}