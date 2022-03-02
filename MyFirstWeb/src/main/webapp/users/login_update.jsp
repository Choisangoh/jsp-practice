<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 1. 세션에서 아이디를 얻어와 변수에 저장하고, 
    // 세션결과값이 null이면 로그인폼으로 리다이렉트
    String sId = (String)session.getAttribute("session_id");
    if(sId == null){
	   response.sendRedirect("login_form.jsp");
   }
    /*
	// 상위지역에서 미리 uName과 uEmail을 선언을 선언 및 초기화 해놔야
	// 표현식에서 저장된 값을 활용할수 있다.
	String uName = "";
    String uEmail = null;	
    
    // DB 변수 선언
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";	
    try{
    // 2. DB지정 및 연결
	Class.forName(dbType);
    Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
    
    // 3. 로그인된 아이디의 전체 정보(SELECT * FROM) 얻어오기
    String sql = "SELECT * FROM userinfo WHERE uid=?";
  
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, sId);
    ResultSet rs = pstmt.executeQuery();
    
    // 4. ResultSet에서 얻어온 정보 중 name, email을 변수에 저장
    // 혹시 데이터가 안들어왔을 상황을 대비해 rs.next()는 if문의 조건절에 넣어서 실행
    if(rs.next()){
    	uName = rs.getString("uname");
        uEmail = rs.getString("uemail");
    	System.out.println("DB내 유저 이름 : " + uName);
    	System.out.println("DB내 유저 이메일 : " + uEmail);
    }
    // 접속 끊기
    con.close();
    pstmt.close();
    
    // 5. 하단 form의 value에 해당 변수에 든 값이 들어가도록 설정하기
    
	}catch(Exception e){
		e.printStackTrace();
	}
    */
    
    // DAO를 활용한 로직으로 전환
    // 1. DAO 생성
    UserDAO dao = new UserDAO();
    // 2. DAO내부에서 회원 1명의 정보만 가져오는 getUserData 호출
    UserVO user = dao.getUserData(sId); // sId는 이미 세션에서 얻어왔음
    // 3. 얻어온 user 내용물 확인
    out.println(user + "<br/>"); // UserVO에 toString메서드가 있어서 내용물이 출력됨.
    // 4. user 내용물을 아래쪽 표현식에 getter로 넣어준다.
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body>
   <!-- update의 경우는 update_check.jsp로 자료를 보내야 하는데,
   보통 정보를 수정하는 경우는, 미리 회원정보가 form에 기입되어 있는 경우가 많다.
   먼저 폼 양식은, 아이디 없이 비밀번호는 비어있고, name, email은 DB에 있던 정보가 
   채워진 상태로 창이 열리게 만들기, 
   input태그 안에 value 속성을 이용하면 미리 채워질 값을 지정할 수 있다.  -->
   <h1>정보를 수정합니다.</h1>
   <form action="update_check.jsp" method="post">
      <input type="password" name="FPW" placeholder="비밀번호" required><br/>
      <input type="text" name="FNA" placeholder="이름" value="<%=user.getuName() %>" required><br/>
      <input type="email" name="FEM" placeholder="이메일" value="<%=user.getuEmail() %>" required><br/>
      <input type="submit" value="확인">
      <input type="reset" value="초기화">
   </form>
   
</body>
</html>