<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원목록</title>

<style>
.list{width:100%; height:100%; text-align:center; }
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<body>
<div></div>
<div class="list">
<form>
<table class="w3-table-all w3-border">
<caption>회원 목록</caption>
<tr><th>사진</th><th>이메일</th><th>이름(별명)</th><th>성별</th><td></td>
<c:forEach var="m" items="${list}">
<tr>
<td>
<c:if test="${!empty m.picture}">
<img src="picture/sm_${m.picture}" width="40" height="50">
</c:if>
<c:if test="${empty m.picture}">
<img src="img/user.png" width="40" height="50">
</c:if>
</td>
<td><a href="mypage.do?email=${m.email}">${m.email}</a></td>
<td>${m.name}</td>
<td>${m.gender == 1 ? "남" : "여"}</td>
<td><a href="mypage.do?email=${m.email}"><i class="fa fa-search"></i></a>
</td>
</tr></c:forEach>
</table>
</form>
</div>

</body>
</html>
