package step3_00_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	
	private BoardDao() {}
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/step3_board_ex?serverTimezone=UTC";
			String dbId    = "root";
			String dbPass  = "1234";
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	// 게시글을 추가하는 DAO -넣기만하면되니까void
	public void insertBoard (BoardDto boardDto) {
		
		try {
			
			conn = getConnection();
			
			String sql = "INSERT INTO BOARD(WRITER,EMAIL,SUBJECT,PASSWORD,REG_DATE,READ_COUNT,CONTENT)";
				   sql += "VALUES(?,?,?,?,NOW(),0,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDto.getWriter());
			pstmt.setString(2, boardDto.getEmail());
			pstmt.setString(3, boardDto.getSubject());
			pstmt.setString(4, boardDto.getPassword());
			pstmt.setString(5, boardDto.getContent()); // ?가 5번째 >content 
			pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (conn != null) try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		
	}
	
	// 전체 게시글을 조회하는 DAO 
	public  ArrayList<BoardDto> getAllBoard() { // BoardDto는 한줄만 해당>배열이용
		
		ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
		BoardDto bdto = null;
		
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bdto = new BoardDto();
				bdto.setNum(rs.getInt("NUM")); 				// bdto.setNum(rs.getInt("1")); 컬럼명으로써주는게좋아
				bdto.setWriter(rs.getString("WRITER")); 	// bdto.setWriter(rs.getString("2")); 
				bdto.setEmail(rs.getString("EMAIL")); 		// bdto.setEmail(rs.getString("3"));
				bdto.setSubject(rs.getString("SUBJECT"));	// bdto.setSubject(rs.getString("4"));
				bdto.setPassword(rs.getString("PASSWORD"));	// bdto.setPassword(rs.getString("5"));
				bdto.setRegDate(rs.getDate("REG_DATE"));	// bdto.setRegDate(rs.getDate("6"));
				bdto.setReadCount(rs.getInt("READ_COUNT"));	// bdto.setReadCount(rs.getInt("7")); 
				bdto.setContent(rs.getString("CONTENT"));	// bdto.setContent(rs.getString("8"));
				
				boardList.add(bdto); // 한줄한줄담김
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (conn != null) try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
			if (rs != null) try {rs.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		
		return boardList; // 한줄한줄읽어온거bdto담은baordList 화면에 데이터 뿌려주긔
	}
}
