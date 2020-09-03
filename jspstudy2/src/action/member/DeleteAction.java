package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1~2�� -> UserLoginAction ����� ���� ó��
  	1. �α׾ƿ� ���� : '�α����ϼ���' ��� �� loginForm.jsp ������ �̵�
	2. �Ϲݻ������ ���
		- id �Ķ���������� login ������ �ٸ� ��� 
			'���θ� Ż�� �����մϴ�' �޼��� ��� �� main.jsp ������ �̵�
 * DeleteAction ���� ó��	
	3. �Ϲݻ������ ���
		- id, pass ������ �̿��Ͽ� ��й�ȣ ����
		��й�ȣ ����ġ : '��й�ȣ�� Ʋ���ϴ�' �޼��� ��� �� deleteForm.jsp �������� �̵�
	     �������� ���
	     - id�� �������� ��� Ż�� �Ұ� �޼��� ����� list.jsp �������� �̵�
	4. Ż�� ���� : member db���� delete ó�� �Ϸ�
		�Ϲݻ���� : �α׾ƿ� ���� => Ż��Ϸ� �޼��� ��� => loginForm.jsp �������� �̵�
		������      : Ż��Ϸ� �޼��� ��� => list.jsp �� ������ �̵�
	5. Ż�� ���� : member db���� delete ó�� �� ���� �߻�
		�Ϲݻ���� : Ż����� �޼��� ��� => info.jsp �� ������ �̵�
		������      : Ż����� �޼��� ��� => list.jsp �� ������ �̵�
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String pass = request.getParameter("pass");
		String msg = null;
		String url = null;				
			if(!login.equals("admin")){ //�Ϲݻ�����̸鼭
				if(!login.equals(id)){  //�α��� ������ id �Ķ���Ͱ��� �ٸ� ���
					msg = "���θ� Ż�� �����մϴ�";
					url = "main.me";
				}else{                  //�α��� ������ id �Ķ���Ͱ��� ���� ���
					MemberDao dao = new MemberDao();
					Member mem = dao.selectOne(login);            //�Ϲݻ������ ��� Ż��� �α��� ����ڸ� ����
					if(!pass.equals(mem.getPass())){              //pass �Ķ���Ͱ��� db �н����� ������ �ٸ� ���
						msg = "��й�ȣ�� Ʋ���ϴ�";
						url = "deleteForm.me?id="+id;
					}else{                                        //pass �Ķ���Ͱ��� db �н� ������ ���� ��� => Ż�����
						if(dao.deletePass(login) > 0) {           // (�Ϲ�)Ż�� ����
							msg = "Ż�� �Ϸ�Ǿ����ϴ�";
							url = "loginForm.me";
							request.getSession().invalidate();    // �α׾ƿ�
						}else{                                    // (�Ϲ�)Ż�� ����
							msg = "Ż�� �� ������ �߻��߽��ϴ�";
							url = "info.me?id="+id;
						}
					}
				}
			}else{                                                //�������� ���
				if(id.equals("admin")){                           //id �Ķ���� ���� admin �� ��� 
					msg = "�����ڴ� Ż���� �� �����ϴ�";
					url = "list.me";
				}else{                                            //id �Ķ���� ���� admin �� �ƴ� ���
					MemberDao dao = new MemberDao();
					if(dao.deletePass(id) > 0) {                  // (������)Ż�� ����
						msg = "Ż�� �Ϸ�Ǿ����ϴ�";
						url = "list.me";
					}else{                                        // (������)Ż�� ����
						msg = "Ż�� �� ������ �߻��߽��ϴ�";
						url = "list.me";
					}
				}
			}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
