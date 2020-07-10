<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/layout/layout.jsp --%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head /><%--요청페이지의 head 태그 내용. 단 title 태그부분제외 --%>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head>
<body>
<table>
	<tr><td colspan="3" align="right">
	빅데이터 플랫폼 개발자 양성 과정 2회차 모델2 프로그램 연습
	<span style="float:right;">
	<c:if test="${empty sessionScope.login}">
		<a href="${path}/model2/member/loginForm.me"> 로그인</a>
		<a href="${path}/model2/member/joinForm.me">회원가입</a></c:if>
	<c:if test="${!empty sessionScope.login}">
	${sessionScope.login}님이 로그인 하셨습니다.&nbsp;&nbsp;
		<a href="${path}/model2/member/logout.me">로그아웃</a>
		</c:if></span></td></tr>
		<tr><td width="15%" style="vertical-align:top">
		 <a href="${path}/model2/member/main.me">회원관리</a><br>
		 <a href="${path}/model2/board/list.do">게시판</a><br>
		 <a href="${path}/model2/chat/chatform.do">채팅</a><br>
		 </td><td colspan="2" style="text-align:left; vertical-align:top">
		 <decorator:body /></td></tr>
		 <tr><td colspan="3"> 구디아카데미 Since 2016</td></tr>
</table>
</body>
</html>