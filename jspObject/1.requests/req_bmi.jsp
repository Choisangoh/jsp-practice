<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 사용자의 키와 체중을 입력받아 BMI지수를 계산해 출력하는 
form 및 출력페이지 만들기 
1. 사용자의 입력값을 서버로 전송할 때는 form 태그를 사용
2. form의 action= 속성을 이용해 전달할 페이지 및 URL 지정 가능
3. input 태그에 name 속성으로 요청 자료를 부를 명칭을 정할 수 있다.
4. submit 버튼을 사용하면 action에 지정한 페이지로 자료가 전송된다.
--%>
   <form action="req_bmi_result.jsp" method="get">
      <input type="text" name="height" placeholder="키(cm)"/><br/>
      <input type="text" name="weight" placeholder="몸무게(kg)"/><br/>
      <input type="submit" value="확인"/>
   </form>
</body>
</html>