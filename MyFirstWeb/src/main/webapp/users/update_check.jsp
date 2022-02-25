<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 0. 한글이 꺠지지않도록 하는 코드 작성하기
    request.setCharacterEncoding("utf-8");
    
    // 1. form에서 보낸 비번, 이름, 이메일 변수로 저장하기
    String fPW = request.getParameter("FPW");
    String fNA = request.getParameter("FNA");
    String fEM = request.getParameter("FEM");
    System.out.println("폼에서 얻어온 비번 : " + fPW);
    System.out.println("폼에서 얻어온 이름 : " + fNA);
    System.out.println("폼에서 얻어온 이메일 : " + fEM);
    
    // 2. 세션에 저장된 아이디를 변수로 저장하기
    String sId = (String)session.getAttribute("session_id");
    System.out.println("세션으로 얻어온 아이디 : " + sId);
    
    /*
    // 3. DB접속정보 변수로 관리
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";	
	
	 try{
    // 4. DB연결하기
    Class.forName(dbType);
    Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
    
    // 5. pstmt생성 및 ?에 값 세팅
    String sql = "UPDATE userinfo SET upw=?, uname=?, uemail=? WHERE uid=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, fPW);
    pstmt.setString(2, fNA);		
	pstmt.setString(3, fEM);
	pstmt.setString(4, sId);

    // 6. pstmt 실행 및 자원 회수
    pstmt.executeUpdate();
    con.close();
    pstmt.close();
    
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	
    }
	  */
	  UserDAO dao = UserDAO.getInstance();
	  dao.UpdateCheck(sId, fPW, fNA, fEM);
	  
	  // 7. body태그에 xx회원의 정보가 수정되었습니다. 
	  // 라고 안내해주고, 웰컴 페이지로 갈 수 있는 링크 넣어주기
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1><%=sId %>님의 회원 정보가 수정되었습니다.</h1>
   <a href="login_welcome.jsp">메인화면으로 이동</a>
</body>
</html>