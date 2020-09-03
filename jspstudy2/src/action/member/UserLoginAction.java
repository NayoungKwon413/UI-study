package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
//�α��� ���°� �ʼ��� ��� -> ������ UserLoginAction Ŭ������ ��ӹ޾� ����ϸ� ��.
public abstract class UserLoginAction implements Action {
	// protected : �ٸ� ��Ű���� �ִ��� ��Ӱ����� ����� �� ����
	protected String login;
	protected String id;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if(login == null) {  //�α����� ���� �ƴ� ���
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {  //�α��� ������ �Է� id�� ���� �ʰ�, �α����� id�� "admin"�� �ƴ� ���
			request.setAttribute("msg", "���� �ŷ��� �����մϴ�");
			request.setAttribute("url", "main.me");
			return new ActionForward(false, "../alert.jsp");
		}
		if(id == null || id.trim().equals("")) id = login;
		
		return doExecute(request, response);
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
}
