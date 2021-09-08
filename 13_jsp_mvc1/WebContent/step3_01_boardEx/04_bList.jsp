<%@page import="step3_00_boardEx.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="step3_00_boardEx.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bList</title>
</head>
<body>

	<h1>게시글 보기</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			ArrayList<BoardDto> boardList = BoardDao.getInstance().getAllBoard(); 
			for (BoardDto bdto : boardList) { // 
		%>
			<tr>
				<td><%=bdto.getNum() %></td>
				<td><%=bdto.getSubject() %></td>
				<td><%=bdto.getWriter() %></td>
				<td><%=bdto.getRegDate() %></td>
				<td><%=bdto.getReadCount() %></td>
			</tr>
		<%		
			}
		%>
		
		<tr>
			<td colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='02_bWrite.jsp'">
			</td>
			
		</tr>
	</table>
</body>
</html>