package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCpstmtUpdate {

	public static void main(String[] args) {
		// Update구문을 Scanner로 입력받은 자료를 토대로 로직 작성하기
		
		// 변수로 접속정보를 관리한다.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";				
		
		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("변경하고싶은 계정의 아이디를 입력하세요.");
			String uId = scan.nextLine();
			System.out.println("변경할 비밀번호를 입력하세요.");
			String uPw = scan.nextLine();
			System.out.println("변경할 이름을 입력하세요.");
			String uName = scan.nextLine();
			System.out.println("변경할 이메일을 입력하세요.");
			String uEmail = scan.nextLine();
			
		    Class.forName(dbType);
		    Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		    
		    String sql = "UPDATE userinfo SET upw=?, uName=?, uEmail=? WHERE uId=?";
		    PreparedStatement pstmt = con.prepareStatement(sql);
		    
		    pstmt.setString(1, uPw);
		    pstmt.setString(2, uName);		
			pstmt.setString(3, uEmail);
			pstmt.setString(4, uId);

			pstmt.executeUpdate();
			
			// .close()로 열린 자료 닫아주기
			// 일반 자바코드는 어차피 코드실행이 끝나면 프로그램이 강제로 종료되지만
			// 서버의 경우는 코드실행이 끝나도 서버가 계속 돌아가 자원회수를 안해주면
			// 점점 시스템에 부하가 걸릴수도 있다.
			// 이를 막기위해 호출이 끝난 자원은 .close()로 사용해제를 해줘야한다.
			con.close();
			pstmt.close();
			scan.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			// 종료 안내 구문 + .close()로 열린 자료 닫기
		}
	}
}
