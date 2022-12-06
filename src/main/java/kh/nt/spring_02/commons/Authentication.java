package kh.nt.spring_02.commons;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class Authentication implements HandlerInterceptor{
		
	private static final Logger logger = LoggerFactory.getLogger(Authentication.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		HttpSession hs=request.getSession();
		if(hs.getAttribute("signin")==null) {
			try {
				response.sendRedirect("/spring_02");
			} catch (IOException e) {
				logger.error("Authentication"+e.toString());
			}
			return false;
		}
		return true;
	}
}