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
�̸�:${param.name}<br>
����:${param.age}<br>
����:${param.gender == 1?"��":"��" }<br>
����⵵:${param.year}<br>
����:��${2020 - param.year}<br>