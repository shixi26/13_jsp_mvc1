package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DAO (Data Access Object) : 데이터 접근 객체
public class MemberDao {
	
	// 싱글턴 패턴
	private MemberDao() {}
	private static MemberDao instance = new MemberDao(); // 기존꺼를 계속불러와
	public static MemberDao getInstance() { // MemberDao.getInstace().
		return instance;
	}
	
	// java.sql import
	private Connection conn 		= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs 			= null;
	
	// getConnection() 메서드를 이용하여 어디에서든지 db정보사용가능ㅎㅎㅎ 메서드명앞public은 저기아래(webcontent)에서도 사용하기위함
	// 반환 타입은 Connection 객체이며 메서드명은 관용적으로 getConnection으로 작성한다.
	public Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			String dbId    = "root";
			String dbPass  = "1234";
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// Join DAO
	public boolean insertMember(MemberDto mdto) {
		
		// db에 저장하기 (똑같은 아이디가 있으면 저장안해줌,없으면 저장해줌 >> boolean으로해줌)
		boolean isFirstMember = false; // 저장안했으면 false 했으면 true리턴
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID=?");
			pstmt.setString(1, mdto.getId());
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				
				pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(?,?,?,NOW())");
				pstmt.setString(1, mdto.getId());
				pstmt.setString(2, mdto.getPasswd());
				pstmt.setString(3, mdto.getName());
				pstmt.executeUpdate();
				isFirstMember = true;
				
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // null이아닐때>>어차피 try/catch에서 잡히겠지만 관용적으로 씀..안써도돼
			if (rs != null) try {rs.close();} 	 catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (conn != null) try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		
		return isFirstMember; 
	}
	
	// Login DAO
	public boolean login(String id, String passwd) {
		
		boolean isValidMember = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ? AND PASSWD = ?");
			pstmt.setString(1,id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery(); //select문이니까executeQuery 조회를하기위해rs담아
			
			if (rs.next()) {
				isValidMember = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			if (rs != null)		try {rs.close();} 	 catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null)  try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (conn != null) 	try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		
		return isValidMember;
		
	}
	
	// Leave DAO
	public boolean leaveMember(String id , String pwd) {
		
		boolean isLeaveMember = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ? AND PASSWD = ?"); //db 비번passwd로저장되어있옹..
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE ID = ?"); //delete쿼리문다시보기
				pstmt.setString(1,id);
				pstmt.executeUpdate();
				isLeaveMember = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			if (rs != null) 	try {rs.close();} 	 catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null)  try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (conn != null) 	try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}		
		return isLeaveMember;
		
	}
	
	// 9/6완성하긔,,,
	public boolean updateMember(MemberDto mdto) {
		
		boolean isUpdateMember = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ? AND PASSWD = ?");
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPasswd());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // 이름수정
				pstmt = conn.prepareStatement("UPDATE MEMBER SET NAME=? WHERE ID=?");
				pstmt.setString(1, mdto.getName());
				pstmt.setString(2, mdto.getId());
				pstmt.executeUpdate();
				isUpdateMember = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)		try {rs.close();} 	 catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null)  try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (conn != null) 	try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		return isUpdateMember;
		
	}

}
