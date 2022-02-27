<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 목적지가 "el_obj_ok.jsp"인 폼 만들기
   이름과 별명 넘기기,제출버튼을 눌러 넘어가게 하기 -->

   <!-- el_ohj_ok.jsp에는 폼에서 보낸 데이터를 받아서 
   body태그내에 표현식을 이용해 el_obj.jsp에서 보낸자료를 표출하기 -->
   <form action="el_obj_ok.jsp" method="post">
      <input type="text" name="fname" placeholder="이름"><br/>
      <input type="text" name="fnickname" placeholder="별명"><br/>
      <input type="submit" value="제출">
      <input type="reset" value="초기화">
   </form>
</body>
</html>