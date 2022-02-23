<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String sId = (String)session.getAttribute("session_id");
    if(sId != null){
	    response.sendRedirect("login_welcome.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 창</h1>
   <form action="login_check.jsp" method="post">
       <input type="text" name="Fid" placeholder="아이디" required><br/>
       <input type="password" name="Fpw" placeholder="비밀번호" required ><br/>
       <input type="submit" value="로그인" >
       <input type="reset" value="초기화" >
   </form>
   <a href="join_form.jsp">회원가입</a>
</body>
</html>