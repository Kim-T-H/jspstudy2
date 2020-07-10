<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>
<script type="text/javascript">
function win_open(page) {
	   var op = "width=200, height=150, left=50,top=150";
	   open(page+".me","",op);
}
</script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<decorator:head />
</head>
<body class="w3-black">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  <c:if test="${empty sessionScope.login }">
  	<a href="${path}/model2/member/loginForm.me" class="w3-bar-item w3-button w3-padding-large w3-black">
  	<p>Login</p>
  	</a>
  	<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black" onclick="win_open('joinForm')">
  	<p>Sign up</p>
  	</a>
  	<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black" onclick="window.open('${path}/model2/member/idForm.me','width=200','height=150','left=50','top=150')">
  	<p>Find id</p>
  	</a>
  	<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black" onclick="window.open('${path}/model2/member/pwForm.me','width=200','height=150','left=50','top=150')">
  	<p>Find password</p>
  	</a>
  </c:if>
  <c:if test="${!empty sessionScope.login }">
  		<c:if test="${!empty sessionScope.pic}">
  			<img src="${path }/model2/member/picture/${sessionScope.pic}" width="100" height="150">
  		</c:if>
  		<c:if test="${empty sessionScope.pic}">
  			<img src="${path }/model2/member/picture/null.jpg" width="100" height="150">
  		</c:if>
		${sessionScope.login }님&nbsp;&nbsp;&nbsp;<br>
		<a href="${path }/model2/member/logout.me">로그아웃</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </c:if>
  
  <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>HOME</p>
  </a>
  <a href="${path}/model2/member/info.me?id=${sessionScope.login }" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>MYPROFILE</p>
  </a>
  <a href="${path}/model2/board/list.do" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>BOARD</p>
  </a>
  <a href="${path}/model2/chat/chatForm.do" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-envelope w3-xxlarge"></i>
    <p>CHAT</p>
  </a>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="#body" class="w3-bar-item w3-button" style="width:25% !important">HOME</a>
    <a href="#body" class="w3-bar-item w3-button" style="width:25% !important">BOARD</a>
  </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
<%-- <c:if test="${empty sessionScope.login}"> --%>
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home" style="width:100%">
    <div id="piecontainer" style="width: 40%; float:left; border : 1px solid white">
    	<canvas id="canvas1" style="width:100%;"></canvas>
    </div>
    <div id="barcontainer" style="width: 40%; float:right; border : 1px solid white">
    	<canvas id="canvas2" style="width:100%;"></canvas>
    </div>
  </header>
<%-- </c:if> --%>
  <!-- body Section -->
  <div class="w3-content w3-justify w3-text-grey w3-padding-64" id="body">
  	<decorator:body />
  </div>
  
    <!-- Footer -->
  <footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">
    <p class="w3-medium">빅데이터 플랫폼 개발자 양성 과정 2회차 모델2 프로그램 연습</p>
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
    <p class="w3-medium">구디 아카데미 <a href="https://www.goodee.co.kr" target="_blank" class="w3-hover-text-green">(주)구디아카데미</a></p>
  <!-- End footer -->
  </footer>

<!-- END PAGE CONTENT -->
</div>
<script type="text/javascript">
	var randomColorFactor = function() {
		return Math.round(Math.random()*255);
	}
	var randomColor = function(opacity) {	//opacity : 투명도
		return "rgba(" + randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ (opacity || '.3') + ")";
	};
	$(function() {
		graphs();
	})
	function graphs() {
		$.ajax("${path}/model2/ajax/graph.do", {
			success : function(data) {
				pieGraphPrint(data);
				barGraphPrint(data);
			},
			error : function(e) {
				alert("서버 오류" : e.status);
			}
		})
	}
	function pieGraphPrint(data) {
		console.log(data)
		var rows = JSON.parse(data)
		var names = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item) {
			names[index] = item.name;
			datas[index] = item.cnt;
			colors[index] = randomColor(1);
		})
		var config = {
			type : 'pie',
			data : {
				datasets : [{
					data : datas,
					backgroundColor : colors
				}],
				labels : names
			},
			options : {
				responsive : true,
				legend : {position : 'top'},
				title : {
					display : true,
					text : '글쓴이별 게시판 등록 건수',
					position : 'bottom'
				}
			}
		}
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx, config);
	}
	function barGraphPrint(data) {
		
	}
</script>
</body>
</html>
