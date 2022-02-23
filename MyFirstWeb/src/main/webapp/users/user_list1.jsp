<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 전체 유저 목록을 가져오는 코드 작성
    
    // 1. DB접속 변수 생성
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	// java.sql 관련 변수들도 try문 전에 미리 선언해둔다.
	// try구문 진입 전에 선언해야 문서 전체에서 쓸 수 있음 
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
    // 2. DB 연결
    Class.forName(dbType);
    con = DriverManager.getConnection(dbUrl, dbId, dbPw);
    
    // 3. SELECT * FROM userinfo 실행 및 ResultSet에 저장
    String sql = "SELECT * FROM userinfo";
    pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
    
	// 4. rs에 저장된 요소를 전체 리스트 콘솔에 찍어주기
	// while(rs.next()){
		// out.println("회원이름 : " + rs.getString("uname") + "<br/>");
		// out.println("회원아이디 : " + rs.getString("uid") + "<br/>");
		// out.println("회원비번 : " + rs.getString("upw") + "<br/>");
		// out.println("회원이메일 : " + rs.getString("uemail") + "<br/>");
		// out.println("----------------------------------" + "<br/>");
	   // }
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// .close() 로 자원회수하는 것을 try블럭 내부에 작성해두면
		// 평상시에는 상관없지만 모종의 이유로 에러가 발생했을떄 자원회수를 못할 수 도 있다.
		// 그래서 finally 내부에 넣어야한다.
		// finally는 try와 블럭(지역)이 다르기 때문에
		// try 진입 전에 미리 변수들을 선언해둬야 아래와 같이 .close()구문을 적을 수 있다.

		
		// 문제는 현재 이 구문에서는 rs.next()가 rs.close() 이후에 배치되어 있어서
		// 에러가 발생한다.
		// con.close();
		// pstmt.close();
		// rs.close();
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 테이블 태그 생성하기.
   테이블 첫 줄은 유저이름, 유저아이디, 유저비번, 유저이메일 순으로 나오고,
   두번째 줄부터는 반복문으로 해당 유저 관련 정보가 나오도록 하기-->
   <table border="1">
     <thead>
       <tr>
         <th>유저이름</th>
         <th>유저아이디</th>
         <th>유저비번</th>
         <th>유저이메일</th>
       </tr>
     </thead>
     <tbody>
       <% while(rs.next()){ %>  
       <tr>
         <td><%= rs.getString("uname") %></td>
         <td><%= rs.getString("uid") %></td>
         <td><%= rs.getString("upw") %></td>
         <td><%= rs.getString("uemail") %></td>
       </tr>
       <% } %>
     </tbody>
   </table>
</body>
</html>