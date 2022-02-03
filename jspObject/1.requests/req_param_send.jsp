<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%-- 아래에 form을 만들고 내부에 input 4개 만들고,
   input태그의 type속성 하나는 text 하나는 password
   name속성은 하나는 apple, 하나는 banana로 만들고,
   reset버튼과 submit버튼도 하나씩 만들기. --%>
   <form action="req_param_getpost.jsp" method="get">
      <input type="text" name="apple" placeholder="apple"/><br/>
      <input type="password" name="banana" placeholder="banana"/><br/>
      
      취미 :
      <input type="checkbox" name="hobby" value="요리"> 요리&nbsp;
      <input type="checkbox" name="hobby" value="운동"> 운동&nbsp;
      <input type="checkbox" name="hobby" value="여행"> 여행&nbsp;
      <input type="checkbox" name="hobby" value="영화.드라마 시청"> 영화.드라마 시청&nbsp;
      <input type="checkbox" name="hobby" value="전시회.미술관 관람"> 전시회.미술관 관람&nbsp; <br/>
      
      
      전공 : (name, value는 각각 정하고, radio 4개를 작성)
      <input type="radio" name="major" value="soccer"> 축구&nbsp;
      <input type="radio" name="major" value="baseball"> 야구&nbsp;
      <input type="radio" name="major" value="basketbal"> 농구&nbsp;
       <input type="radio" name="major" value="acting"> 연기&nbsp; <br/>
      
      <input type="reset"/>
      <input type="submit"/>
   </form>
</body>
</html>