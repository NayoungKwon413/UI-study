package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Student;
import mapper.StudentMapper;

public class Main4 {
	private final static String NS = "mapper.StudentMapper."; //���ӽ����̽� => �������̽� �̸�
	private static SqlSessionFactory sqlMap;    
	static {  
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");  
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();   //openSession() : Ŀ�ؼ� ������
		System.out.println("��� �л� ���� ��ȸ�ϱ�");
		System.out.println("xml ������� ȣ���ϱ�");
		List<Student> list = session.selectList(NS + "select");
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("�������̽� ������� ȣ���ϱ�");
		//StudentMapper ��� Ŭ������ Class(����� ���� �ڷ���) ��ü�� ���� ��, StudentMapper.class : �������̽� �ڷ���
		Class<StudentMapper> css = StudentMapper.class; 
		list = session.getMapper(css).select(null);     // session�� studentMapper Ŭ������ ����ϰ� �� ���� select �޼��带 ���
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("1�г� �л��� ���� ��ȸ�ϱ�");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grade",1);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("981213 �й� �л� ���� ��ȸ�ϱ�");
		map.clear();
		map.put("studno", 981213);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("�����԰� 80�̻��� �л� ���� ��ȸ�ϱ�");
		map.clear();
		map.put("weight", 80);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("��� �л����� �߰��ϱ�");
		Student st = new Student();
		st.setStudno(1001);
		st.setName("���");
		st.setJumin("1234561234567");
		st.setId("kimsk");
		int result = session.getMapper(StudentMapper.class).insert(st);
		System.out.println(result + "�� �߰�");
		System.out.println("��� �л����� ��ȸ�ϱ�");
		map.clear();
		map.put("studno", 1001);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("��� �л��� �г�:1, ������:80, Ű:175�� �����ϱ�");
		st.setGrade(1);
		st.setWeight(80);
		st.setHeight(175);
		result = session.getMapper(StudentMapper.class).update(st);
		System.out.println(result + "�� ����");
		System.out.println("��� �л����� ��ȸ�ϱ�");
		map.clear();
		map.put("studno", 1001);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("�й��� 1001���� �л����� �����ϱ�");
		result = session.getMapper(StudentMapper.class).delete("���", 1001);
		System.out.println(result + "�� ����");
		System.out.println("��� �л����� ��ȸ�ϱ�");
		map.clear();
		map.put("studno", 1001);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) {
			System.out.println(s);
		}
	}

}
