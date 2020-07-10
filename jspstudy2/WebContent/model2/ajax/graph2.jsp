<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%--	/WebContent/model2/ajax/graph2.jsp --%>
[
<c:forEach var = "map" items="${list}" varStatus="stat1">
	<c:forEach var="m" items="${map}" varStatus="stat2">
	<c:if test="${m.key == 'regdate'}">{</c:if>
	<c:if test="${m.key != 'regdate'}">,</c:if>
	"${m.key }":"${m.value}"
	<c:if test="${m.key != 'regdate'}">}</c:if>
	</c:forEach>
	<c:if test="${stat1.count <list.size() }">,</c:if>
	</c:forEach>

]
