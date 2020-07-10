<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/id.jsp --%>    
<%
   String email = request.getParameter("email");
   String tel = request.getParameter("tel");
   MemberDao dao = new MemberDao();
   String id = dao.idSearch(email,tel); 
   if(id != null) { //id 찾은 경우
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id찾기</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript">
   function idsend(id) {
	   opener.document.f.id.value=id;
	   self.close();
   }
</script>
</head>
<body>
<table><tr><th>아이디</th>
    <td><%=id.substring(0,id.length()-2)+"**" %></td></tr>
  <tr><td colspan="2">
     <input type="button" value="아이디전송" 
    onclick="idsend('<%=id.substring(0,id.length()-2)%>')"></td></tr>
</table></body></html>
<% }  else { //id 찾을 수 없는 경우%>
<script>
   alert("정보에 맞는 id를 찾을 수 없습니다.");
   location.href="idForm.jsp";
</script>
<% } %>