<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   // 자바에서 import구문을 이용해 사용하던 클래스들은 JSP파일에서도 import구문을 써야한다.
   // 지시자(Directive)의 경우 <%@ % >사이에 시술하여
   // 문서자체에서 사용할 설정이나 옵션을 지정한다.
   
   Date date = new Date(); // 날짜 얻어오기
   
   List<String> names = new ArrayList<>();
   // 이름 4개 추가하기
   names.add("봄");
   names.add("여름");
   names.add("가을");
   names.add("겨울");
   
    out.println(names.toString() + "<br/>");
    out.println(names.get(3) + "<br/>");
    
    out.println(date.getDate() + "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>