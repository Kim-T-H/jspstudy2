<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
이름:${param.name}<br>
나이:${param.age}<br>
성별:${param.gender == 1?"남":"여" }<br>
출생년도:${param.year}<br>
나이:만${2020 - param.year}<br>
