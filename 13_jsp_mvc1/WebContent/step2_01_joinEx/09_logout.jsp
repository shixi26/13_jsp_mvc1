<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α׾ƿ�</title>
</head>
<body>

	<%
	
		session.invalidate();
		// �����ϳ� ���� session.removeAttribute("id");
	
	%>
	
	<script>
		alert("yout are logged out.");
		location.href="00_main.jsp";
	</script>

</body>
</html>