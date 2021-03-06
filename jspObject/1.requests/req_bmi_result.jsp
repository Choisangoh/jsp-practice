<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- bmi 계산공식 [체중kg / 신장m * 신장m]
즉 175cm라면 실제 신장에 들어갈 값은 1.75m
*bmi지수가 23을 초과한다면 "체중조절을 하세요" 출력
나머지인 경우 "정상 체중입니다." 출력하되,
스크립트릿에 if문을 넣어서 선택적으로 결과가 나오도록

* form에서 전달되는 데이터는 무조건 문자열로 전달된다.
따라서 정수나 실수로 변환해야 하는데
String -> int, double
Integer.parseInt("문자열") ==> 문자열을 정수로
Double.parseDouble("문자열") ==> 문자열을 실수로 --%>
   <%
      String strCm = request.getParameter("height");
      String strKg = request.getParameter("weight");
      
      double cm = Double.parseDouble(strCm);
      double kg = Double.parseDouble(strKg);
      
      double bmi = kg / (cm/100 * cm/100);
   %>
   <h1>BMI 수치</h1>
   <hr>
   신장 : <%= strCm %>cm<br/>
   체중 : <%= strKg %>kg<br/>
   <br/>
   BMI : <b><%= bmi %></b><br/>
   
   <% if(bmi > 23) { %>
   <b>체중조절이 필요합니다.</b>
   <% }else if(bmi < 18.5){ %>
   <b>저체중입니다.</b>
   <% }else{ %>
   <b>정상 체중입니다.</b>
   <% } %>
   
</body>
</html>