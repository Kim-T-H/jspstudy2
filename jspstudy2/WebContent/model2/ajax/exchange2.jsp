<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
date: 환율 기준 일자
map: 환율 정보 통화명으로 저장
 --%>

    <table class="w3-table-all"><caption>KEB하나은행(${date})</caption>
    <tr><th rowspan='2' style="vertical-align:middle">코드</th>
    	<th rowspan='2' style="vertical-align:middle">기준율</th>
    	<th colspan='2' class="w3-center">현찰</th></tr>
    	<tr><th>파실때</th><th>사실 때</th></tr>
    	<c:forEach var="m" items="${map}">
    	<tr><td class="w3-center"><${m.key}(${m.value[0]})</td>
    	<td>${m.value[1]}</td><td>${m.value[2]}</td><td>${m.value[3]}</td></tr>
    	</c:forEach>
    	
    
    </table>