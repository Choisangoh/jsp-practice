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
   // 보낸 age를 받아서 정수로 바꿔서 저장
   String strAge = request.getParameter("age");
   int age = Integer.parseInt(strAge);   
   
   // age가 19세 이하 bus_junior.jsp
   // age가 20~59세 bus_adlut.jsp
   // age가 60세 이상이면 bus_senior.jsp
   // 으로 강제 이동하도록 조건문 작성
   if(age <= 19){
   response.sendRedirect("bus_junior.jsp");
   }else if(age >= 60){
   response.sendRedirect("bus_senior.jsp");
   }else{
   response.sendRedirect("bus_adult.jsp");
   }
   %>
</body>
</html>