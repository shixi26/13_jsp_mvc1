<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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