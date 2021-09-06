<%@page import="step2_00_loginEx.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>deletePro</title>
</head>
<body>
	
	<%
	
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd"); // 변수에 담는건 필수는 아니야
	
		boolean isLeave = MemberDao.getInstance().leaveMember(id,pwd);
		
		if (isLeave) {
			session.invalidate(); //세션종료session.remove 
	%>
		<script>
			alert("Your account has been deleted succeessfully.");
			location.href = "00_main.jsp";
		</script>
	<%		
		}
		else{
	%>
		<script>
			alert("Check your Id or Password.");
			history.go(-1);
		</script>
	<%
			
		}
		
		
	%>
	
</body>
</html>