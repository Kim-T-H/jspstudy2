<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/calc.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>모델2 연습</title></head>
<body><form action="calc.me" method="post">
   <input type="text" name="num1" value="${param.num1}" size="5">
   <select name="op"><option>+</option><option>-</option>
                     <option>*</option><option>/</option></select>
   <script type="text/javascript">
      var op = '${param.op}';
      if(op == '') op = "+"
      document.forms[0].op.value=op;</script>
   <input type="text" name="num2" value="${param.num2}" size="5">
   <input type="submit" value="=">
   <input type="text" name="result" value="${result}"  size="5">
</form></body></html>