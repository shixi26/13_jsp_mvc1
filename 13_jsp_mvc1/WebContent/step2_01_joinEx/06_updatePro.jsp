<%@page import="step2_00_loginEx.MemberDto"%>
<%@page import="step2_00_loginEx.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>updatePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		boolean isUpdate = MemberDao.getInstance().updateMember(new MemberDto(id, passwd, name));
		
		if (isUpdate) {
			
	%>
		<script>
			alert("Information has changed.");
			location.href = "00_main.jsp";
		</script>
	<%
		}
		else{
		
	%>
		<script>
			alert("Check your Id or Password.");
			histroy.go(-1);
		
		</script>
	<%
			
		}
	%>
	
</body>
</html>