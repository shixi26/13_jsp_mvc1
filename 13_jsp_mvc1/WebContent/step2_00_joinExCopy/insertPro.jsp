<%@page import="step2_00_loginEx.MemberDto"%>
<%@page import="step2_00_loginEx.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertProEx</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		boolean isFirstMember = MemberDao.getInstance().insertMember(new MemberDto(id, password, name));
		
		if (isFirstMember) {
			
	%>
		<script>
			alert("Your account has been successfully created!");
			location.href = "main.jsp";
		</script>
	<% 		
		}
		else {
	%>
	
		<script>
			alert("Sorry! The username already exists! cannot use it as username!");
			history.go(-1);
		</script>
	<%
			
		}
		
	%>

</body>
</html>