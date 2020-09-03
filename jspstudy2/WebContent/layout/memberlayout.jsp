<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/layout/memberlayout.jsp --%>
<c:set var="path" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html lang="en">
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
</style>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<decorator:head/> 
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
    <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button w3-theme-l1">������ �÷��� ������ �缺���� 2ȸ�� ��2 ���α׷� ����</a>
<!--    <a href="#" class="w3-bar-item w3-button w3-theme-l1">Logo</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">About</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Values</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">News</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Contact</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Clients</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Partners</a>   -->
    
    <span style="float: right; font-size:13px;">
	<c:if test="${empty sessionScope.login}">
		<a href="${path}/model2/member/loginForm.me" class="w3-bar-item w3-button w3-hide-small w3-hover-white">�α���</a>&nbsp;&nbsp;
		<a href="${path}/model2/member/joinForm.me" class="w3-bar-item w3-button w3-hide-small w3-hover-white">ȸ������</a>&nbsp;&nbsp;
	</c:if>
	<c:if test="${!empty sessionScope.login}">
		<a>${sessionScope.login} ���� �α����ϼ̽��ϴ�.&nbsp;&nbsp;</a>
		<a href="${path}/model2/member/logout.me">�α׾ƿ�</a>
	</c:if></span>
  </div>
</div>

<!-- Sidebar -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4 class="w3-bar-item"><b>Menu</b></h4>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/member/main.me">ȸ������</a>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/board/list.do">�Խ���</a>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/chat/chatform.do">ä��</a>
  
  <div class="w3-container">
  	<%-- ajax �� ���� ���� ȯ�� ���� ���� ��� --%>
  	<div id="exchange"></div>
  </div>
  <div class="w3-container">
  	<%-- keb �ϳ����� ���� ����ϱ� : USD, JPY, EUR, CNY : �Ÿű�����, ���� ��Ƕ�, ���� �ĽǶ� ��� --%>
  	<div id="exchange2"></div>
  </div>
  
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px">
  <div class="w3-row w3-padding-64">
  
    <div class="w3-row-padding w3-margin-bottom">
      <div class="w3-half">
  	  <div class="w3-container w3-padding-16">
  	    <div id="piecontainer" style="width: 80%; border:1px solid black">
  	    <canvas id="canvas1" style="width: 100%;"></canvas>
  	    </div>
  	  </div>
    </div>
      <div class="w3-half">
  	  <div class="w3-container w3-padding-16">
  	    <div id="piecontainer" style="width: 80%; border:1px solid black">
  	    <canvas id="canvas2" style="width: 100%;"></canvas>
  	    </div>
  	  </div>
     </div>
    </div>  
    
    <div class="w3-twothird w3-container">
    <decorator:body />
    </div>
  </div>
  
  <!-- Pagination
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a class="w3-button w3-black" href="#">1</a>
      <a class="w3-button w3-hover-black" href="#">2</a>
      <a class="w3-button w3-hover-black" href="#">3</a>
      <a class="w3-button w3-hover-black" href="#">4</a>
      <a class="w3-button w3-hover-black" href="#">5</a>
      <a class="w3-button w3-hover-black" href="#">��</a>
    </div>
  </div>
   -->

  <footer id="myFooter" style="text-align:center;">
    <div class="w3-container w3-theme-l2 w3-padding-32">
      <h4 style="font-size: 15px;">�����ī���� Since 2016</h4>
    </div>

    <div class="w3-container w3-theme-l1">
      <p style="font-size: 10px;">Powered by <a href="https://www.goodee.co.kr" target="_blank">�����ī����</a></p>
    </div>
  </footer>

<!-- END MAIN -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

<script>
	var randomColorFactor = function(){
		return Math.round(Math.random() * 255);
	}
	var randomColor = function(opa){
		return "rgba(" + randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ (opa || '.3') + ")";
	}
	$(function(){
		graphs();
		graphs2();
		exchangeRate();  // ȯ�� ������ ajax�� ���� ũ�Ѹ��ϱ�
		exchangeRate2();
	})
	
	function exchangeRate(){
		$.ajax("${path}/model2/ajax/exchange.do",{
			success : function(data){
				$("#exchange").html(data);
			},
			error : function(e){
				alert("ȯ�� ��ȸ�� ���� ����:" + e.status);
			}
		})
	}
	
	function exchangeRate2(){
		$.ajax("${path}/model2/ajax/exchange2.do",{
			success : function(data){
				$("#exchange2").html(data);
			},
			error : function(e){
				alert("ȯ�� ��ȸ�� ���� ����:" + e.status);
			}
		})
	}
	
	function graphs() {
			// ${path} : ���� c:set ���� �̸� ���� �� ���
			// graph.do -> �����͸� Json ���·� ����
			$.ajax("${path}/model2/ajax/graph.do",{  
				success : function(data){
					pieGraphPrint(data);
				},
				error : function(e){
					alert("��������:" + e.status);
				}
			})
			
		}
	function graphs2(){
		$.ajax("${path}/model2/ajax/graph2.do",{
			success : function(data){
				barGraphPrint(data);
			},
			error : function(e){
				alert("��������:" + e.status);
			}
		})
	}
	function pieGraphPrint(data){
		console.log(data)
		var rows = JSON.parse(data);
		var names = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item){
			names[index] = item.name;
			console.log("=="+names+"==")
			datas[index] = item.cnt;
			console.log("=="+datas+"==")
			colors[index] = randomColor(1);
			console.log("=="+colors+"==")
		})
		var config = {
			type : 'pie',
			data : {
				datasets : [{
					data : datas,
					backgroundColor : colors
				}],
				labels : names
			},
			options :{
				responsive : true,
				legend : {position : 'top'},
				title :{
					display : true,
					text : '�۾��� �� �Խ��� ��� �Ǽ�',
					position : 'bottom'
				}
			}
		}
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx, config);
	}
	function barGraphPrint(data){
		console.log(data)
		var rows = JSON.parse(data);
		var regdates = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item){
			regdates[index] = item.regdate;
			console.log("=="+regdates+"==")
			datas[index] = item.cnt;
			console.log("=="+datas+"==")
			colors[index] = randomColor(1);
			console.log("=="+colors+"==")
		})
		var chartData = {
			labels : regdates,
			datasets : [
			{
				type : 'line',
				borderColor : colors,
				borderWidth : 2,
				label : "�Խù� �Ǽ�",
				fill: false,
				data : datas
			},{
				type : 'bar',
				backgroundColor : colors,
				label : "�Խù� �Ǽ�",
				data : datas
			}]
		};
			var ctx = document.getElementById('canvas2').getContext('2d');
			new Chart(ctx, {
				type : 'bar',
				data : chartData,
				options : {
					responsive : true,
					title : {
						display : true,
						text : '�ֱ� 7�� �Խñ� ��� �Ǽ�',
						position : 'bottom'
					},
					legend : {display : false},
					scales : {
						xAxes :[{
							display : true,
							stacked : true
						}],
						yAxes : [{
							display : true,
							stacked : true
						}]
					} 
				}
			});
		}
	
</script>
</body>
</html>