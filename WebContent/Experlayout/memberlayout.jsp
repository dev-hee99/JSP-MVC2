<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="login" value="${sessionScope.login}"/>
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="img/Exper.png">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
#bottom{position: fixed; bottom: 0; width: 100%; text-align:center;}
a { text-decoration:none; } 
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
 
<decorator:head/>
</head>
<!-- memberlayout -->
<body class="w3-light-grey w3-content" style="max-width:100%">

<!-- 상단바 -->
<div class="w3-top" style="width:100%;position:fixed;">
  <div class="w3-bar w3-grey w3-card">
    <a href="${path}/Expermember/main.do" class="w3-bar-item w3-button w3-wide" >Exper</a>
    <a href="${path}/Expermember/bodyreport.do" class="w3-bar-item w3-button w3-padding">신체기록</a> 
    <a href="${path}/Expermember/weightreport.do" class="w3-bar-item w3-button w3-padding">운동기록</a> 
    <a href="${path}/Expermember/exercisetip.do" class="w3-bar-item w3-button w3-padding">운동Tip</a>
   
    <!-- <a href="${path}/Experboard/ifmlist.do" class="w3-bar-item w3-button">정보공유</a> -->
    
    <a href="${path}/Expermember/video.do" class="w3-bar-item w3-button">운동영상</a>
    <!-- 오른쪽 메뉴 -->
    <div class="w3-right w3-hide-small">
      <a href="${path}/Expermember/tip.do" class="w3-bar-item w3-button">TIP</a>
      <c:if test="${!empty login && login ne 'admin'}">
      <a href="${path}/Expermember/mypage.do?email=${login}" class="w3-bar-item w3-button">Mypage</a>
      </c:if>
      <c:if test="${empty login}">
      <a href="${path}/Expermember/Explogin.do" class="w3-bar-item w3-button"><i class="fa fa-user"></i>로그인</a>
    </c:if>
    <c:if test="${!empty login}">
      <a href="${path}/Expermember/logout.do" class="w3-bar-item w3-button">로그아웃</a>
    </c:if>
    </div>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="side_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- 사이드바/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:0;width:250px;" id="mySidebar"><br>
  <div class="w3-container w3-border-grey">
	<c:if test="${!empty login  && login ne 'admin'}">
    <c:if test="${!empty sessionScope.picture}">
    <div class="w3-center" style="width:auto; height:120px;text-align:center">
    <img class="w3-circle" src="${path}/Expermember/picture/${sessionScope.picture}" style="width:120px;height:120px;"></div>
    </c:if>
    <c:if test="${empty sessionScope.picture}">
    <div class="w3-center" style="width:auto; height:120px;text-align:center">
    <img class="w3-circle" src="${path}/Expermember/img/user.png" style="width:120px;height:120px;"></div>
    </c:if>
    </c:if>
	<hr style="height:1px; width:auto; color:grey">
	
    <span style="float:left;">
    
	<c:if test="${!empty sessionScope.login}">
		<h6><i class="fa fa-person"></i>안녕하세요, ${sessionScope.name}님</h6>
		<p style="font-size:14px;"><i class="fa fa-envelope">&nbsp;${login}</i></p>
		<p style="font-size:14px;">게시물:&nbsp;&nbsp;${sessionScope.postcount}개</p><p style="font-size:14px;">&nbsp;&nbsp;댓글:&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.replycount}개</p>
	</c:if>
	</span>
  </div>
    <hr>
  <div class="w3-bar-block">
  <a href="${path}/Experboard/explist.do?btype=4" class="w3-bar-item w3-button w3-padding w3-text-teal">전체게시글보기(${sessionScope.postall})</a>
  <c:if test="${login eq 'admin'}">
    <a href="${path}/Expermember/memberlist.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>회원관리</a> 
    <a href="${path}/Experboard/explist.do?btype=1" class="w3-bar-item w3-button w3-padding"><img src=../icons/settings.png style="height:15px;weight:15px;margin-right:20px;">자유게시판 관리</a> 
    <a href="${path}/Experboard/explist.do?btype=0" class="w3-bar-item w3-button w3-padding"><img src=../icons/settings.png style="height:15px;weight:15px;margin-right:20px;">정보공유 관리</a>
    </c:if>
    <c:if test="${login ne 'admin'}">
    <a href="${path}/Experboard/explist.do?btype=1" class="w3-bar-item w3-button"><i class="fa fa-bars fa-fw w3-margin-right"></i>자유게시판</a>
  
  <div class="w3-dropdown-hover w3-bar-item" style="height:38px;width:auto;">
	<i class="fa fa-bars fa-fw w3-margin-right"></i>  정보공유
      <button class="w3-bar-item w3-button" title="정보공유" style="weight:150px;margin:auto;"></button>
           <div class="w3-dropdown-content w3-card-4 w3-bar-block w3-right">
           <ul>
				<li><a href="${path}/Experboard/explist.do?btype=2" class="w3-bar-item w3-button">운동</a></li>
             	<li><a href="${path}/Experboard/explist.do?btype=3" class="w3-bar-item w3-button">식단</a></li>
             	</ul>
         </div>
   </div>
    </c:if>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px; margin-top:40px;">

<decorator:body/>
</div>

  <div id="bottom" class="w3-grey w3-center w3-padding-23">Changhee kim</div>
<!-- End page content -->




</body>
<script>
function side_open() {
	  if (mySidebar.style.display === 'block') {
	    mySidebar.style.display = 'none';
	  } else {
	    mySidebar.style.display = 'block';
	  }
	}
</script>
</html>