<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="http://localhost:8181/MyFirstWeb/insertBoard" method="post">
      <input type="text" name="title" placeholder="제목 입력" required><br/>
      <input type="text" name="writer" placeholder="글쓴이 입력" required><br/>
      <textarea rows="30" cols="30" name="content"placeholder="내용 입력" required></textarea><br/>
      <input type="submit" value="글쓰기">
      <input type="reset" value="초기화">    
   </form>
</body>
</html>