<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JSP주석은 이렇게 작성한다.
JSP주석은 소스보기에 나타나지 않는다. --%>
<!-- html주석은 소스보기에 나타난다. -->

<%-- 선언부를 이용해서 함수 및 변수 만들기
변수는 celcius 라는 이름의 double형 변수로 만들고,
함수는 CtoF라는 이름의 double형 자료를 하나 입력받고,
double형 자료를 리턴하게 만들기.
celcius라는 함수는 오늘의 섭씨 온도로 초기화시켜주고,
스크립트릿을 이용해서 celcius를 파라미터로 넘겨서 CtoF 함수를 호출하고,
호출한 결과를 out.println()으로 화면에 표출시켜주기
화씨 -> 섭씨 공식
(화씨온도 - 32) / 1.8 = 섭씨온도 
--%>
<%!
double celcius = -3.0;
double CtoF(double celcius){
     return celcius * 1.8 + 32;
}
%>
<h1>오늘 현재 서울 온도</h1>
<%
out.println("섭씨 온도 : <b>" + celcius + "</b><br/>");
out.println("섭씨 온도 : <b>" + CtoF(celcius) + "</b>");
%>
</body>
</html>