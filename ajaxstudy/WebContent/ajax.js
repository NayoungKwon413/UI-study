// ajaxstudy/WebContent/ajax.js
var ajax = null;   //함수 밖에서 쓴 var : 전역변수
function getAjaxObject() {      // ajax 객체 생성 함수
	if(window.ActiveXObject){   //브라우저의 종류를 의미. 현재 사용하는 브라우저가 익스플로러인 경우
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");         // 최신버전(브라우저 버전에 따라 달라짐)
		}catch(e){
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");  //구버전
			}catch(e2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){   //익스플로러 외의 브라우저인 경우
		return new XMLHttpRequest();   // XMLHttpRequest => Ajax 객체(:비동기적으로 자바스크립트와 XML 을 통해 통신. 서버와 통신 가능 객체)
	}else{
		return null;  // 익스플로러도 아니고 그외의 브라우저도 아닌 경우 -> 사용 불가능
	}
}
/*
 * 파라미터값 : "hello.jsp", "name="+document.f.name.value, helloFromServer, "POST"
 *   url = "hello.jsp"
 *   params = "name=홍길동"
 *   callback = helloFromServer
 *   method = "POST"
 */
function sendRequest(url, params, callback, method){
	ajax = getAjaxObject();  //getAjaxObject() 함수를 호출 -> 그 결과를 ajax 변수에 저장 -> ajax 변수 안에는 ajax 객체를 저장(=XMLHttpRequest 객체)
	// httpMethod: GET or POST
	var httpMethod = method?method:"GET";  // method의 값이 "POST"로 들어왔으므로 -> "POST".
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	var httpParams = (params == null || params == '')?null:params;  // httpParmas : "name=홍길동"
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;  // GET 방식인 경우, url 정보에 파라미터를 전송해야하기 때문
	}
	// true : 비동기 방식 전송 
	ajax.open(httpMethod, httpUrl, true);   // ajax.open : ajax객체를 준비
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  // 헤더정보 준비
	// onreadystatechange : 콜백함수 등록
	ajax.onreadystatechange = callback;  // callback : helloFromServer -> ajax 객체의 상태가 변경될때마다 호출하는 함수
	ajax.send(httpMethod == "POST"?httpParams:null);  //서버로 전송 : POST 방식인 경우, 서버로 전송하면서 파라미터값을 넘김. GET 방식일 경우 이미 url 에 파라미터값 넘어가기 때문에 null
}