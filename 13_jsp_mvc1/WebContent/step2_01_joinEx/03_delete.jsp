<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>delete</title>
</head>
<body>

	<%
		String id = (String)session.getAttribute("id"); //���������� �����Ҽ��ֿ�..
	%>

	<form method="post" action="04_deletePro.jsp">
		<fieldset>
			<legend>'<%=id %>' ȸ��Ż��</legend>
			<p>Id : <input type="text" name="id" value="<%=id %>" readonly></p><!-- readonly�б����� -->
			<p>Password : <input type="password" name="pwd"></p>
			<p><input type="submit" value="delete"></p>
		</fieldset>
	</form>
	
</body>
</html>