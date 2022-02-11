package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCpstmtDelete {

	public static void main(String[] args) {
		// Delete 구문을 실행하는 코드 작성하기
		// 삭제의 기준은 uid가 일치하는 자료를 삭제한다.
		

		// 접속 정보는 변수로 관리		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
		
		try {
			// 1. 스캐너로 삭제할 회원 uid 입력받기
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 회원의 아이디를 입력하세요.");
			String uId = scan.nextLine();
			
			// 2. DB와 자바 연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 3. 쿼리문에 ?를 포함해 작성한 후 PreparedStatement 객체 생성
			String sql = "DELETE FROM userinfo WHERE uid=?";		
			PreparedStatement pstmt = con.prepareStatement(sql);	
			
			// ?에 넣어줄 자료 세팅
			pstmt.setString(1, uId);
			
			// 4. 실행
			pstmt.executeUpdate();				
			
		}catch(Exception e) {
			e.printStackTrace();
		}					
      }
   }