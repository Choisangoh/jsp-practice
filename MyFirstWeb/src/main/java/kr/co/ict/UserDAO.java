package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO 클래스는 DB연동을 전담하여 처리한다.
public class UserDAO {
	
	// DB접속에 필요한 변수드르을 아래에 선언한다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	private String dbId = "root";
	private String dbPw = "mysql";
	
	// 생성자를 이용해서 생성 할 떄 자동으로 Class.forName()을 실행하게 만든다.
	// 어떤 구문을 실행하더라도 공통적으로 활용하는 부분
	public UserDAO() {
		try {
			Class.forName(dbType);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// user_list2.jsp의 코드 로직을 대체해보겠음
	// user_list2.jsp에서 전체 유저 목록을 필요로 하기 때문에
	// 실행 결과로 List<UserVO>를 리턴해줘야한다.
	// 역시 SELECT구문을 실행할때에는 리턴자료가 필요하고,
	// INSERT, DELETE, UPDATE구문을 실행할 때는 리턴자료가 void이다.
	
	// List<UserVO>는 여러명의 계정 정보
	public List<UserVO> getAllUserList(){
		// try블럭 진입 전에 Connection, PreparedStatement, ResultSet을 선언
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// try블럭 진입 전에 ArrayList 선언 
		List<UserVO> userList = new ArrayList<>();
		try {
		
		// DB연결
		con = DriverManager.getConnection(dbUrl, dbId, dbPw);		
		
		// SELECT * FROM userinfo 실행 및 ResultSet에 저장 
		 String sql = "SELECT * FROM userinfo";
		 pstmt = con.prepareStatement(sql);
		 
		 // 쿼리문 실행
		 rs = pstmt.executeQuery();	
		 
		 // UserVO ArrayList에 rs에 든 모든 자료를 저장하기
		 while(rs.next()) {
			 String uName = rs.getString("uname");
			 String uId = rs.getString("uid");
			 String uPw = rs.getString("upw");
			 String uEmail = rs.getString("uemail");
			 
			 UserVO userData = new UserVO(uName, uId, uPw, uEmail);
			 userList.add(userData);
		  }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			con.close();
			rs.close();
			pstmt.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return userList;
	}
	
	
	// login_update.jsp의 경우 로그인한 유저 한명의 데이터만 DB에서 얻어온다.
    // 따라서, 그 한명의 유저 데이터만을 이용해 SELECT구문을 써야한다.
	// login_update.jsp상단의 sId 변수에 들어있는 유저명을 이용해 유저데이터를 얻어온다.
	
	// UserVO는 한명의 계정 정보
	public UserVO getUserData(String sId) {
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 조금 다르다.	

		// 1. try블럭 진입 전에 Connection, PreparedStatement, ResultSet 선언
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;		
		
		// try블럭 진입 전에 UserVO 변수 선언
		// UserVO는 return구문에서 사용
		UserVO user = null;
		
		try {
			// 2. DB 연결
		    con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		    
		    // 3. 쿼리문을 날려서 rs에 DB에서 가져온 정보 받기
		    String sql = "SELECT * FROM userinfo WHERE uid=?";	 
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, sId);
		    rs = pstmt.executeQuery();
		    
		    // 4. rs에 저장된 데이터를 UserVO에 담기	    
		    if(rs.next()){
		    	String uName = rs.getString("uname");
		    	String uId = rs.getString("uid");
		    	String uPw = rs.getString("upw");
		    	String uEmail = rs.getString("uemail");
		    	user = new UserVO(uName, uId, uPw, uEmail);
		    }		
		    // 5. catch, finally 블럭을 작성하고, finally에서는 자원회수
		}catch(Exception e) {
			e.printStackTrace();
		}finally { 
			try {
			con.close();
		    pstmt.close();
		    rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}
}

