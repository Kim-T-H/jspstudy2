<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/loginForm.jsp
  1. jspstudy1에서 src/model/ 패키지의 모든 파일 jspstudy2의 src/model/로 복사
  2. jspstudy1의 WebContent/model1/member, board 폴더의 모든 파일을
     jspstudy2의 WebContent/model2/ 복사.
  3. jspstudy1의 WebContent/WEB-INF/lib  폴더의 모든 파일을    
     jspstudy2의 WebContent/WEB-INF/lib  폴더에 파일을 복사
  4. jspstudy1의 WebContent/css 폴더를 복사하여
     jspstudy2의 WebContent/에 붙여넣기   
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="../../css/main.css" >
<script type="text/javascript">
   function inputcheck(f) {
	   if(f.id.value == '') {
		   alert("아이디를 입력하세요");
		   f.id.focus();
		   return false;
	   }
	   if(f.id.value.length < 4) {
		   alert("아이디는 4자리 이상 입력하세요");
		   f.id.focus();
		   return false;
	   }
	   if(f.pass.value == '') {
		   alert("비밀번호를 입력하세요");
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
<table><caption>로그인</caption>
<tr><th>아이디</th><td><input type="text" name="id" style="text-align:left; width:300px; height:10px;"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
  <input type="submit" value="로그인">
  <input type="button" value="회원가입" 
      onclick="location.href='joinForm.me'">
  <input type="button" value="아이디찾기"   onclick="win_open('idForm')">
  <input type="button" value="비밀번호찾기" onclick="win_open('pwForm')">      
</td></tr></table></form> </body></html>