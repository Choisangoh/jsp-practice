<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 세션에 저장된 정보를 확인해
    // ID님 접속을 환영합니다. 라고 안내해주는 화면 만들기
    // 추후 여기에는 탈퇴하기, 가입하기, 정보수정하기 버튼 추가할 예정
    String sId = (String)session.getAttribute("session_id");
    
    // 세션영역에 저장되지 않은것을 호출하면 null이 나온다.

    // 로그인 안 된 사용자가 여기로 접근하면 로그인페이지로 보내기
    if(sId == null){
	   response.sendRedirect("login_form.jsp");
   }

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1><%=sId %>님 환영합니다.</h1>
   
   <a href="login_update.jsp">정보수정</a><br/>
   <a href="logout.jsp">로그아웃</a><br/>
   <a href="member_out.jsp">탈퇴하기</a><br/>
   <a href="user_list2.jsp">회원목록</a><br/>
</body>
</html>