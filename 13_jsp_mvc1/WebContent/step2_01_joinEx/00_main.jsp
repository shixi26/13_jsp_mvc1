<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
		
		if (id == null) { //session >> main은 else이하가 보임
		// if(true){ // 처음 접속했을 경우
	%>
		<h1>JUST DO IT!</h1>
		<p><a href="01_insert.jsp">Join!</a></p>
		<p><a href="07_login.jsp">Login!</a></p>
	<%		
		}
		else{
	%>		
		<p><a href="#">Delete!</a></p>
		<p><a href="#">Modify!</a></p>
		<p><a href="#">Logout!</a></p>
	<%
		}
	
	%>

</body>
</html>