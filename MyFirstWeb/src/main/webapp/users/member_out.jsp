<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // form에서 날려준 데이터 가져오기 - request.getParameter();
    // session에서 날려준 데이터 가져오기 - (String)session.getAttribute();
    String sId = (String)session.getAttribute("session_id");
    
    // 그리고 로그인 안 한 사용자가 접근하면 로그인폼으로 리다이렉트
    if(sId == null){   	
    	response.sendRedirect("login_form.jsp");
    }  
    
    /*
    // DB연결을 위한 변수선언
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	try{
		// DB종류 지정 및 연결하기
   	    Class.forName(dbType);
        Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
        
        // pstmt 생성 및 세팅하기
        // DELETE 쿼리문 작성
        // 실제로 DB에 DELETE 구문을 날려서 삭제까지 처리하기
        String sql = "DELETE FROM userinfo WHERE uid=?";		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,sId); // 현재 로그인된 유저를 삭제하기 위해서 sId를 넣어야됨.
		
		// 쿼리문 실행
		// executeQuery();는 SELECT문 실행 시에만 사용
		// executeUpdate();는 그 이외 구문들 실행 시 사용
		pstmt.executeUpdate();	 
		
		// 자원 회수하기
		con.close();
		pstmt.close();
	}catch(Exception e){
		e.printStackTrace();
		
		
		
		
	}finally{
		// 세션 모두 파기하기
		session.invalidate();

	}
	*/
	UserDAO dao = UserDAO.getInstance();
	dao.deleteUser(sId);
    session.invalidate();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1><%=sId %> 회원의 탈퇴가 완료되었습니다.</h1>
   <a href="login_form.jsp">로그인 하러가기</a>
</body>
</html>