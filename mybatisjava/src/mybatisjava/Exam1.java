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
 * 1. 학생 테이블의 등록된 레코드의 건수를 출력하기
 * 2. 학생 테이블에 등록된 레코드 정보를 출력하기
 * 3. 학생테이블에 등록된 레코드 학년별 정보를 출력하기
 * 4. 학생테이블에 등록된 레코드 이름이 두자인 정보를 출력하기
 */
public class Exam1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;   //문자형 입력스트림. 
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");   // "mapper/mybatis-config.xml" 해당 파일을 reader 를 통해 읽어올 것
			sqlMap = new SqlSessionFactoryBuilder().build(reader); 		           // -> 커넥션 객체와 정보를 가져옴
		}catch(IOException e) {
			e.printStackTrace();
		}
		int x=0;
		SqlSession session = sqlMap.openSession();       //db 접속 session 얻기 - connection
		//selectOne : 조회되는 레코드가 한개인 경우 
		//1. 학생 테이블의 등록된 레코드의 건수를 출력하기
		x = (Integer)session.selectOne("student.count");
		System.out.println("student 테이블의 레코드 갯수:" + x);
		
		//2. 학생 테이블에 등록된 레코드 정보를 출력하기
		System.out.println("Student 테이블 정보 =================");
		List<Student> list = session.selectList("student.list");
		for(Student s : list) {
			System.out.println(s);
		}
		
		//3. 학생테이블에 등록된 레코드 학년별 정보를 출력하기
		System.out.println("Student 테이블 학년별 정보(1학년) =================");
		list = session.selectList("student.selectgrade", 1);
		for(Student s : list) {
			System.out.println(s);
		}
		
		//4. 학생테이블에 등록된 레코드 이름이 두자인 정보를 출력하기
		System.out.println("Student 테이블 이름정보로 조회하기 =================");
		list = session.selectList("student.selectname", "__");
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
