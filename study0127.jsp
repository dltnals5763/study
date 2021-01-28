<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
   function valid(){
	   innumObj = document.querySelector("input[name=innum]");
	   if(innumObj.value==""){
		   alert('데이터를 입력하세요.');
	   }else{
		   if(isNaN(innumObj.value)){
			   alert('숫자형 데이터를 입력하세요.');
		   }else{
			   document.querySelector("#form4").submit();
		   }
	   }
   }
</script>
</head>
<body>
<%--[하] 1. 요청의 header에 들어가는 key와 value를 나열해보세요.--%>
<h3>요청의 header에 들어가는 key와 value</h3>
<table>
<%
Enumeration headerEnum = request.getHeaderNames();
while(headerEnum.hasMoreElements()){
	String headerName = (String)headerEnum.nextElement();
	String headerValue = request.getHeader(headerName);
	%>
	<tr><th><%=headerName %></th><td><%=headerValue %></td></tr>	
<%} %>
</table>

<%--[하] 2. jsp에서 result.jsp로 요청값 name=himan을 전송하는 경우와 
	js에서 동일한 내용을 처리하는 코드를 기술하세요. --%>
<h3>name=himan 처리하기</h3>	
<table>
	<tr><th>이름</th><td><%=request.getParameter("name") %></td></tr>
</table>

<%--[하] 3. jsp에서 요청값 한개 부터 시작해서, 숫자형 데이터 처리, 다중의 데이터 처리까지 
	form페이지와 함께 처리한 코드를 기술하세요.  --%>
	<h3>요청값 한개</h3>
	<table>
		<tr><th>학번</th><td><%=request.getParameter("stuNum") %></td></tr>
	</table>
	<h3>숫자형 데이터 처리</h3>
	<%
	String gradeS = request.getParameter("grade");
	int grade = 0;
	if(gradeS!=null) grade = Integer.parseInt(gradeS);
	String classS = request.getParameter("classs");
	int classs = 0;
	if(classS!=null) classs = Integer.parseInt(classS);
	String numS = request.getParameter("num");
	int num = 0;
	if(numS!=null) num = Integer.parseInt(numS);	
	%>
	<body>
	   <h3>숫자 요청 처리</h3>
	   <table>
	      <tr><th>좋아하는 가수</th><td><%=request.getParameter("singer") %></td></tr>
	      <tr><th>좋아하는 가수</th><td><%=request.getParameter("singer") %></td></tr>
	      <tr><th>좋아하는 가수</th><td><%=request.getParameter("singer") %></td></tr>
	      <tr><th>좋아하는 노래</th><td><%=request.getParameter("song") %></td></tr>
	      <tr><th>좋아하는 노래</th><td><%=request.getParameter("song") %></td></tr>
	      <tr><th>좋아하는 노래</th><td><%=request.getParameter("song") %></td></tr>
	   </table>
	<h3>다중의 데이터 처리</h3>
<%
	String[] singers = request.getParameterValues("singer");
	if(singers==null) singers = new String[]{};
	String[] songs = request.getParameterValues("song");
	if(songs==null) songs = new String[]{};	
%>	
	<table>
	   <%for(String singer:singers){%>
		  <tr><th>좋아하는 가수</th><td><%=singer %></td></tr> 
	   <%} %>
	   <%
	   for(String song:songs){%>
		  <tr><th>좋아하는 노래</th><td><%=song %></td></tr> 
	   <%} %> 	
	</table>
<%--[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.--%>
<%
int num01 = (int)(Math.random()*8+2);
int num02 = (int)(Math.random()*9+1);
int corNum = num01 - num02;
String innumS = request.getParameter("innum");
String corNumS = request.getParameter("corNum");
if(innumS!=null){
	int innum = Integer.parseInt(innumS);
	int cor = Integer.parseInt(corNumS);
	if(innum==cor){
		response.sendRedirect("a06_succ.jsp?innum="+innum);
	}else{
		response.sendRedirect("a06_fail.jsp?innum="+innum+"&cor"+cor);
	}
}
%>

   <h3>임의의 (-) 문제를 처리하기</h3>
   <form method="post" id="form4">
   <table>
      <tr><th><%=num01 %> - <%=num02 %> = ?</th></tr>
      <tr><td>정답확인 : <input type="text" name="innum"/>
      			<input type="hidden" name="corNum" value="<%=corNum %>"/></td></tr>
      <tr><td><input type="button" value="정답확인" onclick="valid()"/></td></tr>
   </table>
   </form>
<%
	int[] num03 = new int[10];
	int[] num04 = new int[10];
	for(int i=0;i<num03.length;i++){
		num03[i]=(int)(Math.random()*9+1);
	}
	for(int i=0;i<num04.length;i++){
		num04[i]=(int)(Math.random()*9+1);
	}	
	String[] calcu = {"+","-","*","/"};
	for(int i=0;i<4;i++){
		int j = (int)(Math.random()*4);
		String calcuu = calcu[j];
	} 
%>   
<!-- [중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 총 10문제가 임의로 나오게 처리하세요.
        확인 클릭시, 결과 100점 만점에 맞춘만큼 점수도 표기-->
	
	
	<h3>연산자 임의로 10문제 출력하기</h3>
	<form method="post" id="form5">
	<table>
		<%
		for(int i=0;i<num03.length;i++){%>
			<tr><th><%=num03[i] %>
			<%
			int j = (int)(Math.random()*4);
			%>
			<%=calcu[j] %> <%=num04[i] %> = ? </th></tr>
	  <%} %>
	</table>
	</form>   
	
<!-- [하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고, 
	point는 숫자값이 되게 js로 처리한 후, result.jsp에서 해당 값을 출력하세요. -->	
	<form action="a06_result.jsp" id="form_">
		<table>
			<tr><th>id</th><td><input type="text" name="id"/></td></tr>
			<tr><th>point</th><td><input type="text" name="point"/></td></tr>
			<tr><td colspan="2"><input type="button" onclick="valid()"/></td></tr>
		</table>
	</form>
<script>
	function valid(){
	    var idObj=document.querySelector("input[name=id]");
	    var pointObj=document.querySelector("input[name=point]");
	    if(idObj.value==""||pointObj.value==""){
	       alert("데이터를 입력하세요.");
	    }else{
	       if(isNaN( pointObj.value ) ){
	          alert("숫자를 입력하세요.");
	          pointObj.value="";        
	       }else{
	          document.querySelector("#form_").submit();
	       }
	    }
	 }
</script>		        
</body>
</html>
