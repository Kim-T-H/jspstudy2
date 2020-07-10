<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/picture.jsp--%>
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/${fname}";  //opener 창에 이미지가 보여짐.
   opener.document.f.picture.value="${fname}"; //hidden 태그. 파라미터값설정
   self.close();
</script>