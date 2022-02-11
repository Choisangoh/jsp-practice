<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // form에서 보낸 아이디, 비번을 변수에 저장하고 콘솔에 찍어보기
    String fId = request.getParameter("Fid");
    String fPw = request.getParameter("Fpw");
    System.out.println(fId);
    System.out.println(fPw);
    
    // DB연결을 위한 변수선언
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
    try{
    	// 1. DB종류 선택 및 연결
    	 Class.forName(dbType);
         Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
         
    	// 2. 쿼리문(사용자가 입력해준 fId 조회하기) 선언 및 pstmt 객체 생성
    	String sql = "SELECT * FROM userinfo WHERE fId=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, fId);
        
    	// 3. 쿼리문 실행 결과 ResultSet에 받기
    	ResultSet rs = pstmt.executeQuery();
    	
    	// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면
    	// (fId.equals(DB내에 저장된 ID)로 검사 가능)
    	// DB에 적재되있던 비밀번호를 마저 사용자 입력 비밀번호와 비교해서 
    	// 둘 다 일치하면 세션 발급
    	// 그렇지 않다면 로그인에 실패했습니다 메시지가 뜨도록 처리
    	if(fId.equals()){
    		
    	}
    	
    	// 5. 만약 웰컴페이지도 만들 여력이 되면
    	// 가입 이후 리다이렉트로 넘겨서
    	// 이름(아이디)님 로그인을 환영합니다 라는 문장이 뜨는 
    	// login_welcome.jsp까지 구현해보기
    	
    }catch(Exception e){
    	e.printStackTrace();
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