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

@ServerEndpoint("/chatting")     //�������� ����Ŭ���� ����
public class ChatController {
	private ChatDao dao = new ChatDao();
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());   // clients: set ��ü(�ߺ�X)
	// session : �޼����� ������ session ��ü
	// message : Ŭ���̾�Ʈ�� ������ �޼��� => [ id : �Էµ� �޼��� ] ����
	@OnMessage   //client ���� �޼��� ����
	public void onMessage(String message, Session session) throws IOException {
		synchronized(clients) {  //��� ��ü�� ��� ������ ����. 
			dao.insert(message);
			for(Session client : clients) {    // broadcast : ��� Ŭ���̾�Ʈ���� �޼��� ����
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);   //���� ������(���� ������ ������) Ŭ���̾�Ʈ�鿡�� �޼��� ���� 
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
