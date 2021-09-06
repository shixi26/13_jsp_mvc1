<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
</head>
<body>

	<%
	
		session.invalidate();
		// 둘중하나 선택 session.removeAttribute("id");
	
	%>
	
	<script>
		alert("yout are logged out.");
		location.href="00_main.jsp";
	</script>

</body>
</html>