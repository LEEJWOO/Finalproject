package kh.nt.spring_02.commons;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@SessionAttributes("signin")
@Configuration
@EnableWebSocket
public class WebSocketConfiguration implements WebSocketConfigurer {
//	final private String PATH="192.168.150.6:8955"; 
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(wsh(), "/chats").setAllowedOrigins("*");		
	}
	
	@Bean
	public WebSocketHandler wsh() {
		return new WebSocketHandler();
	}
}
