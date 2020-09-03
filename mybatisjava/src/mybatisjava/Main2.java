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

public class Main2 {
	private final static String NS = "student.";  // final : ���(������ �� ���� ��) -> namespace ��
	private static SqlSessionFactory sqlMap;      // static : Ŭ���� ����.  
	static {   //static �ʱ�ȭ �� => Ŭ���� ������ �ε�� �� �� �� �� ���� = Ŭ���� ������ �ʱ�ȭ�� �����
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");  //Reader, InputStream �Ѵ� �Է½�Ʈ��. �ܺ��� �ڷḦ �о���ڴٴ� �ǹ�
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("Student ���̺� ���ڵ� �߰��ϱ�");
		Student st = new Student();
		st.setStudno(1001);
		st.setName("ȫ�浿");
		st.setGrade(1);
		st.setId("hongkd2");
		st.setJumin("123456");
		st.setMajor1(101);
		//cnt : ���ڵ� ���� �Ǽ�. ��, �߰��� ���ڵ� ��.
		int cnt = session.insert(NS + "insert", st);    //session �� sqlMap ���� ��
		System.out.println("student ���ڵ� �߰�:"+ cnt);
		Student stu = session.selectOne(NS + "selectno", st.getStudno());
		System.out.println(stu);
		/*
		 * 1000�� �л��� �г��� 2�г�����, ������ 80, Ű�� 175��
		 * ����������ȣ�� 1001�� �����ϱ�
		 */
		System.out.println("1000�� �л� ���� �����ϱ�");
		st.setStudno(1000);
		st.setGrade(2);
		st.setWeight(80);
		st.setHeight(175);
		st.setProfno(1001);
		cnt = session.update(NS+"update", st);
		System.out.println("student ���ڵ� ����:" + cnt);
		stu=session.selectOne(NS + "selectno", st.getStudno());
		System.out.println(stu);
		
		System.out.println("���� �达�� �л� ���� ��ȸ�ϱ�");
		List<Student> list = session.selectList(NS+"selectkim", "��%");
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("�����԰� 75 �̻��� �л� ���� ����ϱ�");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", "weight");
		map.put("val", 75);
		list = session.selectList(NS + "selectwh", map);
		for(Student s : list) {
			System.out.println(s);
		}
		System.out.println("Ű�� 175 �̻��� �л� ���� ����ϱ�");
		map.put("col", "height");
		map.put("val", 175);
		list = session.selectList(NS + "selectwh", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("�ֹι�ȣ�� 970101 ������ �л� ���� ����ϱ�");
		map.put("col", "jumin");
		map.put("val", "970101");
		list = session.selectList(NS + "selectwh", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("�л� �� ������ �л� ���� �����ϱ�");
		map.clear();
		map.put("col", "name");
		map.put("val", "������");
		cnt = session.delete(NS + "delete", map);
		System.out.println("student ���ڵ� �����Ǽ�:"+cnt);
		stu = session.selectOne(NS + "select4", map);
		System.out.println("������ �л� ����:"+stu);
		
//		session.commit();  //���������� ���� �Ϸ�. commit ������ �ڵ� rollback

	}

}
