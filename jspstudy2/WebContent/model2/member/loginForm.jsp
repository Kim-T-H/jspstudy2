<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/loginForm.jsp
  1. jspstudy1���� src/model/ ��Ű���� ��� ���� jspstudy2�� src/model/�� ����
  2. jspstudy1�� WebContent/model1/member, board ������ ��� ������
     jspstudy2�� WebContent/model2/ ����.
  3. jspstudy1�� WebContent/WEB-INF/lib  ������ ��� ������    
     jspstudy2�� WebContent/WEB-INF/lib  ������ ������ ����
  4. jspstudy1�� WebContent/css ������ �����Ͽ�
     jspstudy2�� WebContent/�� �ٿ��ֱ�   
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css" >
<script type="text/javascript">
   function inputcheck(f) {
	   if(f.id.value == '') {
		   alert("���̵� �Է��ϼ���");
		   f.id.focus();
		   return false;
	   }
	   if(f.id.value.length < 4) {
		   alert("���̵�� 4�ڸ� �̻� �Է��ϼ���");
		   f.id.focus();
		   return false;
	   }
	   if(f.pass.value == '') {
		   alert("��й�ȣ�� �Է��ϼ���");
		   f.pass.focus();
		   return false;
	   }
	   return true;
   }
   function win_open(page) {
	   var op = "width=500, height=350, left=50,top=150";
	   open(page+".me","",op);
   }
</script>
</head>
<body>
<form action="login.me" method="post" name="f" 
                     onsubmit="return inputcheck(this)">
<table><caption>�α���</caption>
<tr><th>���̵�</th><td><input type="text" name="id" style="text-align:left; width:300px; height:10px;"></td></tr>
<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
  <input type="submit" value="�α���">
  <input type="button" value="ȸ������" 
      onclick="location.href='joinForm.me'">
  <input type="button" value="���̵�ã��"   onclick="win_open('idForm')">
  <input type="button" value="��й�ȣã��" onclick="win_open('pwForm')">      
</td></tr></table></form> </body></html>