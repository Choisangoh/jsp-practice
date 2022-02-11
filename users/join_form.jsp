<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 페이지</h1>
   <form action="join_check.jsp" method="post">
      <input type="text" name="Fid" placeholder="아이디" required><br/>
      <input type="password" name="Fpw" placeholder="비밀번호" required ><br/>
      <input type="text" name="Fname" placeholder="이름" required ><br/>
      <input type="email" name="Femail" placeholder="이메일" ><br/>
      <input type="submit" value="가입하기" >
      <input type="reset" value="초기화" >
   </form>
</body>
</html>