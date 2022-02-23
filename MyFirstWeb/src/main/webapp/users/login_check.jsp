<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // form에서 보낸 아이디, 비번을 변수에 저장하고 콘솔에 찍어보기
    String fid = request.getParameter("Fid");
    String fpw = request.getParameter("Fpw");
    System.out.println("폼에서 날린 아이디 : " + fid);
    System.out.println("폼에서 날린 비번 : " + fpw);
    
    /*
    // DB연결을 위한 변수선언
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
    try{
    	
    	// 1. DB종류 선택 및 연결
    	 Class.forName(dbType);
         Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
         
    	// 2. 쿼리문(사용자가 입력해준 fid 조회하기) 선언 및 pstmt 객체 생성
    	String sql = "SELECT * FROM userinfo WHERE uid=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, fid);
        
    	// 3. 쿼리문 실행 후 결과 ResultSet에 받기
    	ResultSet rs = pstmt.executeQuery();
    	*/
    	
    	
    	
    	// 1~3번까지의 로직을 DAO의 getUserDate를 사용해 얻어오기
        // DAO 생성
        UserDAO dao = new UserDAO();
        // UserVO getUserData() 결과 받기
        UserVO user = dao.getUserData(fid);    
        System.out.println("DB에서 받아온 정보 " + user);
   
        
    
        
    	// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면
    	// (fid.equals(DB내에 저장된 ID)로 검사 가능)
    	// DB에 적재되있던 비밀번호를 마저 사용자 입력 비밀번호와 비교해서 
    	// 둘 다 일치하면 세션 발급
    	// 그렇지 않다면 로그인에 실패했습니다 메시지가 뜨도록 처리
    	
    	// 아이디가 없다면 null이 들어옴
    	if(user != null){
    		// String uId = rs.getString("uid");
    		// String uPw = rs.getString("upw");
    		String uId = user.getuId();
    		String uPw = user.getuPw();
    		System.out.println("DB내 유저 아이디 : " + uId);
    		System.out.println("DB내 유저 비번 : " + uPw);
    		
    		if(fid.equals(uId) && fpw.equals(uPw)){
    			out.println("<h1>로그인에 성공하셨습니다.</h1>");   			
    			session.setAttribute("session_id", uId);
    			session.setAttribute("session_pw", uPw);  
    			response.sendRedirect("login_welcome.jsp");
    		}else{
    		out.println("<h1>비밀번호가 틀렸습니다. 다시 확인해주세요.</h1>");
    	  }
    	}else{
    		out.println("<h1>아이디가 없습니다. 다시 확인해주세요.</h1>");
    	}	 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>