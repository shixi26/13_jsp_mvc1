<%@page import="step2_00_loginEx.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	<%
	
		request.setCharacterEncoding("utf-8");
		
		String id 	  = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		boolean isLeave = MemberDao.getInstance().leaveMember(id,passwd);
		
		if (isLeave) {
		
			session.invalidate();
	%>
			<script>
				alert("Your account has been deleted successfully.");
				location.href = "00_main.jsp";
			</script>		
	<% 
		} 
		else {
	%>
			<script>
				alert("Check your ID ans Password.");
				history.go(-1);
			</script>		
	<% 		  		
		}
	%>			
</body>
</html>