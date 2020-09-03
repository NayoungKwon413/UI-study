package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;

import mapper.Member;





public class Main1 {
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
		x = (Integer)session.selectOne("member.count");
		System.out.println("member 테이블의 레코드 갯수:" + x);
		
		//member 테이블의 정보를 읽어서 화면에 출력하기
		System.out.println("member 테이블 정보 =================");
		//selectList : 조회되는 레코드가 여러건인 경우
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		
		//admin 정보만 조회하기
		System.out.println("admin 정보======================");
		Member mem = session.selectOne("member.selectid", "admin");
		System.out.println(mem);
		
		//이름 정보로 조회하기
		System.out.println("이름 정보로 조회하기 =========================");
		list = session.selectList("member.selectname","트");
		for(Member m : list) {
			System.out.println(m);
		}
		
		//이름 정보로 조회하기2
		System.out.println("이름 정보로 조회하기2 =========================");
		list = session.selectList("member.selectname2","%트%");
		for(Member m : list) {
			System.out.println(m);
		}
		
		//두개의 컬럼을 조건으로 사용
		System.out.println("이름정보와 성별로 조회하기========================");
		//이름이 '트'가 있고 여자인 정보를 조회하기
		Map<String, Object> map = new HashMap<>();
		map.put("name","%트%");
		map.put("gender", 2);
		list = session.selectList("member.selectnamegender", map);
		for(Member m : list) {
			System.out.println(m);
		}
	}
}

