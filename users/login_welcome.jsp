<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 세션에 저장된 정보를 확인해
    // ID님 접속을 환영합니다. 라고 안내해주는 화면 만들기
    // 추후 여기에는 탈퇴하기, 가입하기, 정보수정하기 버튼 추가할 예정
    String sId = (String)session.getAttribute("session_id");
   
    // 로그인 안 된 사용자가 여기로 접근하면 로그인페이지로 보내기
    if(sId == null){
	   response.sendRedirect("login_check.jsp");
   }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1><%=sId %>님 환영합니다.</h1>
   <a href="#">정보수정</a><br/>
   <a href="logout.jsp">로그아웃</a><br/>
   <a href="#">탈퇴하기</a><br/>
</body>
</html>
