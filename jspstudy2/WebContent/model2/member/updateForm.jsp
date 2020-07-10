<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function  inputcheck(f) {
<c:if test="${sessionScope.login != 'admin'}">	   
     if(f.pass.value == "") {
	   alert("��й�ȣ�� �Է��ϼ���");
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
			<caption>ȸ�� ���� ����</caption>
			<tr>
				<td rowspan="4" valign="bottom"><img
					src="picture/${mem.picture}" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">��������</a></font></td>
				<th>���̵�</th>
				<td><input type="text" name="id" readonly value="${mem.id}"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="radio" name="gender" value="1"
					<c:if test="${mem.gender == 1}">checked</c:if>>��
					 <input type="radio" name="gender" value="2"
					<c:if test="${mem.gender == 2}">checked</c:if>>��</td>
			</tr>
			<tr>
				<td>��ȭ��ȣ</td>
				<td colspan="2"><input type="text" name="tel"
					value="${mem.tel}"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td colspan="2"><input type="text" name="email"
					value="${mem.email}"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="ȸ������"> 
				<c:if test="${sessionScope.login != 'admin' || mem.id=='admin'}">
						<input type="button" value="��й�ȣ����" onclick="win_passchg()">
					</c:if></td>
			</tr>
		</table>
	</form>
</body>
</html>