<%@page import="step3_00_boardEx.BoardDao"%>
<%@page import="step3_00_boardEx.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
</head>
<body>
	<%
	
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDto bdto = BoardDao.getInstance().getOneUpdateBoard(num);
	
	%>
	
	<form method="post" action="07_bUpdatePro.jsp">
	
		<h1>게시글 수정하기</h1>
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><%=bdto.getWriter() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=bdto.getRegDate() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="<%=bdto.getSubject() %>"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea rows="10" name="content"><%=bdto.getContent()%></textarea></td>
			</tr>
			
		</table>
		<p>
			<input type="hidden" name="num" value="<%=bdto.getNum() %>">
			<input type="submit" value="글수정">
			<input type="button" value="전체글보기" onclick="location.href='04_bList.jsp'">
		</p>
	</form>
</body>
</html>