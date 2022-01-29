<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%!
      // Decalaration 내부에
      // 1~10범위의 난수를 리턴하는 메서드
      // int randomnumber() 선언하기
      int randomNumber(){
	  // 정수 1~10까지 발생시켜서 리턴하도록 로직 작성
	  int result = (int)(Math.random() * 10) + 1; 
	  return result;	  
   } 
      String randomColor(){
      // 33% 확률로 빨,노,파 나오도록
      double randomNum = Math.random();
      String result;
      if(randomNum < 0.33){
    	  result = "빨";
      } else if(randomNum < 0.66){
    	  result = "노";
      }
      else{
    	  result = "파";
      }
      return result;
      }
      
      // Declaration에 선언한 변수는 서버를 끄기 전까지는 값이 누적된다.
      // 서버가 켜지만 딱 한번 실행
      public int total = 0;
   %>
      <h3>오늘의 행운의 숫자와 행운의 색깔</h3>
      <p>행운의 숫자는 1~10 범위입니다.</p>
      <p>행운의 숫자 : <b><%= randomNumber() %></b></p>
      <p>색깔은 1/3 확률로 바뀝니다.(빨,노,파)</p>
      <p>행운의 색깔 : <b><%= randomColor() %></b></p>
      <h3>오늘의 방문자 수</h3>
      <%
         out.println(++total);
         // scritlet 내부에 선언한 변수는 접속시마다 초기화 된다.
         // 새로고침 할 때마다 실행되므로 0과1을 반복
         int currentNum = 0;
         out.println("<br/>");
         out.println(++currentNum);
      %>
</body>
</html>