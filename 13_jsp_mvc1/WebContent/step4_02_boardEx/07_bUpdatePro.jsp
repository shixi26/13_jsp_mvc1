<%@page import="step4_00_boardEx.BoardDto"%>
<%@page import="step4_00_boardEx.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07_updatePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	
		<jsp:useBean id="boardDTO" class="step4_00_boardEx.BoardDto">
			<jsp:setProperty name="boardDTO" property="*" />
		</jsp:useBean>
	
	<%
		boolean isUpdate = BoardDao.getInstance().updateBoard(boardDTO);		
		
		if (isUpdate) {
	%>
			<script>
				alert('수정되었습니다.');
				location.href="04_bList.jsp";
			</script>
	<% 
		}
		else {										
	%>
			<script>
				alert('패스워드가 일치하지 않습니다. 다시 확인 후 수정해주세요.');
				history.go(-1);
			</script>
	<%			
		}
	%>
</body>
</html>