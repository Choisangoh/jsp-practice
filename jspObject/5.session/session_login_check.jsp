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
   // 한글 데이터가 꺠지지않게 인코딩 설정 바꾸기
   request.setCharacterEncoding("utf-8");
   
   // form에서 보낸 데이터 받아오기
   String ID = request.getParameter("id");
   String PW = request.getParameter("pw");
   String NN = request.getParameter("nickname");
   
   String LC = (String)session.getAttribute("id");
   if(LC != null){
	   response.sendRedirect("session_welcome.jsp");
   }
   
   // if문으로 로그인 로직 작성
   if(ID.equals("kkk1234") && PW.equals("1111")){
	   session.setAttribute("id", ID);
	   session.setAttribute("pw", PW);
	   session.setAttribute("nickname", NN);
	   response.sendRedirect("session_welcome.jsp");
   }
   %>
   <a href="session_login.jsp">로그인에 실패했습니다. 로그인창으로 돌아가기</a>
</body>
</html>