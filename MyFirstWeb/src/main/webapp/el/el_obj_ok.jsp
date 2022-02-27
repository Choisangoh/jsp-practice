<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String FN = request.getParameter("fname");
    String FNN = request.getParameter("fnickname");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   이름 <%=FN %><br/>
   별명 <%=FNN %><br/>
   --------------------------EL식 출력------------------------------<br/>
   ${param.FN }<br/>
   ${param.FNN }<br/>
</body>
</html>