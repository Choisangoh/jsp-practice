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
   // session은 form을 안쓰고도 다른 페이지로 데이터를 전송해줄 수 있는 수단이다.
   String NN = (String)session.getAttribute("nickname");
   String ID = (String)session.getAttribute("id");
   String PW = request.getParameter("pw");
   
   // 로그인 하지않은 사용자가 오면 login페이지로 리다이렉트
   if(ID == null){
	   response.sendRedirect("session_login.jsp");
   }
   %>
   <h1><%=NN %>(<%=ID %>)님 환영합니다.</h1>
   <a href="session_logout.jsp">로그아웃</a>
</body>
</html>