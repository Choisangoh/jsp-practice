<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   // 세션 모두 파기
   session.invalidate();
   
   // 로그인페이지로 리다이렉트
   response.sendRedirect("session_login.jsp");
   %>
</body>
</html>