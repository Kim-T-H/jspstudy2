<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /WebContent/model1/member/info.jsp--%> 
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>회원 정보 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head><body>
<table><caption>회원 정보 보기</caption>
  <tr><td rowspan="6">
 <img src="picture/${mem.picture}" width="200" height="210"></td>
    <th>아이디</th><td>${mem.id}</td></tr>
   <tr><th>이름</th><td>${mem.name}</td></tr>
   <tr><th>성별</th><td>${mem.gender == 1?"남":"여"}</td></tr>
   <tr><th>전화</th><td>${mem.tel}</td></tr>
   <tr><th>이메일</th><td>${mem.email}</td></tr>
   <tr><td colspan="2">
     <a href="updateForm.me?id=${mem.id}">[수정]</a>
  <c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
     <a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
   </c:if></td></tr></table></body></html>