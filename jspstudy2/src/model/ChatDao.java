package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ChatMapper;

public class ChatDao {
	private Class<ChatMapper> cls = ChatMapper.class;
	Map<String, Object> map = new HashMap<>();
	public boolean insert(String message) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if(message != null) {
				String[] mes = message.split(":");
				map.put("id", mes[0].trim());
				map.put("content", mes[1].trim());
			}
			session.getMapper(cls).insert(map);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
}
