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
      // post방식으로 전송된 한글이 꺠지는 경우에는 아래 코드로 인코딩하면된다.
      request.setCharacterEncoding("utf-8");

      String ID = request.getParameter("id");
      String PW = request.getParameter("password");
      String NAME = request.getParameter("name");
      String AGE = request.getParameter("age");
 %>
 <h1>회원가입 창</h1>
 <hr>
 <%  if(ID.equals("abcd")){ %>
 <b>이미 사용중인 아이디입니다. 다른 아이디로 회원가입하세요.</b> 
 <% }else{ %>
 <b><%= ID %>(<%= NAME %>)님 회원가입을 축하드립니다.</b>
 <% } %><hr/>
 <a href="req_login_form.jsp"><b>로그인하러가기</b></a>
</body>
</html>