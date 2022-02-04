<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가고싶은 여행지들</title>
</head>
<body>
<%-- form태그를 만들고, 목적지는 travel_check.jsp, post방식으로
라디오 버튼을 최소 4개 만들고, 각 라디오버튼에는 value= 해서 뭘 선택했는지 식별가능하도록
각 value 다르게 지정해서 만들기. submit 버튼도 하나 만들기. --%>
   <form action="travel_check.jsp" method="post">
      Paris<input type="radio" name="city" value="paris">
      London<input type="radio" name="city" value="london">
      NewYork<input type="radio" name="city" value="newyork">
      LA<input type="radio" name="city" value="la"> <hr>
      <input type="submit" value="여행가기">
   </form>
</body>
</html>