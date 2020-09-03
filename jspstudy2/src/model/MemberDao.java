package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//ȸ�� ��� ���� �޼���
	public List<Member> list(){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			List<Member> list = session.getMapper(cls).select(null);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//���̵�ã��
	public String findid(String email, String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).findid(email, tel);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//��й�ȣ ã��
	public String findpw(String id, String email, String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).findpw(id, email, tel);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//ȸ����������
	public int update(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//��й�ȣ ����
	public int updatePass(String id, String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).updatePass(id, pass);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;   // ������ ������ �߻��ߴٸ�, catch �������� ���� ���� ��� �� ���� 0 return 
	}
	
	//���� ����
	public int deletePass(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).deletePass(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
}

