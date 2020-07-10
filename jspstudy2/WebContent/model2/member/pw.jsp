<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String id = request.getParameter("id");
   String email = request.getParameter("email");
   String tel = request.getParameter("tel");
   MemberDao dao = new MemberDao();
   String pass = dao.pwSearch(id,email,tel); 
   if(pass != null) {
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript">
   function pwclose() {
	   self.close();
   }
</script>
</head>
<body>
<table>
  <tr><th>비밀번호</th>
    <td><%="**"+pass.substring(2,pass.length()) %></td>
  </tr>
  <tr><td colspan="2">
     <input type="button" value="닫기" onclick="pwclose()">
  </td>
  </tr>
</table>
</body>
<% }  else { %>
<script>
   alert("정보에 맞는 비밀번호를 찾을 수 없습니다.");
   location.href="pwForm.jsp";
</script>
<% } %>
</html>