<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- jstl_if를 목적지로 하는 폼을 만들어서 입력한 요소를 전달하도록 폼 코드 작성 -->
   <form action="jstl_if.jsp" method="post">
      <input type="text" name="name" placeholder="이름"><br/>
      <input type="submit" value="제출">
   </form>
</body>
</html>