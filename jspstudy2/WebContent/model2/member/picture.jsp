<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/picture.jsp--%>
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/${fname}";  //opener â�� �̹����� ������.
   opener.document.f.picture.value="${fname}"; //hidden �±�. �Ķ���Ͱ�����
   self.close();
</script>