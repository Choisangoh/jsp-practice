package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		// 사용자가 Scanner로 아이디를 입력하면
		// 해당 아이디 정보가 DB에서 삭제되도록 로직 작성하기
		// 역시 executeUpdate("실행문"); 으로 실행한다.
		// 강사님이 Insert에서 시범 보여준거처럼 실행 전에 콘솔을 이용해서
		// 쿼리문이 제대로 작성되었는지 확인할 수 있도록 보여주는 코드도 같이 작성하기 
		
		// 접속용 DB종류, 주소, id, pw는 변수로 관리해도 됩니다.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
		

		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 아이디를 입력하세요.");
			String uId = scan.nextLine();
			
			// DB종류 지정
			Class.forName(dbType);
			
			// DB서버와 자바간 연결
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 쿼리문 발송 준비
			Statement stmt = con.createStatement();
			
			// 쿼리문 발송 전 콘솔에 찍기
			System.out.println("발송할 쿼리문");
			System.out.println("DELETE FROM userinfo WHERE uid='" + uId + "'");
			System.out.println("-----------------------------");
			
			// 쿼리문 발송
			stmt.executeUpdate("DELETE FROM userinfo WHERE uid='" + uId + "'");
			
		} catch(Exception e) {
			e.printStackTrace();
		}					
	}
}
