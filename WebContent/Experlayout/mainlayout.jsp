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

</style>
<style type="text/css"> 
</style> 
<decorator:head/>

</head>
<!-- mainlayout.jsp -->
<body class="w3-light-white w3-content" style="max-width:100%; max-height:100%;">

<!-- 상단바 -->
<div class="w3-top" style="width:100%; position:fixed;">
  <div class="w3-bar w3-white w3-card">
    <a href="${path}/Expermember/main.do" class="w3-bar-item w3-button w3-wide">Exper</a>
    <a href="${path}/Experboard/explist.do?btype=1" class="w3-bar-item w3-button">자유게시판</a>
      <div class="w3-dropdown-hover w3-bar-item w3-button" style="height:38px;width:92px;">
	  정보공유
      <button class="w3-bar-item w3-button" title="정보공유" style="top:50%;left:50%; margin:auto;"></button>
           <div class="w3-dropdown-content w3-card-4 w3-bar-block w3-right">
           <ul>
				<li><a href="${path}/Experboard/explist.do?btype=2" class="w3-bar-item w3-button">운동</a></li>
             	<li><a href="${path}/Experboard/explist.do?btype=3" class="w3-bar-item w3-button">식단</a></li>
             	</ul>
         </div>
   </div>
    <a href="${path}/Expermember/video.do" class="w3-bar-item w3-button">운동영상</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <a href="${path}/Expermember/tip.do" class="w3-bar-item w3-button">TIP</a>
      <c:if test="${!empty login && login ne 'admin'}">
      <a href="${path}/Expermember/mypage.do?email=${login}" class="w3-bar-item w3-button">Mypage</a>
      </c:if>
      <c:if test="${login eq 'admin'}">
      <a href="${path}/Expermember/memberlist.do" class="w3-bar-item w3-button">회원관리</a>
      </c:if>
      <c:if test="${empty login}">
      <a href="${path}/Expermember/Explogin.do" class="w3-bar-item w3-button"><i class="fa fa-user"></i>로그인</a>
    </c:if>
    <c:if test="${!empty login}">
      <a href="${path}/Expermember/logout.do" class="w3-bar-item w3-button">로그아웃</a>
    </c:if>
    </div>
  </div>
</div>


<!-- !PAGE CONTENT! -->
<div style="margin-top:40px;">
<decorator:body/>
</div>

  <div id="bottom" class="w3-black w3-center w3-padding-24"></div>
<!-- End page content -->




</body>
</html>