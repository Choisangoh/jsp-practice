<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- servlet으로 보내기 위해서는 action에 servlet 접속 url 작성-->
   <form action="http://localhost:8181/MyFirstWeb/visit" method="get">
      <input type="text" name="jsp" placeholder="jsp"><br/>
      <input type="text" name="boot" placeholder="boot"><br/>
      <input type="text" name="jpa" placeholder="jpa"><br/>
      <input type="submit" value="제출">
   </form>
</body>
</html>