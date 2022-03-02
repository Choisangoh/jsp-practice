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
   <c:forEach begin="1" end="9" step="1" var="hang">   
      4 * ${hang } = ${4 * hang }<br/>
   </c:forEach>
   <hr/>
   
   
   
   <!-- 중첩 forEach를 이용해서 2~9단까지 출력하기 -->
   <c:forEach begin="2" end="9" step="1" var="dan">
      <c:forEach begin="1" end="9" step="1" var="hang">
         ${dan } * ${hang } = ${dan * hang }<br/>
      </c:forEach>  
         <hr/>
   </c:forEach>
   <hr/>
   
   
   
   <h1>숫자가 아닌 요소를 반복하는 JSTL</h1>
   <%-- arr변수 내에 과일 5개 이름을 배열로 저장하는 구문 --%>
   <c:set var="arr" value='<%= new String[] {"사과","딸기","망고","포도","바나나"} %>'/>
   <%-- c:forEach는 향상된 for문처럼 쓸 수도 있다. --%>
   <c:forEach var="i" items="${arr }">
      ${i } &nbsp;
   </c:forEach>
   <!--
        String[] arr = {"사과","딸기","망고","포도","바나나"};
        for(String i : arr){
                out.println(i + "&nbsp;");
              }
    --> 
    
    
    
    <!-- int 배열에 10,20,30,40,50을 넣고
    c:forEach문을 이용해 화면에 출력하기, 변수명은 알아서 -->
     <c:set var="nums" value='<%= new int[]{10, 20, 30, 40, 50}%>'/>
     <c:forEach var="i" items="${nums }">
        ${i } &nbsp;
     </c:forEach>
    
</body>
</html>