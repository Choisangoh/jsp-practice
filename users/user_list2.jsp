<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // list1에서 발생했던 rs.close() 실행 문제로 인해
    // DB에 있는 자료를 꺼냈을 때, 곧바로 java 데이터로 받아오는 작업을 수행한 다음
    // rs.close()를 하면 문제가 없다.
    // 따라서 SELECT 구문의 결과(SQL데이터)를 담을 클래스가 필요하고, 
    // 이를 VO(Value Object)라고 부른다.
    // VO는 클래스이기 때문에 src/main/java에 클래스를 선언 및 정의한다.
    // UserVO.class 만들기
    
    /*
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
	
	// ArrayList<UserVO>자료형을 이용해 한줄 한줄 단위로 여러 row를 저장한다.
	// ArrayList는 길이가 가변적으로 돌아간다.
	List<UserVO> userList = new ArrayList<>();
	
	try{
		// 2. DB 연결
	    Class.forName(dbType);
	    con = DriverManager.getConnection(dbUrl, dbId, dbPw);
	    
	    // 3. SELECT * FROM userinfo 실행 및 ResultSet에 저장
	    String sql = "SELECT * FROM userinfo";
	    pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();		
		
		// 테이블에 저장된 데이터를 자바로 옮기기 위해서 UserVO를 선언했다.
		// UserVO 하나 생성으로 하나의 row에 해당하는 데이터를 받을 수 있다.
		while(rs.next()){
			// 1. ResultSet에서 데이터 가져오기
			String uName = rs.getString("uname");
			String uId = rs.getString("uid");
			String uPw = rs.getString("upw");
			String uEmail = rs.getString("uemail");
			
			UserVO userData = new UserVO(uName, uId, uPw, uEmail);
			userList.add(userData);
		}
		System.out.println(userList);
		// out.println(userList + "<br/>");		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// finally 지역에서 바로 .close()l를 쓰고도 데이터를 body태그에서 쓰려면
		// .close();이전에 DB에 있던 데이터를 모조리 자바로 옮겨야 한다.
		con.close();
		pstmt.close();
		rs.close();
	}
   */ 
   
   // 모든 접속정보는 UserDAO클래스 내에 있다.
   // 따라서 UserDAO를 생성하는 것으로 접속정보는 설정이 끝난다.
   UserDAO dao = new UserDAO(); // DB종류 지정까지 완료
   
   // dao 내부에 userinfo 테이블 전체의 데이터를 가져오는
   // getAllUserList()를 호출하는 것으로 필요 데이터 적재가 끝난다.
   List<UserVO> userList = dao.getAllUserList(); 
   // DB내 전체 데이터를 우측에 배달받아 좌변에 저장한다.
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 향상된 for문을 이용해서 userList 내부의 데이터를 
   Table형태로 user_list1과 동일한 양식으로 화면에 출력하기 -->
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
       <% for(UserVO user : userList){ %>  
       <!-- 힌트는 표현식 내에 getter를 쓴다. -->
       <tr>
         <td><%= user.getuName()%></td>
         <td><%= user.getuId() %></td>
         <td><%= user.getuPw() %></td>
         <td><%= user.getuEmail() %></td>
       </tr>
       <% } %>
     </tbody>
   </table>
</body>
</html>
