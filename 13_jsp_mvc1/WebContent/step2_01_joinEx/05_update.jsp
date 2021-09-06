<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update</title>
</head>
<body>
	
	<%
		String id = (String)session.getAttribute("id");
		
	%>

	<form method="post" action="06_updatePro.jsp">
	<fieldset>
		<legend>'<%=id %>' 정보수정</legend>
		<p>Id: <input type="text" name="id" value="<%=id %>" readonly></p>
		<p>Password: <input type="password" name="passwd"></p>
		<p>Name: <input type="text" name="name"></p>
		<p><input type="submit" value="update"></p>
	</fieldset>
	</form>	
	
</body>
</html>