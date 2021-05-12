<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>신체기록</title>
<style>
 .outter{
 	width:1500px;
 	height:1600px;
 	margin-left:100px;
 	border: 1px solid lightgrey;
 }
  .inner_list{	
 	width:700px;
 	height:500px;
 	margin-left:50px;
	border: 1px solid lightgrey;
 	margin-top:50px;
 	display:inline-block;
 }
   .inner_input{	
 	width:500px;
 	height:auto;
 	margin-left:100px;
	border: 1px solid lightgrey;
 	margin-top:50px;
 	vertical-align:top;
 	display:inline-block;
 }
 .exercise{
 	background-color:#EAEAEA;
 	width:100%;
 	height:90%;
 	padding:50px 50px;
 }
 .set{
 	display:inline-block;
 	width:100%;
 }
 .datemoa{
 	width:100%;
 	text-align:center;
 }
 .ename{
 	font-size:18px;
 	color:#003399;
 	font-weight:bold;
 }
 
 
<%-- 버튼  style --%>
 .w3-input{
 	width:200px;
 }
 .w3-number{
 	width:50px;
 }
 .w3-select{
 	width:60px;
 }
 .w3-date w3{
 	border:none;
 	background-color:#F6F6F6;
 	font-size:18px;
 }
</style>
<script type="text/javascript">
	function inputchk(f){
		if(f.part.value==''){
			alert("부위를 선택하세요.")
			f.part.focus();
			return false;
		}
		if(f.setnum.value==''){
			alert("몇 세트인지 입력하세요")
			f.setnum.focus();
			return false;
		}
		if(f.weight.value==''){
			alert("무게를 입력하세요 프리웨이트일 경우 0")
			f.weight.focus();
			return false;
		}
		if(f.count.value==''){
			alert("개수를 입력하세요")
			f.count.focus();
			return false;
		}
	}
	function chgEname(type){
		var opt = $("#ename option").length;
		if(type == ''){
			var name=["부위를 선택해주세요"];
		}else if(type == '가슴'){
			var name = ['팔굽혀펴기','플랫 벤치프레스','인클라인 벤치 프레스','디클라인 벤치 프레스',"덤벨플라이",'덤벨 프레스','딥스','펙덱 플라이'];
		}else if(type == '등'){
			var name = ['풀업','렛풀다운','시티 드로우',"T바 로우",'데드 리프트','벤트오버 덤벨로우','원암 덤벨로우'];
		}else if(type == '어깨'){
			var name = ['덤벨 숄더프레스','머신 숄더프레스','사이드 레터럴 레이즈','덤벨 프론트 레이즈',"리버스 펙덱플라이",'밀리터리 프레스','스미스 밀리터리 프레스','벤트오버 레터럴 레이즈'];
		}else if(type == '팔'){
			var name = ['=======이두=======(선택X)','덤벨 컬','바벨 컬',"얼터네이팅 덤벨 컬",'이지바 컨센트레이션 컬','=======삼두=======(선택X)','덤벨 킥백','오버헤드 덤벨 프레스','라잉 트라이셉 익스텐션'];
		}else if(type == '하체'){
			var name = ['프리웨이트 스쿼트','런지','레그 익스텐션','레그 컬','레그 프레스'];
		}else if(type == '복근'){
			var name = ['싯업','크런치','레그레이즈','행잉 레그레이즈','바이시클 크런치'];
		}
		
		for(var i=0; i<opt; i++){
			document.getElementById('ename').options[0] = null;
		}
		for(j=0; j<name.length; j++){
			document.getElementById('ename').options[j] = new Option(name[j],name[j]);
		}
	}
</script>
</head>
<body>
<div class="outter">
<!-- list layout시작 -->
<div class="inner_list">
<div class="datemoa">
<form action="weightreport.do" method="post">
<input class="w3-date w3" id="now_date1" name="date1" type="date">-<input class="w3-date w3" id="now_date2" name="date2" type="date">
<input class="w3-button w3-black" type="submit" value="찾기">
</form>
</div>
<div class="exercise">
<c:forEach var="e" items="${list}">
<div class="ename">
<c:if test="${e.setnum==1}">
${e.ename}<br>
</c:if>
</div>
<div class="set">
${e.setnum}세트
<c:choose>
<c:when test="${e.weight==0}">맨몸</c:when>
<c:otherwise> ${e.weight}kg </c:otherwise>
</c:choose>
 ${e.count}회
 <a href="exdelete.do?no=${e.no}&" class="w3-button"><i style="color:red" class="fa fa-remove"></i></a>
 </div>
</c:forEach>
</div>
</div>
<!-- input layout -->
<div class="inner_input">
<form action="exreport.do" method="post" onsubmit="return inputchk(this)">
<table class="w3-table">
<tr><td><b>날짜</b></td><td><input class="w3-date" name="date" id="now_date3" type="date"></td></tr>

<tr><td><b>부위</b></td>
<td>
<select class="w3-select" id="part" name="part" onchange="chgEname(this.value)">
	<option value="" selected>선택</option>
	<option value="가슴">가슴</option>
	<option value="등">등</option>
	<option value="팔">팔</option>
	<option value="어깨">어깨</option>
	<option value="하체">하체</option>
	<option value="복근">복근</option>
</select>
</td></tr>
<tr><td><b>운동명</b></td><td>
<select class="w3-select" id="ename" name="ename" style="width:200px">
</select
></td></tr>
<tr><td><b>세트</b></td><td><input class="w3-number" name="setnum" type="number" min="1">Set</td></tr>
<tr><td><b>무게</b></td><td><input class="w3-number" name="weight" type="number" min="0">kg(맨몸 운동일 시 0으로 설정)</td></tr>
<tr><td><b>개수</b></td><td><input class="w3-number" name="count" type="number" min="1">개</td></tr>
<tr><td colspan="2" style="text-align:center"><input class="w3-button w3-green" type="submit" value="기록하기"></td></tr>
</table>
</form>
</div>
</div>
<script type="text/javascript">
document.getElementById('now_date1').valueAsDate = new Date();
document.getElementById('now_date2').valueAsDate = new Date();
document.getElementById('now_date3').valueAsDate = new Date();
</script>
</body>
</html>