<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- /WebContent/jstl/jstlcoreEx3.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl core 태그 : 반복문</title>
</head>
<body>
<h3>반복 관련 태그 : forEach</h3>
<c:forEach var="test" begin="1" end="10" step="2">
  ${test}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
<h3>forEach 태그를 이용하여 1부터 100까지 합 구하기</h3>
<c:forEach var="i" begin="1" end="100">
  <c:set var="sum" value="${sum+i}" />
</c:forEach>
1부터 100까지의 합: ${sum}<br>
<c:set var="sum" value="${0}" />
<h3>forEach 태그를 이용하여 1부터 100까지 짝수합 구하기</h3>
<c:forEach var="i" begin="0" end="100" step="2">
  <c:set var="sum" value="${sum+i}" />
</c:forEach>
1부터 100까지의 짝수합: ${sum}<br>
<c:set var="sum" value="${0}" />
<c:forEach var="i" begin="1" end="100" >
  <c:if test="${i%2==0}">
     <c:set var="sum" value="${sum+i}" />
  </c:if>
</c:forEach>
1부터 100까지의 짝수합: ${sum}<br>

<c:set var="sum" value="${0}" />
<h3>forEach 태그를 이용하여 1부터 100까지 홀수합 구하기</h3>
<c:forEach var="i" begin="1" end="100" step="2">
  <c:set var="sum" value="${sum+i}" />
</c:forEach>
1부터 100까지의 홀수합: ${sum}<br>
<c:set var="sum" value="${0}" />
<c:forEach var="i" begin="1" end="100" >
  <c:if test="${i%2!=0}">
     <c:set var="sum" value="${sum+i}" />
  </c:if>
</c:forEach>
1부터 100까지의 홀수합: ${sum}<br>

<h3>forEach 태그를 이용하여 구구단 출력하기</h3>
<c:forEach var="i" begin="2" end="9">
  <h4>${i }단</h4>
  <c:forEach var="j" begin="2" end="9">
     ${i} * ${j} = ${i*j}<br>
  </c:forEach>
</c:forEach>
<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<%
   List<Integer> list = new ArrayList<Integer>();
   for(int i=1;i<=10;i++) list.add(i*10);
   pageContext.setAttribute("list", list);
%>
<c:forEach var="i" items="${list}">
   ${i}&nbsp;&nbsp;
</c:forEach>

<c:forEach var="i" items="${list}" varStatus="stat">
  <c:if test="${stat.index==0}"><%-- 첫번째 요소? --%>
    <h4>forEach 태그의 varStatus 속성 연습</h4>
  </c:if>
   ${stat.count}:${i}&nbsp;&nbsp;
</c:forEach>
<h3>forEach 태그를 이용하여 Map 객체 출력하기</h3>
<%
   Map<String,Object> map = new HashMap<String,Object>();
   map.put("name","홍길동");
   map.put("today",new Date());
   map.put("age",20);
   pageContext.setAttribute("map",map);
%>
<c:forEach var="m" items="${map}" varStatus="stat">
  ${stat.count}:${m.key}=${m.value}<br>
</c:forEach>
<h3>map객체를 EL을 이용하여 출력하기</h3>
name=${map.name}<br>
today=${map.today}<br>
age=${map.age}<br>
<h3>forEach 태그를 이용하여 배열 객체 출력</h3>
<c:set var="arr" value="<%=new int[]{10,20,30,40,50}%>" />
<c:forEach var="a" items="${arr}" varStatus="stat">
   arr[${stat.index}]=${a }<br>
</c:forEach>
${arr[0]}<br>
${list[0]}<br>
<h3>forEach 태그를 이용하여 배열 객체의 두번째 요소부터 세번째 요소까지 출력</h3>
<c:forEach var="a" items="${arr}" varStatus="stat" begin="1" end="2">
   arr[${stat.index}]=${a }<br>
</c:forEach>
<h3>forEach 태그를 이용하여 배열 객체의 짝수 인덱스만 출력</h3>
<c:forEach var="a" items="${arr}" varStatus="stat" step="2">
   arr[${stat.index}]=${a }<br>
</c:forEach>
<h3>forEach 태그를 이용하여 배열 객체의 홀수 인덱스만 출력</h3>
<c:forEach var="a" items="${arr}" varStatus="stat" step="2" begin="1">
   arr[${stat.index}]=${a }<br>
</c:forEach>
</body>
</html>
