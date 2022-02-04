<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      // form을 통해 전달된 데이터가 무엇인지 감지해서 
      // if~else if문을 이용해 travel_도시명_jsp로 리다이렉트 시켜준다.
      // travel_도시명.jsp 내부에는 유튜브에서 얻어온 관련 영상이 나오도록 만들기.
      
      
      // radio는 여러 대상 중 하나만 선택이 가능해서
      // 데이터가 무조건 하나만 넘어오는것이 담보된다.
      String CityName = request.getParameter("city");
   
   
      // CityName으로 각 4개의 city들을 비교한다.
      if(CityName.equals("paris")){
    	  response.sendRedirect("travel_paris.jsp");
      }else if(CityName.equals("london")){
    	  response.sendRedirect("travel_london.jsp");
      }else if(CityName.equals("newyork")){
          response.sendRedirect("travel_newyork.jsp");
      }else if(CityName.equals("la")){
          response.sendRedirect("travel_la.jsp");
      }
   %>
</body>
</html>