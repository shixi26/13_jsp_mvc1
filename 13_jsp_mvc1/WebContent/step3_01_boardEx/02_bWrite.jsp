<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bWrite</title>
</head>
<body>
	
	<form method="post" action="03_bWritePro.jsp">
		<h2>�Խñ� ����</h2>
		<table border="1">
			<tr>
				<td>�ۼ���</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>�۳���</td>
				<td><textarea name="content"></textarea></td>
			</tr>
		</table>
			<p>
			<input type="submit" value="�۾���">
			<input type="button" value="��ü�Խñۺ���" onclick="location.href='04_bList.jsp'">
			</p>
	</form>
	
	
</body>
</html>