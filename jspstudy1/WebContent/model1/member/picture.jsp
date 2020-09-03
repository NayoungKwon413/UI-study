<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/picture.jsp 
	1. �̹������� ���ε� (->request ��ü ��� �Ұ�)
	2. �̹��������� 3����1 ũ���� ������ �̹��� ����. -> sm_�����̸� ���� ����
	3. opener ȭ�鿡 ��� ���� => javascript
	4. ����ȭ�� close() => javascript
--%>
<%
	String path = application.getRealPath("")+"model1/member/picture/";
	String fname = null;
	File f = new File(path);
	if(!f.exists()){   //model1/member/picture ������ ������,
		f.mkdirs();    //���� ����
	}
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	//fname : ���ε�� �̹��� ���� �̸�
	fname = multi.getFilesystemName("picture");
	//�Ʒ����� ����� �̹��� ����
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/3;      //����� ũ�⸦ ������ 3���� 1�� ����
	int height = bi.getHeight()/3;
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, width, height, null);
	// f : thumbnail �̹����� ���Ϸ� �����ϱ� ���� ��ü
	f = new File(path + "sm_" + fname);
	ImageIO.write(thumb, "jpg", f);
%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");    <%--id�Ӽ��� "pic"�� �̹��� ����--%>
	img.src = "picture/<%=fname%>";                 <%--opener â�� �̹����� ������--%>
	opener.document.f.picture.value = "<%=fname%>"; <%--hidden �±�. �Ķ���Ͱ� ����--%>
	self.close();
</script>

