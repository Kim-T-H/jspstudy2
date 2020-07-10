<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head><meta charset="EUC-KR">
<title>Insert title here</title></head>
<body>
<form action="test2.jsp" method="post">
   이름:<input type="text" name="name"><br>
   나이:<input type="text" name="age"><br>
   성별:<input type="radio" name="gender" value="1">남
     <input type="radio" name="gender" value="2">여<br>
 출생연도 : <select name="year">
  <% for (int i=1980;i<2000;i++) { %>
     <option><%=i %></option>
  <% } %></select><br>
 출생연도2 : <select name="year2">
<c:forEach var="i" begin="1980" end="1999" >
     <option>${i}</option>
</c:forEach></select><br>
  <input type="submit" value="전송"></form></body></html>
</body>
</html>