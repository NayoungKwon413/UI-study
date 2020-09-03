package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Student;

/*
 * 1. �л� ���̺��� ��ϵ� ���ڵ��� �Ǽ��� ����ϱ�
 * 2. �л� ���̺� ��ϵ� ���ڵ� ������ ����ϱ�
 * 3. �л����̺� ��ϵ� ���ڵ� �г⺰ ������ ����ϱ�
 * 4. �л����̺� ��ϵ� ���ڵ� �̸��� ������ ������ ����ϱ�
 */
public class Exam1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;   //������ �Է½�Ʈ��. 
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");   // "mapper/mybatis-config.xml" �ش� ������ reader �� ���� �о�� ��
			sqlMap = new SqlSessionFactoryBuilder().build(reader); 		           // -> Ŀ�ؼ� ��ü�� ������ ������
		}catch(IOException e) {
			e.printStackTrace();
		}
		int x=0;
		SqlSession session = sqlMap.openSession();       //db ���� session ��� - connection
		//selectOne : ��ȸ�Ǵ� ���ڵ尡 �Ѱ��� ��� 
		//1. �л� ���̺��� ��ϵ� ���ڵ��� �Ǽ��� ����ϱ�
		x = (Integer)session.selectOne("student.count");
		System.out.println("student ���̺��� ���ڵ� ����:" + x);
		
		//2. �л� ���̺� ��ϵ� ���ڵ� ������ ����ϱ�
		System.out.println("Student ���̺� ���� =================");
		List<Student> list = session.selectList("student.list");
		for(Student s : list) {
			System.out.println(s);
		}
		
		//3. �л����̺� ��ϵ� ���ڵ� �г⺰ ������ ����ϱ�
		System.out.println("Student ���̺� �г⺰ ����(1�г�) =================");
		list = session.selectList("student.selectgrade", 1);
		for(Student s : list) {
			System.out.println(s);
		}
		
		//4. �л����̺� ��ϵ� ���ڵ� �̸��� ������ ������ ����ϱ�
		System.out.println("Student ���̺� �̸������� ��ȸ�ϱ� =================");
		list = session.selectList("student.selectname", "__");
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
