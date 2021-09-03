<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro</title>
</head>
<body>
	<%-- 
	
		# 데이터 베이스 연동 방법 
		
		1) mysql_connector.jar파일을 WEB-INF안 폴더의 lib에 넣는다. ( 처음셋팅할때 1번만 )
		2) Class.forName("com.mysql.cj.jdbc.Driver"); 을 작성한다. ( 외울필요가 없고 인터넷에서 복사 붙여넣기로 진행 )
		3) DriverManager의 getConnection(db연결정보,연결id,연결password) 메소드를 통하여서 Connection 객체를 생성한다.
		4) 쿼리문을 작성하여 선처리문 객체를 생성한다.
		5) 선처리문 객체를사용하여 쿼리를 웹에서 실행한다.
		
		
		
		# 쉽게 요약한 연동 방법
		
		1) mysql_connector.jar 파일을 lib폴더에 넣는다.
		2) Class.forName 작성
		3) Connection 객체를 작성
		4) Connection 객체로 PrepareStatement 객체를 생성한 후 쿼리문을 실행
		
	
	--%>
	
	<%
		request.setCharacterEncoding("utf-8"); // 한글화
	
		// web에 입력된 정보 java로 받아오기
		String id = request.getParameter("id"); 
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		Connection conn = null;			// 데이터 베이스를 연결하기 위한 객체
		PreparedStatement pstmt = null; // 쿼리문을 실행하기 위한 객체
		
		try {
			// DB 연결 정보 >  "jdbc:mysql://연결DB서버주소:프로토콜번호/DB명/시간동기화"
			String jdbcUrl = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			
			// DB 연결 계정
			String dbId    = "root";
			
			// DB 연결 비밀번호
			String dbPass  = "1234";
			
			// forName 생성
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 데이터 베이스 연동
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
			// 선처리문 쿼리 작성
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,NOW())";
			
			/* 
			
				# prepareStatement
				
				- 원래는 statement이었으나 sql 인젝션 공격에 대응하는 보안 기법으로 prepareStatement를 사용한다.
				- 먼저 ?로 쿼리문의 형식을 만들고 setter 메서드로 데이터를 대입하여 쿼리문을 완성한다.
				- 인덱스는 1부터 시작한다.
				- pstmt.set자료형(인덱스, 값);
				
					Ex)
					pstmt.setInt(index , value);   	  // 정수 타입 데이터 적용 메서드
				 	pstmt.setString(index , value);   // 문자열 타입 데이터 적용 메서드
				 	pstmt.setDate(index , value);	  // 날짜 타입 데이터 적용 메서드
		
			*/

			// 선처리문 쿼리 완성 선처리문쿼리 pstmt로 담김 (**pstmt에 conn정보넣는거 잊지말긔!)
			pstmt = conn.prepareStatement(sql); // "INSERT INTO MEMBER VALUES(?,?,?,NOW())"
			pstmt.setString(1, id);				// "INSERT INTO MEMBER VALUES(id,?,?,NOW())" //  인덱스0이아닌1부터시작,첫번째?에 id를 넣겠다
			pstmt.setString(2, passwd);			// "INSERT INTO MEMBER VALUES(id,passwd,?,NOW())" // 두번째?에 passwd를 넣겠다
			pstmt.setString(3, name);			// "INSERT INTO MEMBER VALUES(id,passwd,name,NOW())" // 세번째?에 name를 넣겠다
			
			// 쿼리문 실행
			pstmt.executeUpdate();

			// executeUpdate() : insert , update ,delete 문 실행 메서드 (웹 -> db)
			// executeQuery()  : select문 실행 메서드 (db -> 웹 , db조회)

		%>
			<script>
				alert("회원가입 되었습니다.");
				// location.href = "url";		> url페이지로 이동한다.
				location.href = "00_main.jsp";
			</script>		
		<%
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// 데이터 베이스 연동 종료.
			pstmt.close();
			conn.close();
		}
		
		
	%>

</body>
</html>