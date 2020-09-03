package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello World");
		return new ActionForward();
	}
	/*
	1. 파라미터 값을 model.Board 객체 저장
		useBean 사용 불가 : request 정보의 파라미터와 빈클래스의 프로퍼티 비교
						request 객체를 사용할 수 없음.
	2. 게시물 번호 num 현재 등록된 num 의 최대값을 조회 -> 최대값 +1 : 등록된 게시물의 번호.
		db에서 maxnum을 구해서 +1 값으로 num을 설정하기
	3. board 내용을 db에 등록하기.
		등록성공: 메세지 출력. list.do 로 이동
		등록실패: 메세지 출력. writeForm.do 로 이동
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response){
		String msg = "게시글 등록 실패";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		try {
			File f = new File(path);
			if(!f.exists())  f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
			Board board = new Board();
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			
			int maxnum = dao.maxnum();  //현재 최대값
			board.setNum(++maxnum);
			board.setGrp(maxnum);
			if(dao.insert(board)) {
				msg = "게시글 등록 성공";
				url = "list.do";
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/*
		1. 한페이지당 10건의 게시물을 출력하기.
	   	   pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기
		2. 최근 등록된 게시물이 가장 위에 배치함.
		3. db에서 해당 페이지에 출력될 내용을 조회하여 list 객체로 저장
		   list 객체 및 필요한 데이터를 request 의 객체 속성으로 등록하여 list.jsp 로 페이지 이동
	 */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {		
		int pageNum = 1;  //페이지번호 초기화
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {}
		
		// 게시글 검색 관련 추가
		String column = request.getParameter("column");
		String search = request.getParameter("search");
		if(column == null || column.trim().equals("")) {    // column 값 선택 안함
			column = null;
			search = null;
		}
		if(search == null || search.trim().equals("")) {   // search 입력값 없는 경우
			column = null;
			search = null;
		}
		
		int limit = 10;  //한 페이지당 최대 10건 출력
		// boardcount : 등록된 전체 게시물의 건수 또는 검색된 게시물의 건수
		int boardcount = dao.boardCount(column, search); 
		// list : 화면에 출력될 내용을 저장. 전체 게시물 저장 또는 검색시 해당하는 게시물만 저장
		List<Board> list = dao.list(pageNum, limit, column, search);
		int maxpage = (int)((double)boardcount/limit+0.95);  //전체 마지막 페이지
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage = startpage + 9;
		int boardnum = boardcount - (pageNum-1) * limit;
	 	if(endpage > maxpage) endpage = maxpage;
	 	
	 	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	 	String today = sf.format(new Date());
	 	
	 	request.setAttribute("boardcount", boardcount);
	 	request.setAttribute("pageNum", pageNum);
	 	request.setAttribute("limit", limit);
	 	request.setAttribute("list", list);
	 	request.setAttribute("maxpage", maxpage);
	 	request.setAttribute("startpage", startpage);
	 	request.setAttribute("endpage", endpage);
	 	request.setAttribute("boardnum", boardnum);
	 	request.setAttribute("today", today);
	 	
		return new ActionForward();
	}
	/*
	1. num 파라미터 저장
	2. num 값의 게시물을 db에서 조회하기
	3. num 값의 게시물의 조회수 증가시키기
	4. 조회된 게시물 화면에 출력
	 */
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		if(request.getRequestURI().contains("board/info.do")) {
			dao.readcntAdd(num);
		}
		request.setAttribute("b", b);
		return new ActionForward();
	}
	/*
	1. 파라미터 값을 Board 객체에 저장하기 => useBean 태그 사용
	     원글정보 : num, grp, grplevel, grpstep
	     답글정보 : name, pass, subject, content => 등록정보
	2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기
	   void VoardDao.grpStepAdd(grp, grpstep)
	3. Board 객체를 db에 insert 하기
	   num : maxnum +1
	   grp : 원글과 동일
	   grplevel : 원글+1
	   grpstep : 원글 +1
	4. 등록 성공시 : "답변등록 완료"메세지 출력후, list.jsp 로 페이지 이동
	     등록 실패시 : "답변등록시 오류발생"메세지 출력후, replyForm.jsp 로 페이지 이동
	 */
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {
//		String msg = null, url = null;
//		try {
//			request.setCharacterEncoding("euc-kr");
			Board b = new Board();
			b.setName(request.getParameter("name"));
			b.setPass(request.getParameter("pass"));
			b.setSubject(request.getParameter("subject"));
			b.setContent(request.getParameter("content"));
			b.setNum(Integer.parseInt(request.getParameter("num")));
			b.setGrp(Integer.parseInt(request.getParameter("grp")));
			b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
			b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
			
			dao.grpStepAdd(b.getGrp(), b.getGrpstep());
			int grplevel = b.getGrplevel();
			int grpstep = b.getGrpstep();
			int num = dao.maxnum();
			String msg = "답변 등록시 오류 발생";
			String url = "replyForm.do?num="+b.getNum();
			b.setNum(++num);
			b.setGrplevel(grplevel+1);
			b.setGrpstep(grpstep+1);
			if(dao.insert(b)) {
				msg = "답변 등록 완료";
				url = "list.do";
			}
			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/*
	1. 파라미터 정보들을 Board 객체 저장
	2. 비밀번호 검증
		비밀번호 일치하는 경우 수정
			-파라미터의 내용으로 해당 게시물의 내용을 수정하기
			-첨부파일의 변경이 없는 경우 file2 파라미터 내용을 다시 저장하기
		비밀번호가 불일치할 경우
			-비밀번호 오류 메세지를 출력하고, updateForm.jsp 로 페이지 이동
	3. 수정 성공 : 수정 성공 메세지 출력 후 info.jsp 페이지 이동
	     수정 실패 : 수정 실패 메세지 출력 후 updateForm.jsp 페이지 이동
	 */
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		String msg = null, url = null;
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
			Board b = new Board();
			b.setNum(Integer.parseInt(multi.getParameter("num")));
			b.setName(multi.getParameter("name"));
			b.setPass(multi.getParameter("pass"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile1(multi.getFilesystemName("file1"));
			if(b.getFile1() == null || b.getFile1().equals("")){  //첨부파일 수정을 하지 않았을 경우
				b.setFile1(multi.getParameter("file2"));
			}
			
			Board db = dao.selectOne(b.getNum());
			
			if(b.getPass().equals(db.getPass())) {
				if(dao.update(b)) {
					msg = "게시글 수정 완료";
					url = "info.do?num="+b.getNum();
				}else {
					msg = "게시글 수정 실패";
					url = "updateForm.do?num="+b.getNum();
				}
			}else {
				msg = "비밀번호 오류";
				url = "updateForm.do?num="+b.getNum();
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		Board db = dao.selectOne(num);
		String msg = "게시글의 비밀번호가 틀립니다.";
		String url = "deleteForm.do?num="+num;
		if(db == null){
			msg = "없는 게시글입니다.";
			url = "list.do";
		}else{
			if(pass.equals(db.getPass())){
				if(dao.delete(num)){
					msg = "게시글 삭제 완료";
					url = "list.do";
				}else{
					msg = "게시글 삭제 실패";
					url = "info.do?num="+num;
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists())  f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
	
	public ActionForward chatform(HttpServletRequest request, HttpServletResponse response) {
		if(logincheck(request)) {
			return new ActionForward();
		}else {
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	private boolean logincheck(HttpServletRequest request) {
		String login = (String)request.getSession().getAttribute("login");
		if(login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요");
			request.setAttribute("url", "../member/loginForm.me");
			return false;
		}
		return true;
	}
	
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) {
		// list : [{name:'홍길동', cnt:9}], [{name:'김삿갓', cnt:3}] ...
		List<Map<String, Integer>> list = dao.boardgraph();
		StringBuilder json = new StringBuilder("[");
		int i=0;
		for(Map<String, Integer> m : list) {
			for(Map.Entry<String, Integer> me : m.entrySet()) {
				if(me.getKey().equals("name"))
					json.append("{\"name\":\"" + me.getValue() + "\",");
				if(me.getKey().equals("cnt"))
					json.append("\"cnt\":" + me.getValue() + "}");
			}
			i++;
			if(i<list.size()) json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}
	
	public ActionForward graph22(HttpServletRequest request, HttpServletResponse response) {   //기존 graph2 메서드와 같은 기능
		// list : [{date:2020-05-01, cnt:9}], [{date:2020-05-02, cnt:3}] ...
		List<Map<String, Integer>> list = dao.boardgraph2();
		StringBuilder json = new StringBuilder("[");
		int i=0;
		for(Map<String, Integer> m : list) {
			for(Map.Entry<String, Integer> me : m.entrySet()) {
				if(me.getKey().equals("regdate"))
					json.append("{\"regdate\":\"" + me.getValue() + "\",");
				if(me.getKey().equals("cnt"))
					json.append("\"cnt\":" + me.getValue() + "}");
			}
			i++;
			if(i<list.size()) json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward(false, "graph.jsp");
	}
	
	public ActionForward graph2(HttpServletRequest request, HttpServletResponse response) {
		// list : [{date:2020-05-01, cnt:9}], [{date:2020-05-02, cnt:3}] ...
		List<Map<String, Integer>> list = dao.boardgraph2();
		request.setAttribute("list", list);   // Map으로 연결된 list를 graph2.jsp 로 보냄 
		return new ActionForward();
	}
	
	//jsoup 을 이용하여 크롤링하기.
	public ActionForward exchange(HttpServletRequest request, HttpServletResponse response) {
		String url ="https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".tc");   // 국가코드, 환율값 태그 선택
			Elements e2 = doc.select(".tl2.bdl");  // 국가 이름
			for(int i=0; i<e1.size(); i++) {
				if(e1.get(i).html().equals("USD")) {
					list.add(e1.get(i).html());   // USD 정보 저장
					for(int j=1; j<=6; j++) {
						list.add(e1.get(i + j).html());
					}
					break;
				}
			}
			for(Element ele : e2) {
				if(ele.html().contains("미국")) {
					list2.add(ele.html());
				}
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);    // 통화코드, 환율정보를 list 객체로 저장
		request.setAttribute("list2", list2);  // 국가이름
		request.setAttribute("today", new Date());  
		return new ActionForward();
	}
	
	//KEB 하나은행 환율정보조회 : json 형태 데이터 처리
	public ActionForward exchange2(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		Map<String, List<String>> map = new HashMap<>();
		try {
			String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().text();
			String strJson = kebhana.substring(kebhana.indexOf("{"));   //가져올 부분의 시작점 설정
			JSONParser jsonParser = new JSONParser();   //json 번역기 
			JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
			request.setAttribute("date", json.get("날짜").toString());
			JSONArray array = (JSONArray)json.get("리스트");   //리스트 아래에는 통화 목록들이 포함됨 -> 통화 목록들이 배열의 형태로 저장 
		for(int i=0; i<array.size(); i++){
			JSONObject obj = (JSONObject)array.get(i); 
			if(obj.get("통화명").toString().contains("미국") ||
			   obj.get("통화명").toString().contains("일본") ||
			   obj.get("통화명").toString().contains("유로") ||
			   obj.get("통화명").toString().contains("중국")) {
			   String str = obj.get("통화명").toString();
			   String[] sarr = str.split(" "); // 미국 USD : 공백으로 구분
			   String key = sarr[0];  //미국
			   String code = sarr[1];
			   List<String> list = new ArrayList<String>();
			   list.add(code);   // USD, JPY, ...
			   list.add(obj.get("매매기준율").toString());
			   list.add(obj.get("현찰파실때").toString());
			   list.add(obj.get("현찰사실때").toString());
			   map.put(key, list);
			}
		}
			request.setAttribute("map", map);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return new ActionForward();
	}
}
