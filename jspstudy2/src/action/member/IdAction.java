package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

/*
  	1. �Ķ���Ͱ� ����
	2. �Ķ���� �� �ϳ� ���� ��� �޼��� ���
	3. �Ķ���Ͱ��� db �����Ϳ� ��
	4. �Ķ���Ͱ��� ��ġ�ϴ� db �������� id ��
 */
public class IdAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = new MemberDao().findid(email,tel);
		if(id == null){
			String msg = "��ġ�ϴ� ȸ�������� �����ϴ�. ȸ�������� �õ��Ͻʽÿ�.";
			String url = "joinForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			request.setAttribute("id", id);
			return new ActionForward();
		}
	}
	
}
