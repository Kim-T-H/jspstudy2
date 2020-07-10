<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WenContent/jstl/jstlcoreEx2.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>core 태그 : 조건문 예제</title>
</head>
<body>
<h3>조건문 관련 태그 : if, choose 태그</h3>
<c:if test="${5 < 10 }">
  <h4>5는 10보다 작다</h4>
</c:if>
<% if(5 < 10) {%>
  <h4>5는 10보다 작다</h4>
<% } %>
<c:if test="${6+3 != 9 }">
  <h4>6+3은  9가 아니다</h4>
</c:if>
<c:choose>
  <c:when test="${5+10==25 }">
     <h4>5+10은  25다</h4>
  </c:when>
  <c:when test="${5+10==150 }">
     <h4>5+10은  15다</h4>
  </c:when>
  <c:when test="${5+10==510 }">
     <h4>5+10은  510이다</h4>
  </c:when>
  <c:otherwise>
     <h4>5+10은  모른다</h4>
  </c:otherwise>
</c:choose>
</body>
</html>