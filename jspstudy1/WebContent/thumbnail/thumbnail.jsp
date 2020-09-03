<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/thumbnail/thumbnail.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>원본이미지와 썸네일 이미지 보기</title>
</head>
<body>
<%
	//이미지 파일 업로드 위치 지정
	String path = application.getRealPath("/") + "thumbnail/";
	int size = 10*1024*1024;   //최대 업로드 파일 크기 지정
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");  //파일 업로드 완료
	// fname : 업로드된 파일 이름
	String fname = multi.getFilesystemName("picture");
	// path + fname : 업로드 된 파일의 절대 경로
	// BufferedImage bi : 업로드된 이미지 파일을 메모리로 저장
	// bi : 원본이미지 의 내용
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/5;      // 원본이미지의 가로길이/5 => 썸네일 크기를 원본의 5분의 1로 지정
	int height = bi.getHeight()/5;    // 원본이미지의 세로길이/5 => 썸네일 크기를 원본의 5분의 1로 지정
	// thumb : 원본의 5분의 1크기에 해당하는 빈 이미지 정보 -> 빈 도화지
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	// g : 빈 도화지 상태인 thumb 이미지에 그리기 도구 
	Graphics2D g = thumb.createGraphics();
	// 0부터 지정 가로 길이와 세로 길이까지 원본이미지를 그림 -> thumb 이미지에 bi 이미지가 축소되어 저장
	g.drawImage(bi, 0, 0, width, height, null);
	// f : thumbnail 이미지를 파일로 생성하기 위한 객체
	File f = new File(path + "sm_" + fname);
	ImageIO.write(thumb, "jpg", f);    // 메모리에 로드된 이미지를 파일에 저장
%>
<h3>원본이미지</h3><img src="<%=fname %>"><p>
<h3>썸네일이미지</h3><img src="sm_<%=fname %>"><p>
</body>
</html>