<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/picture.jsp 
	1. �̹������� ���ε� (->request ��ü ��� �Ұ�)
	2. �̹��������� 3����1 ũ���� ������ �̹��� ����. -> sm_�����̸� ���� ����
	3. opener ȭ�鿡 ��� ���� => javascript
	4. ����ȭ�� close() => javascript
--%>

<script type="text/javascript">
	img = opener.document.getElementById("pic");    <%--id�Ӽ��� "pic"�� �̹��� ����--%>
	img.src = "picture/${fname}";                 <%--opener â�� �̹����� ������--%>
	opener.document.f.picture.value = "${fname}"; <%--hidden �±�. �Ķ���Ͱ� ����--%>
	self.close();
</script>

