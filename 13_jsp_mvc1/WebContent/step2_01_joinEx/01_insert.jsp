<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<form method="post" action="02_insertPro.jsp">
		<fieldset>
			<legend>Join Form</legend><!-- domEX22정답예시참조 -->
			<p>Id : <input type="text" name="id" autofocus></p>
			<p>Password : <input type="password" name="pwd"></p> <!-- name="passwd"아님주의 -->
			<p>Name : <input type="text" name="name"></p>
			<p><input type="submit" value="join"></p>
		</fieldset>
	</form>
</body>
</html>