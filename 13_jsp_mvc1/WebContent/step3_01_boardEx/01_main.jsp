<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
</head>
<body>
	<%-- mysql에서 run

		CREATE DATABASE STEP3_BOARD_EX;
		
		USE STEP3_BOARD_EX;
		
		CREATE TABLE BOARD(
			NUM INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
		    WRITER VARCHAR(50),
		    EMAIL VARCHAR(50),
		    SUBJECT VARCHAR(50),
		    PASSWORD VARCHAR(20),
		    REG_DATE DATE,
	        READ_COUNT INT,
		   	CONTENT VARCHAR(200)
		);
		
		SELECT * FROM BOARD;
	
	--%>
	<img src="../img/jsp.PNG" alt="jsp심볼" width="400px" height="200px"><br><br><br>
	<input type="button" value="게시판 보기" onclick="location.href='04_bList.jsp'">
</body>
</html>