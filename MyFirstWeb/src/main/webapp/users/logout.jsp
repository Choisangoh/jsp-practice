<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 세션 파기후 login_form.jsp로 보내기, 
login_form.jsp도 만약 로그인한 사용자가 접근하면 웰컴페이지로 보내지도록 -->
   <%
	  // 세션 모두 파기하기
	  session.invalidate();
	   
	  // 로그인페이지로 리다이렉트
	  response.sendRedirect("login_form.jsp");	  
   %>
</body>
</html>