<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /WebContent/model1/member/info.jsp--%> 
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head><body>
<table><caption>ȸ�� ���� ����</caption>
  <tr><td rowspan="6">
 <img src="picture/${mem.picture}" width="200" height="210"></td>
    <th>���̵�</th><td>${mem.id}</td></tr>
   <tr><th>�̸�</th><td>${mem.name}</td></tr>
   <tr><th>����</th><td>${mem.gender == 1?"��":"��"}</td></tr>
   <tr><th>��ȭ</th><td>${mem.tel}</td></tr>
   <tr><th>�̸���</th><td>${mem.email}</td></tr>
   <tr><td colspan="2">
     <a href="updateForm.me?id=${mem.id}">[����]</a>
  <c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
     <a href="deleteForm.me?id=${mem.id}">[Ż��]</a>
   </c:if></td></tr></table></body></html>