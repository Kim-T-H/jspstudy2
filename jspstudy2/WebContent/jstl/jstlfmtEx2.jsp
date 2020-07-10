<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jstl/jstlfmtEx2.jsp --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html><head>
<meta charset="EUC-KR">
<title>형식 관련 태그 예제 2</title></head>
<body>
<h3>Format 된 숫자를 일반 숫자로 변경</h3>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
합:${num1 + num2 }<br>
합:<fmt:formatNumber value="${num1 + num2 }"  pattern="##,###"/><br>
합:<fmt:formatNumber value="${num1 + num2 }" 
                     pattern="##,###" var="num3"/><br>
합: ${num3}
<h3>Format 된 날짜를 일반 날짜로 변경</h3>
<fmt:parseDate value="2020-05-08 12:00:00" 
    pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
날짜 : ${day}<br>                         
<h3>문제:2020-05-09의 요일을 출력하기</h3>
<fmt:parseDate value="2020-05-09" pattern="yyyy-MM-dd" var="test"/>
<fmt:formatDate value="${test}" pattern="yyyy-MM-dd E요일"/>
</body></html>