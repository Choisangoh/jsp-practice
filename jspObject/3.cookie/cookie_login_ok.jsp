<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // form에서 날아온 데이터들을 저장
    String userId = request.getParameter("id");
    String userPw = request.getParameter("pw");
    String autoLogin = request.getParameter("auto"); // "checked"
    System.out.println(autoLogin);
    
    // 아이디는 abc1234이고, 비밀번호는 aaa1111인 경우 로그인을 허용
    if(userId.equals("abc1234") && userPw.equals("aaa1111")){
       // 쿠키는 로그인 성공한 경우에 발급해야한다.
       if(autoLogin != null){
    	  // 만약 자동로그인설정이 되어있다면 쿠키를 생성하고
    	  // cookie name값은 "auto_login" value값은 전달받은 아이디로 
    	  Cookie auto = new Cookie("auto_login", userId);
    	  // 쿠키 유효시간 50초
    	  auto.setMaxAge(50);
    	  // 쿠키는 생성했으면 발급처리까지 해야함
    	  response.addCookie(auto);
       }
       // 쿠키가 생성되었건 말건 cookie_welcome.jsp로 리다이렉트 시켜준다.
       // 쿠키 발급 여부와 상관없이 로그인에 성공했으므로 웰컴페이지로 이동
       response.sendRedirect("cookie_welcome.jsp");
    }
    // 만약 로그인에 실패했다면 body태그내에
    // "로그인에 실패했습니다." 라는 문구와 함께
    // a태그를 이용해서 로그인화면으로 돌아가는 로직을 대신 볼 수 있도록 처리
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>로그인에 실패했습니다.</h2>
   <a href="cookie_login.jsp">로그인화면으로 돌아가기</a>
</body>
</html>