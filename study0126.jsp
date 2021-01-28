<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<body>
<%--
[jsp]
[하] 1. request, response 참조변수의 원래 객체의 명은 무엇인가?(servlet클래스 참조)
	HttpServletRequest, HttpServletResponse
	
[하] 2. jsp에서 객체선언없이 사용하는 내장된 참조객체를 기술하세요.
		- request : 요청 정보를 구할 때 사용
		- response : 응답과 관련된 설정시 사용
		- out : 직접 응답을 제출할 때 사용
		- session : 세션 관리에 사용
		
[하] 3. request객체의 메서드의 각자 특징과 내용을 기술하세요.
	1) request.getParameter("key")
		- client가 주소창이나 form 객체를 통해 전송하는 매개값을 처리하는 객체
		페이지명?key=value&key=value (GET)
		form method="post"
			name="key" value="value" (POST)	
	2) request.getRemoteAddr()
		웹 서버에 연결된 클라이언트의 ip주소를 구한다.
		ex) 웹서버에 접속된 여러 클라이언트 정보를 저장할 때 사용된다.
	3) request.getMethod()
		요청값을 전달할 때 전송하는 방식을 가져온다. (get/post)
	4) request.getContextPath(): (*)
		위 주소에 해당하는 context명을 말한다.
		웹 서버에 등록하여 할당하는 프로젝트명이기도 한다.
	5) request.getRequestURL():	
		웹 브라우저가 요청한 url 경로 : 위 주소에서 context명/폴드/파일.jsp에 해당한다.
	6) request.getServerPort()
		위 주소 기준이면 6080에 해당한다.
	7) request.getServerName() 연결할 때 사용한 서버 이름		
	
[하] 4. request객체의 메서드 가운데 요청값을 처리하는 메서드의 특징을 기술하세요.
	1) request.getParameter("key1")
	받는 값 String data = request.getParameter("key1");
		data에는 value1이 할당되어 있음.
	2) request.getParameterValues("key2");
		동일한 이름의 key값으로 여러 value값을 받을 때, 배열로 데이터를 받을 수 있다.
		String[] data = request.getParameter("key2");
		실제 data 안에는 data=["value2","value3","value4"]; 형식으로 문자열 배열이 들어가 있다.	
	3) request.getParameterName();
		요청되는 모든 내용을 key값으로 가져온다.
		Enumeration enum = request.getParameterNames();
	4) request.getParameterMap();
		요청된 모든 내용을 key/value 형식으로 map에 할당하여 가져온다.
		Map mp = request.getParameterMap();		
		
[중] 5. 구매할물건과 갯수를 queryString으로 페이지와 함께 만들고, 해당 페이지에서 
        데이터를 처리하세요 page.jsp?name=사과&cnt=2&price=3000&name=바나나&cnt=5&prcie=4000&pay=신용카드&pay=현금&pay=포인트
        1) get방식으로 바로 출력
        2) form 처리 방식 입력 후, 출력.
            구매물건
            물건명   갯수
            [   ]  [  ]
            [   ]  [  ]
            [   ]  [  ]
            구매방법 []신용카드[]현금[]포인트

 --%>
 
 
<%--5번 --%> 
<%
String name[] = request.getParameterValues("name");
String cnt[] = request.getParameterValues("cnt");
String pay[] = request.getParameterValues("pay");
%> 
   <h3>제목</h3>
   <table>
      <%
      if(name!=null&&cnt!=null){
    	  for(int i=0;i<3;i++){%>
    		  <tr><td><%=name[i] %><td><%=cnt[i] %></td></tr>
    	<%  }
      }%>
      <%
      if(pay!=null){
    	  for(String pa:pay){%>
    		  <tr><td>결제방식</td><td><%=pa %></td></tr>
    	<%  }
      }
      %>
         
   </table>
</body>
</html>