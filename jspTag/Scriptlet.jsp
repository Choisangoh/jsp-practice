<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 스크립트릿 내부에는 자바 코드를 작성할 수 있으며,
    이 코드를 반영해 페이가 구성된다. -->
<% for(int i=0; i<3; i++){ %>
   <h2>반복문 테스트1</h2>
   <p>
   반복이 잘 된다.
   </p>
<% } %>

   <!-- 구구단 코드 작성하고,
   System.out.println()이 괄호 내 구문을 콘솔에 찍히게 해줬다면
   out.println()은 html화면에 괄호 내 구문을 콘솔에 찍히게 해준다.
   (javascript의 document.write()와 같은 역할)-->
   <h2>구구단 2단</h2>
   <% for(int j=1; j<10; j++){ 
   out.println("2 * " + j + "= " +(2 * j) + "<br/>"); } %>
   
   <h2>구구단 3~9단</h2>
   <% for(int a=3; a<10; a++){
	   out.println("<h1>" + a + "단</h1>");
	   for(int b=1; b<10; b++){
		   out.println(a + " * " + b + "= " +(a * b) + "<br/>");
	   }} %>
</body>
</html>