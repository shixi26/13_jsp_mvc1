<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainEx</title>
</head>
<body>
	
	<%
		if(true) {
	%>
		<h1>main page</h1>
		<p><a href="insert.jsp">join</a></p>
		<p><a href="#">Login</a></p>
	<%
		}
		else{
	%>
		<p><a href="#">delete</a></p>
		<p><a href="#">modify</a></p>
		<p><a href="#">Logout</a></p>

	<% 			
		}
	%>
</body>
</html>