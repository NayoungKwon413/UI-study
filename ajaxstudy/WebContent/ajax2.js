// WebContent/ajax2.js
var ajax = {}   // ajax 객체 생성
ajax.xhr = {}   // ajax.xhr 객체 생성
/*
 * ajax.xhr.Request 객체의 생성자
 *   멤버변수    : url, params, callback, method, req
 *   멤버메서드 : getXmlHttpRequest, send, onStateChange
 */
ajax.xhr.Request = function(url, params, callback, method){   // ajax.xhr.Request 객체의 생성자
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
// prototype : 멤버 메서드를 구현
ajax.xhr.Request.prototype = {
		// getXmlHttpRequest 메서드 : XMLHttpRequest 객체를 생성하는 기능
		getXmlHttpRequest : function() {   // Json 형식 -> getXmlHttpRequest(메서드명) : function() {기능}
			if(window.ActiveXObject){
				try{
					return new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					try{
						return new ActiveXObject("Microsoft.XMLHTTP");
					}catch(e2){return null;}
				}
			}else if(window.XMLHttpRequest){
				return new XMLHttpRequest();
			}else {
				return null;
			}
		},
		// send 메서드 : 
		send : function() {
			// this.req : ajax 객체 저장. XMLHttpRequest 객체 저장
			this.req = this.getXmlHttpRequest();
			var httpMethod = this.method?this.method:"GET";
			if(httpMethod != "GET" && httpMethod != "POST"){
				httpMethod = "GET";
			}
			var httpParams = (this.params == null || this.params == '')?null:this.params;
			var httpUrl = this.url;
			if(httpMethod == 'GET' && httpParams != null){
				httpUrl = httpUrl + "?" + httpParams;
			}
			this.req.open(httpMethod, httpUrl, true);   //ajax 을 보내기 위한 준비
			this.req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			// this : ajax.xhr.Request 객체
			var request = this;
			// onreadystatechange : 콜백함수를 등록
			this.req.onreadystatechange = function() {
				// 콜백함수를 등록하기 위해서 onStateChange 함수를 call
				request.onStateChange.call(request);    // request : ajax.xhr.Request 객체
			}
			this.req.send(httpMethod == "POST"?httpParams:null);
		},
		onStateChange : function() {
			this.callback(this.req);  // 멤버인 callback 함수를 호출 -> this.req 라는 ajax 객체를 전달. 즉, callback 함수의 매개변수는 ajax 객체
			// callback 함수 = resultView
		}
}