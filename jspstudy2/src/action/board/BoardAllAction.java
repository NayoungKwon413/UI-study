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
	1. �Ķ���� ���� model.Board ��ü ����
		useBean ��� �Ұ� : request ������ �Ķ���Ϳ� ��Ŭ������ ������Ƽ ��
						request ��ü�� ����� �� ����.
	2. �Խù� ��ȣ num ���� ��ϵ� num �� �ִ밪�� ��ȸ -> �ִ밪 +1 : ��ϵ� �Խù��� ��ȣ.
		db���� maxnum�� ���ؼ� +1 ������ num�� �����ϱ�
	3. board ������ db�� ����ϱ�.
		��ϼ���: �޼��� ���. list.do �� �̵�
		��Ͻ���: �޼��� ���. writeForm.do �� �̵�
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response){
		String msg = "�Խñ� ��� ����";
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
			
			int maxnum = dao.maxnum();  //���� �ִ밪
			board.setNum(++maxnum);
			board.setGrp(maxnum);
			if(dao.insert(board)) {
				msg = "�Խñ� ��� ����";
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
		1. ���������� 10���� �Խù��� ����ϱ�.
	   	   pageNum �Ķ���Ͱ��� ���� => ���� ���� 1�� �����ϱ�
		2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
		3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� list ��ü�� ����
		   list ��ü �� �ʿ��� �����͸� request �� ��ü �Ӽ����� ����Ͽ� list.jsp �� ������ �̵�
	 */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {		
		int pageNum = 1;  //��������ȣ �ʱ�ȭ
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {}
		
		// �Խñ� �˻� ���� �߰�
		String column = request.getParameter("column");
		String search = request.getParameter("search");
		if(column == null || column.trim().equals("")) {    // column �� ���� ����
			column = null;
			search = null;
		}
		if(search == null || search.trim().equals("")) {   // search �Է°� ���� ���
			column = null;
			search = null;
		}
		
		int limit = 10;  //�� �������� �ִ� 10�� ���
		// boardcount : ��ϵ� ��ü �Խù��� �Ǽ� �Ǵ� �˻��� �Խù��� �Ǽ�
		int boardcount = dao.boardCount(column, search); 
		// list : ȭ�鿡 ��µ� ������ ����. ��ü �Խù� ���� �Ǵ� �˻��� �ش��ϴ� �Խù��� ����
		List<Board> list = dao.list(pageNum, limit, column, search);
		int maxpage = (int)((double)boardcount/limit+0.95);  //��ü ������ ������
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
	1. num �Ķ���� ����
	2. num ���� �Խù��� db���� ��ȸ�ϱ�
	3. num ���� �Խù��� ��ȸ�� ������Ű��
	4. ��ȸ�� �Խù� ȭ�鿡 ���
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
	1. �Ķ���� ���� Board ��ü�� �����ϱ� => useBean �±� ���
	     �������� : num, grp, grplevel, grpstep
	     ������� : name, pass, subject, content => �������
	2. ���� grp ���� ����ϴ� �Խù����� grpstep ���� 1 �����ϱ�
	   void VoardDao.grpStepAdd(grp, grpstep)
	3. Board ��ü�� db�� insert �ϱ�
	   num : maxnum +1
	   grp : ���۰� ����
	   grplevel : ����+1
	   grpstep : ���� +1
	4. ��� ������ : "�亯��� �Ϸ�"�޼��� �����, list.jsp �� ������ �̵�
	     ��� ���н� : "�亯��Ͻ� �����߻�"�޼��� �����, replyForm.jsp �� ������ �̵�
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
			String msg = "�亯 ��Ͻ� ���� �߻�";
			String url = "replyForm.do?num="+b.getNum();
			b.setNum(++num);
			b.setGrplevel(grplevel+1);
			b.setGrpstep(grpstep+1);
			if(dao.insert(b)) {
				msg = "�亯 ��� �Ϸ�";
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
	1. �Ķ���� �������� Board ��ü ����
	2. ��й�ȣ ����
		��й�ȣ ��ġ�ϴ� ��� ����
			-�Ķ������ �������� �ش� �Խù��� ������ �����ϱ�
			-÷�������� ������ ���� ��� file2 �Ķ���� ������ �ٽ� �����ϱ�
		��й�ȣ�� ����ġ�� ���
			-��й�ȣ ���� �޼����� ����ϰ�, updateForm.jsp �� ������ �̵�
	3. ���� ���� : ���� ���� �޼��� ��� �� info.jsp ������ �̵�
	     ���� ���� : ���� ���� �޼��� ��� �� updateForm.jsp ������ �̵�
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
			if(b.getFile1() == null || b.getFile1().equals("")){  //÷������ ������ ���� �ʾ��� ���
				b.setFile1(multi.getParameter("file2"));
			}
			
			Board db = dao.selectOne(b.getNum());
			
			if(b.getPass().equals(db.getPass())) {
				if(dao.update(b)) {
					msg = "�Խñ� ���� �Ϸ�";
					url = "info.do?num="+b.getNum();
				}else {
					msg = "�Խñ� ���� ����";
					url = "updateForm.do?num="+b.getNum();
				}
			}else {
				msg = "��й�ȣ ����";
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
		String msg = "�Խñ��� ��й�ȣ�� Ʋ���ϴ�.";
		String url = "deleteForm.do?num="+num;
		if(db == null){
			msg = "���� �Խñ��Դϴ�.";
			url = "list.do";
		}else{
			if(pass.equals(db.getPass())){
				if(dao.delete(num)){
					msg = "�Խñ� ���� �Ϸ�";
					url = "list.do";
				}else{
					msg = "�Խñ� ���� ����";
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
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "../member/loginForm.me");
			return false;
		}
		return true;
	}
	
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) {
		// list : [{name:'ȫ�浿', cnt:9}], [{name:'���', cnt:3}] ...
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
	
	public ActionForward graph22(HttpServletRequest request, HttpServletResponse response) {   //���� graph2 �޼���� ���� ���
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
		request.setAttribute("list", list);   // Map���� ����� list�� graph2.jsp �� ���� 
		return new ActionForward();
	}
	
	//jsoup �� �̿��Ͽ� ũ�Ѹ��ϱ�.
	public ActionForward exchange(HttpServletRequest request, HttpServletResponse response) {
		String url ="https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".tc");   // �����ڵ�, ȯ���� �±� ����
			Elements e2 = doc.select(".tl2.bdl");  // ���� �̸�
			for(int i=0; i<e1.size(); i++) {
				if(e1.get(i).html().equals("USD")) {
					list.add(e1.get(i).html());   // USD ���� ����
					for(int j=1; j<=6; j++) {
						list.add(e1.get(i + j).html());
					}
					break;
				}
			}
			for(Element ele : e2) {
				if(ele.html().contains("�̱�")) {
					list2.add(ele.html());
				}
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);    // ��ȭ�ڵ�, ȯ�������� list ��ü�� ����
		request.setAttribute("list2", list2);  // �����̸�
		request.setAttribute("today", new Date());  
		return new ActionForward();
	}
	
	//KEB �ϳ����� ȯ��������ȸ : json ���� ������ ó��
	public ActionForward exchange2(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		Map<String, List<String>> map = new HashMap<>();
		try {
			String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().text();
			String strJson = kebhana.substring(kebhana.indexOf("{"));   //������ �κ��� ������ ����
			JSONParser jsonParser = new JSONParser();   //json ������ 
			JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
			request.setAttribute("date", json.get("��¥").toString());
			JSONArray array = (JSONArray)json.get("����Ʈ");   //����Ʈ �Ʒ����� ��ȭ ��ϵ��� ���Ե� -> ��ȭ ��ϵ��� �迭�� ���·� ���� 
		for(int i=0; i<array.size(); i++){
			JSONObject obj = (JSONObject)array.get(i); 
			if(obj.get("��ȭ��").toString().contains("�̱�") ||
			   obj.get("��ȭ��").toString().contains("�Ϻ�") ||
			   obj.get("��ȭ��").toString().contains("����") ||
			   obj.get("��ȭ��").toString().contains("�߱�")) {
			   String str = obj.get("��ȭ��").toString();
			   String[] sarr = str.split(" "); // �̱� USD : �������� ����
			   String key = sarr[0];  //�̱�
			   String code = sarr[1];
			   List<String> list = new ArrayList<String>();
			   list.add(code);   // USD, JPY, ...
			   list.add(obj.get("�Ÿű�����").toString());
			   list.add(obj.get("�����ĽǶ�").toString());
			   list.add(obj.get("������Ƕ�").toString());
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
