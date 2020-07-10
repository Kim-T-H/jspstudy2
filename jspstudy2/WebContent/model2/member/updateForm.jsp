<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function  inputcheck(f) {
<c:if test="${sessionScope.login != 'admin'}">	   
     if(f.pass.value == "") {
	   alert("비밀번호를 입력하세요");
	   f.pass.focus();
	   return false;
     }
</c:if>	   
   }
   function win_passchg() {
	  var op = "width=500, height=250, left=50,top=150";
	  open("passwordForm.me","",op);
   }
   function win_upload(){
	   var op = "width=500,height=150,left=50, top=150";
	   open("pictureForm.jsp","",op);
   }
</script>
</head>
<body>
	<form action="update.me" name="f" method="post"
		onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="${mem.picture}">
		<table>
			<caption>회원 정보 수정</caption>
			<tr>
				<td rowspan="4" valign="bottom"><img
					src="picture/${mem.picture}" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">사진수정</a></font></td>
				<th>아이디</th>
				<td><input type="text" name="id" readonly value="${mem.id}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="1"
					<c:if test="${mem.gender == 1}">checked</c:if>>남
					 <input type="radio" name="gender" value="2"
					<c:if test="${mem.gender == 2}">checked</c:if>>여</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td colspan="2"><input type="text" name="tel"
					value="${mem.tel}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2"><input type="text" name="email"
					value="${mem.email}"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원수정"> 
				<c:if test="${sessionScope.login != 'admin' || mem.id=='admin'}">
						<input type="button" value="비밀번호수정" onclick="win_passchg()">
					</c:if></td>
			</tr>
		</table>
	</form>
</body>
</html>