<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /WebContent/model2/member/main.jsp --%>   
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>ȸ�� ����</title></head>
<body>
<h3>${sessionScope.login}�� �α��� �Ǿ����ϴ�.</h3>
<h3><a href="logout.me">�α׾ƿ�</a></h3>
<h3><a href="info.me?id=${sessionScope.login}">ȸ����������</a></h3>
<c:if test="${sessionScope.login == 'admin'}">
<h3><a href="list.me">ȸ����� ����</a></h3>
</c:if>
</body></html>