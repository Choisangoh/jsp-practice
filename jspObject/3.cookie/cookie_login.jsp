<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // auto login 관련해서 발급된 쿠키가 있는지 체크해서 쿠키가 있다면
    // 로그인 창 대신에 바로 welcome페이지로 보내주기
    // cookie_check.jsp 자료 참고
    
      // 저장된 쿠키 가져오기
      Cookie[] cookies = request.getCookies();     
      String autoLogin = null;           
      //향상된 for문으로도 처리 가능
      for(Cookie cookie : cookies){
    	  autoLogin = cookie.getName();    	  
    	  System.out.println(autoLogin);
    	  // null값이 들어왔을떄 바로 equals를 쓰면 500에러 발생
    	  // short circuit를 이용해서 null이 아닌 경우만 equals를 실행하도록 조건식 작성
    	  if(autoLogin != null && autoLogin.equals("auto_login")){
    	     // cookie_welcome 페이지로 리다이렉트
    	     response.sendRedirect("cookie_welcome.jsp");   		  
    	  }
      }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인창은 form으로 구성하고,
input text 1개(유저 아이디 입력), input password 1개(비밀번호 입력),
input checkbox 1개(자동로그인)
목적지는 cookie_login_ok.jsp -->
   <form action="cookie_login_ok.jsp" method="post">
      <input type="text" name="id" placeholder="아이디"/><br/>
      <input type="password" name="pw" placeholder="비밀번호"/><br/>
      자동로그인<input type="checkbox" name="auto" value="checked"/><br/>
      <input type="submit" value="로그인"/>
      <input type="reset" value="초기화"/>
   </form>
   
</body>
</html>