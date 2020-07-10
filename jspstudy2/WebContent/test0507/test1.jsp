<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl을 이용한 간단한 연산</title>
</head>
<body>
<form method="post" name="f">
  x:<input type="text" name="x" value="${param.x}" size="5">
  <select name="op">
     <option>+</option><option>-</option>
     <option>*</option><option>/</option>
  </select>
  <script>
       var op = '${param.op}'
       if(op == '') op = '+';
       document.f.op.value= op;
  </script>
  y:<input type="text" name="y" value="${param.y}" size="5">
  <input type="submit" value="=">
</form>
<h3>${param.x} ${param.op} ${param.y}  
<c:choose>
  <c:when test="${param.op == '+'}">
    =${param.x + param.y}
  </c:when>
  <c:when test="${param.op == '-'}">
    =${param.x - param.y}
  </c:when>
  <c:when test="${param.op == '*'}">
    =${param.x * param.y}
  </c:when>
  <c:when test="${param.op == '/'}">
    =${param.x / param.y}
  </c:when></c:choose></h3></body></html>