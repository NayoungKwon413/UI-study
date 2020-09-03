package chap1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/jspchap1/CurrentTimeServlet
@WebServlet("/CurrentTimeServlet")   //��û url ����
public class CurrentTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CurrentTimeServlet() {
        super();
    }

	//��û ���(method) �� get ����� ��� ȣ��Ǵ� �޼���
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");    // ������ ������ response ��ü�� �Ǿ� ����.
		Calendar c = Calendar.getInstance();
		int h= c.get(Calendar.HOUR_OF_DAY);
		int m = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
		//PrintWriter : ������ ��½�Ʈ��. 
		//out : �������� ������ ����ϴ� ��� ��Ʈ��. ���� �������� client(������)
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>����ð�</title></head>");
		out.println("<body>");
		out.println("<h1>����ð���" + h + "��" + m + "��" + s + "�� �Դϴ�.</h1>");
		out.println("</body></html>");
		// ���� ������ ��� out �̶�� ��� ���ۿ� ����Ǿ� �������� ���޵�
	}

	//��û ���(method) �� post ����� ��� ȣ��Ǵ� �޼���
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
