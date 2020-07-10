<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/writeForm.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function inputcheck() {
	   f = document.f;
	   if(f.name.value=="") {
		   alert("글쓴이를 입력하세요");
		   f.name.focus();
		   return;
	   }
	   if(f.pass.value=="") {
		   alert("비밀번호를 입력하세요");
		   f.pass.focus();
		   return;
	   }
	   if(f.subject.value=="") {
		   alert("제목을 입력하세요");
		   f.subject.focus();
		   return;
	   }
	  /* if(f.content.value=="") {
		   alert("내용을 입력하세요");
		   f.content.focus();
		   return;
	  }
	  */ 
	   f.submit(); //form 객체에 submit 발생. 
   }
</script>
</head>
<body>
<form action="write.do" method="post" 
       enctype="multipart/form-data" name="f">
  <table>
   <caption>게시판 글쓰기</caption>
   <tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
   <tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
   <tr><td>제목</td><td><input type="text" name="subject"></td></tr>
   <tr><td>내용</td><td><textarea rows="15" name="content"  id="content1"></textarea></td></tr>
   <script>CKEDITOR.replace("content1", { filebrowserImageUploadUrl : "imgupload.do"})</script>
   <tr><td>첨부파일</td><td><input type="file" name="file1"></td></tr>
   <tr><td colspan="2">
     <a href="javascript:inputcheck()">[게시물등록]</a></td></tr>
  </table></form></body></html>