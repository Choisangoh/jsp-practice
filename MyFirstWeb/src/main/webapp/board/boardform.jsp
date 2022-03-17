<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    <c:if test="${sId eq null }">
    	<%
    	response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do");
    	%>
    </c:if>
<!DOCTYPE html>
<html>
<head>
   <c:if test="${sessionScope.session_id eq null }">
   		<script>
   			location.href="http://localhost/MyFirstWeb/boardList.do";
   		</script>
   </c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="http://localhost:8181/MyFirstWeb/insertBoard.do" method="post">
      <input type="text" name="title" placeholder="제목 입력" required><br/>
      <input type="text" name="writer" value="${sId }" readonly><br/>
      <textarea rows="30" cols="30" name="content"placeholder="내용 입력" required></textarea><br/>
      <input type="submit" value="글쓰기">
      <input type="reset" value="초기화">    
   </form>
</body>
</html>