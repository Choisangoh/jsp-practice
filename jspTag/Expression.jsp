<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 하단에 선언부를 선언하고, double를 선언하는 areaCircle 메서드를 정의하고,
   이 메서드는 r 변수에 double타입으로 원주율을 입력받고,
   r의 제곱  * Math.PI(원주율)을 곱해 넓이를 리턴한다. -->
   <%!
      double areaCircle(double r){
	   return r * r * Math.PI;
   }
   %>
   
   <!-- scriptlet은 main method처럼 동작한다. -->
   <%
      String name = "짱구";
      int age = 9;
      /*
      out.println("이름 " + name + "<br/>");
      out.println("나이 " + age + "<br/>");
      out.println(areaCircle(2));
      */
   %>
   이름 - <%= name %><br/>
   나이 - <%= age %><br/>
   반지름 5인 원넓이 - <%= areaCircle(5) %>
</body>
</html>