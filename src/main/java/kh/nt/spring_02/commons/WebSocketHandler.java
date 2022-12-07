package kh.nt.spring_02.commons;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kh.nt.spring_02.model.Member;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class WebSocketHandler extends TextWebSocketHandler{
	private static HashMap<WebSocketSession,String> sessions = new HashMap<WebSocketSession,String>();
	public WebSocketHandler() {
		super();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		sessions.put(session, ((Member)session.getAttributes().get("signin")).getId());
	}
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		try {
			for(WebSocketSession s : sessions.keySet())
				s.sendMessage(new TextMessage((String)sessions.get(s)+" : "+message.getPayload()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		log.info(session+"closed");
		sessions.remove(session);
	}
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		log.error(session+exception.toString());
	}
}
