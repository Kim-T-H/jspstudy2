<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%-- /WebContent/test0508/requestex1.jsp--%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>전송된 파라미터 정보</title>
</head><body>
<f:requestEncoding value="euc-kr"/>
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : ${param.gender == 1?"남":"여"}<br>
취미 : ${param.hobby}<br>
출생년도 : ${param.year}<br>
<h3>취미 정보 모두 조회하기</h3>
취미 :
<c:forEach var="h" items="${paramValues.hobby}">
 ${h}&nbsp;&nbsp;
</c:forEach>
<h3>모든 파라미터 정보 조회하기</h3>
<table><tr><th>파라미터이름</th><th>파라미터값</th></tr>
<c:forEach var="p" items="${paramValues}">
<tr><td>${p.key}</td>
    <td><c:forEach var="v" items="${p.value}">
       ${v}&nbsp;&nbsp;
       </c:forEach>
    </td></tr>   
</c:forEach>
    </table>
</body></html>