<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    // form에서 날려준 데이터를 받아서 변수에 저장하기
    String fId = request.getParameter("Fid");
    String fPw = request.getParameter("Fpw");
    String fName = request.getParameter("Fname");
    String fEmail = request.getParameter("Femail");
    
    // 위의 사용자가 입력한 데이터를 토대로
    // 스크립트릿 내부에서 DB연동을 한 다음 insert 구문을 실행하도록 만들면 
    // 회원가입 절차 구현 가능
    
    /*
    // 0. DB 종류 지정
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	try{
	// 1. try~catch구문에서 DB 연결
    Class.forName(dbType);
    Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
    
    // 2. 쿼리문 작성 및 pstmt 생성
    String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
			
    // 4. ?에 값 세팅
    pstmt.setString(1, fName);
	pstmt.setString(2, fId);
	pstmt.setString(3, fPw);
	pstmt.setString(4, fEmail);
			
    // 5. pstmt 실행으로 사용자가 보낸 폼 데이터 DB에 저장
	pstmt.executeUpdate();
			
	con.close();
	pstmt.close();
    
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// 6. out.println("회원가입이 완료되었습니다."); 띄워서 가입완료 알리기
		out.println("<h1>회원가입이 완료되었습니다.</h1>");
	}
	*/
	UserDAO dao = UserDAO.getInstance();
	dao.insertUser(fName, fId, fPw, fEmail);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <a href="login_form.jsp">로그인 하러가기</a>
</body>
</html>