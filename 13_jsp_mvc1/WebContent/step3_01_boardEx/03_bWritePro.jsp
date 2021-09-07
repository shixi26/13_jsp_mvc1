<%@page import="step3_00_boardEx.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bWritePro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="boardDto" class="step3_00_boardEx.BoardDto">
		<jsp:setProperty name="boardDto" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDao.getInstance().insertBoard(boardDto);
	
	%>
	
	<script>
		alert("등록되었습니다.");
		location.hreff ="04_bList.jsp";
	</script>
</body>
</html>