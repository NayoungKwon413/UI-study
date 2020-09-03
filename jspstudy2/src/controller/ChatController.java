package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import model.ChatDao;

@ServerEndpoint("/chatting")     //웹소켓의 서버클래스 지정
public class ChatController {
	private ChatDao dao = new ChatDao();
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());   // clients: set 객체(중복X)
	// session : 메세지를 전송한 session 객체
	// message : 클라이언트가 전송한 메세지 => [ id : 입력된 메세지 ] 형태
	@OnMessage   //client 에서 메세지 수신
	public void onMessage(String message, Session session) throws IOException {
		synchronized(clients) {  //통신 자체는 모두 스레드 형식. 
			dao.insert(message);
			for(Session client : clients) {    // broadcast : 모든 클라이언트에게 메세지 전송
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);   //나를 제외한(나의 세션을 제외한) 클라이언트들에게 메세지 전송 
				}
			}
		}
	}
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
