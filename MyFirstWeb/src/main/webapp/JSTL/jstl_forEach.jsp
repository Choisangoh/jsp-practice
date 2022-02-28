<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
       request.setCharacterEncoding("utf-8");       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%--
      int total = 0;
      for(int i=1; i<101; i++){
    	  total += i;
      }
      out.println("<h1>1부터 100까지 총합은 " + total);
   --%>
   
   <%-- begin 시작값, end 끝값(포함)  step 증가숫자, var 태그내에서 쓸 변수명 --%>
   <c:forEach begin="1" end="100" step="1" var="number">
      <c:set var="total" value="${total + number }"/>   
   </c:forEach>
   <h1>1~100까지의 누적합은 ${total }</h1>
   <hr/>
   
   <!-- forEach문을 이용해서 구구단 4단 출력하기 -->
   <c:forEach begin="1" end="9" step="1" var="dan">   
      4 * ${dan } = ${4 * dan }<br/>
   </c:forEach>
   <hr/>
   
   <!-- 중첩 forEach를 이용해서 2~9단까지 출력하기 -->
   
</body>
</html>