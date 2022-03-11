<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${boardList }
	<hr/>
	<!-- 출력방법 : 인덱싱이나 c:forEach를 이용해서 하나하나 꺼내준 다음
	.변수명 을 적으면 출력됩니다. -->	
	
	<table class="table table-hover">
	 <thead>
		  <tr>
			  <th>글번호</th>
			  <th>글제목</th>
			  <th>글쓴이</th>
		      <th>작성날짜</th>
			  <th>최종수정날짜</th>
			  <th>조회수</th>
	      </tr>
     </thead>
     <tbody>
       <c:forEach var="board" items="${boardList }">
	      <tr>
	        <td>${board.board_num }<td/>
	        <td><a href="http://localhost:8181/MyFirstWeb/boarddetail?board_num=${board.board_num }">${board.title }</a><td/>
	        <td>${board.writer }<td/>
	        <td>${board.bDate }<td/>
	        <td>${board.mDate }<td/>
	        <td>${board.hit }<td/>
	      </tr>
	    </c:forEach>
     </tbody>
	</table>
	<form action="http://localhost:8181/MyFirstWeb/boardinsertform">
	<input type="submit" value="글쓰기">
	</form>
	
	
</body>
</html>