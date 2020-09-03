<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp 
	1. �α׾ƿ� ���� : '�α����ϼ���' ��� �� loginForm.jsp ������ �̵�
	2. �Ϲݻ������ ���
		- id �Ķ���������� login ������ �ٸ� ��� 
			'���θ� Ż�� �����մϴ�' �޼��� ��� �� main.jsp ������ �̵�
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
--%>
<%
	String msg = null;
	String url = null;
	String login = (String)session.getAttribute("login");   //�α��� ����
	String id = request.getParameter("id");                 //�Ķ���� ����
	if(login == null) {
		msg = "�α����ϼ���";
		url = "loginForm.jsp";
	}else{
		if(!login.equals("admin")){ //�Ϲݻ�����̸鼭
			if(!login.equals(id)){  //�α��� ������ id �Ķ���Ͱ��� �ٸ� ���
				msg = "���θ� Ż�� �����մϴ�";
				url = "main.jsp";
			}else{                  //�α��� ������ id �Ķ���Ͱ��� ���� ���
				String pass = request.getParameter("pass");   //Ż�� ���������� �Է¹��� �н�����
				MemberDao dao = new MemberDao();
				Member mem = dao.selectOne(login);            //�Ϲݻ������ ��� Ż��� �α��� ����ڸ� ����
				if(!pass.equals(mem.getPass())){              //pass �Ķ���Ͱ��� db �н����� ������ �ٸ� ���
					msg = "��й�ȣ�� Ʋ���ϴ�";
					url = "deleteForm.jsp?id="+id;
				}else{                                        //pass �Ķ���Ͱ��� db �н� ������ ���� ��� => Ż�����
					if(dao.deletePass(login) > 0) {           // (�Ϲ�)Ż�� ����
						msg = "Ż�� �Ϸ�Ǿ����ϴ�";
						url = "loginForm.jsp";
						session.invalidate();                 // �α׾ƿ�
					}else{                                    // (�Ϲ�)Ż�� ����
						msg = "Ż�� �� ������ �߻��߽��ϴ�";
						url = "info.jsp?id="+id;
					}
				}
			}
		}else{                                                //�������� ���
			if(id.equals("admin")){                           //id �Ķ���� ���� admin �� ��� 
				msg = "�����ڴ� Ż���� �� �����ϴ�";
				url = "list.jsp";
			}else{                                            //id �Ķ���� ���� admin �� �ƴ� ���
				MemberDao dao = new MemberDao();
				if(dao.deletePass(id) > 0) {                  // (������)Ż�� ����
					msg = "Ż�� �Ϸ�Ǿ����ϴ�";
					url = "list.jsp";
				}else{                                        // (������)Ż�� ����
					msg = "Ż�� �� ������ �߻��߽��ϴ�";
					url = "list.jsp";
				}
			}
		}
	}
	
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>	