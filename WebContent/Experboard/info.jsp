<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 로그인 정보 -->
<c:set var="email" value="${sessionScope.login}"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세보기</title>
<style type="text/css">
.outter{
	width:1600px;
	height:1600px;
	text-align:center;
	padding:20px 320px;
	padding-bottom:3%;
	
}
.inner{
	width: 1000px;
	height: auto;
	text-align:center;
	padding:20px 70px;
	border: 1px solid #D8D8D8;
	border-radius:20px;
}
.replyform{
	 width:864px;
	 height:auto;
	 background-color:white;
	 text-align:left;
	 border-radius:20px;
	 border: 2px solid #D8D8D8;
}
.reply{
	 padding:8px 20px;
	 height:auto;
	 background-color:white;
	 text-align:left;
}
.reply2{
	 padding:8px 40px;
	 height:auto;
	 background-color:white;
	 text-align:left;
}
.rp_date{
	font-size:13px;
	text-color:grey;
	padding-bottom:3px;
}
.rp_name{
	font-weight:bold;
font{
	size:13px;
}

</style>
<script type="text/javascript">
$(function(){
	var num1 = 200;
	var content = 0;
	$("#remainnum").html(content+"/200");
	$("textarea").keyup(function(){
		content = $("textarea").val().length;
		$("#remainnum").html(content+"/200");
		if(content >= 200){
			$("#remainnum").val($("#remainnum").val().substring(0,200));
			$("#remainnum").css("color","red");
			alert("글자수는 최대 200자까지 입력 가능합니다.")
		}
		else{
			$("#remainnum").css("color","black");
		}
	})
})

function inputchk(f){
		if(f.content.value == ''){
			alert("댓글을 작성해주세요")
			f.content.focus();
			return false;
		}
	}

</script>
</head>

<body>
<div class="outter">
<div class="inner">
<table class="w3-table-all w3-border" style="width:864px; height:20%;">
<caption style="text-align:left; font-size:25px;"><span>${b.subject}</span></caption>

<tr><th width="auto;" style="color:green;">
<c:if test="${b.btype==1}">자유게시판
</c:if>
<c:if test="${b.btype==2}">
정보공유[운동]
</c:if>
<c:if test="${b.btype==3}">
정보공유[식단]
</c:if></th>
<th width="100px;">작성자</th><td>${b.name}</td><th width="100px;">작성일</th><td width="auto;">
<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm"/>
</td>
<th width="auto;">조회수</th><td>${b.readcnt}</td></tr>
<tr><td class="content" colspan="7" style="border-width:0px; vertical-align: top; text-align: left; width:420px; height:380px; background-color:white;;">
${b.content}</td></tr>
<tr><th><img src="../icons/folder.png" style="width:20px;height:20px;"></th>
	<td>
	<c:if test="${empty b.file1}">&nbsp;</c:if>
	<c:if test="${!empty b.file1}">
	<a href="./file/${b.file1}">${b.file1}</a>
	</c:if>
	</td><td colspan="2"></td>
	
<!-- 로그인 정보와 게시글 이메일 주소가 같으면. -->
	<td colspan="3">
	<a class="w3-button w3-grey w3-right" href="javascript:history.go(-1)">목록</a>
	<c:if test="${email eq b.email || email eq 'admin'}">
	<a class="w3-button w3-red w3-right" href="delete.do?num=${b.num}">삭제</a>
	<a class="w3-button w3-green w3-right" href="updateform.do?num=${b.num}">수정</a>
	</c:if>
	</td>
	</tr>
</table>

<h5 style="text-align:left"><img src="../icons/reply.png" style="width:25px;height:25px;"><font style="font-size:15px;">&nbsp;댓글<font style="font-weight:bold">&nbsp;${cnt}</font></font></h5>
<hr style="background-color:green; width:864px; height:1px;">

<!-- 댓글 start -->
<div class="replyform">

<c:forEach var="r" items="${list}">
<div class="reply">
<c:if test="${r.seq eq r.grp}">

<div class="rp_name">
<c:forEach var="m" items="${mem}">
<c:if test="${r.email eq m.email}">
<c:if test="${!empty m.picture}">
<img class="w3-circle" src="../Expermember/picture/${m.picture}" style="height:50px; width:50px;">${r.name}
</c:if>
<c:if test="${empty m.picture}">
<img class="w3-circle" src="../Expermember/img/user.png" style="height:50px; width:50px;">${r.name}
</c:if>
</c:if>
</c:forEach>
<c:if test="${b.email eq r.email}">
<span style="color:red">(작성자)</span>
</c:if>
</div>
<div class="con" style="padding:10px;">${r.content}</div>
<!-- 댓글 답글 -->
<div class="rp_date"><fmt:formatDate var="rdate" value="${r.regdate}"
		pattern="yyyy.MM.dd HH:mm"/>${rdate}&nbsp;&nbsp;
		<a class="w3-hover-grey w3-xxxsmall" href="javascript:void(0);"
		onclick="document.getElementById('${r.seq}').style.display='block'"><font>답글쓰기</font></a>
</div>
<!-- 댓글 수정,삭제 -->
<c:if test="${email eq r.email || login eq 'admin'}">	
<div class="w3-dropdown-click w3-right">
      <button onclick="dropDown${r.seq}()" class="w3-class w3-white" style="border:none;"><img src="../icons/menu.png" style="width:15px; hegiht:30px;"></button>
           <div id="${r.seq}btn" class="w3-dropdown-content w3-card-4">	
            <ul class="dropdown-menu" style="list-style:none">
			<li><a href="javascript:void(0);" onclick="document.getElementById('${r.seq}update').style.display='block'"
			class="w3-button">수정</a></li>
            <li><a href="repdelete.do?seq=${r.seq}" style="list-style-type:none" class="w3-button">삭제</a></li>
            </ul>
         </div>
</div>
<script>
function dropDown${r.seq}() {
	var x = document.getElementById("${r.seq}btn");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>




<!-- 댓글 수정 modal start -->
	<div id="${r.seq}update" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 680px">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('${r.seq}update').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
							
						<form class="w3-container" action="repupdate.do" method="post"
							name="f" onsubmit="return inputchk(this)">
							<input type="hidden" name="seq" value="${r.seq}">
							<input type="hidden" name="num" value="${r.num}">												
							<h6 class="w3-class" style="font-weight:bold"><img class="w3-circle" src="../Expermember/picture/${sessionScope.picture}" style="height:50px; width:50px;"> ${sessionScope.name}</h6>
							<div>
								<textarea name="content"  rows="1" cols="200" 
								style="resize:none; width:650px; height:150px; font-size:20px;"
								 placeholder="댓글을 입력해주세요 200자 이내만 가능합니다.">${r.content}</textarea></div>
						<div class="w3-left" id="remainnum"></div>
								<input class="w3-button w3-grey w3-right" style="border-radius:10px" type="submit" value="등록">
							<hr style="height:2px;">
						</form>
			</div>	
		</div>
	</div>
<!-- 댓글 수정  end-->	
</c:if>
<!-- 댓글 답글쓰기 -->
<div id="${r.seq}" style="display:none">
<form class="w3-container" action="comment.do" method="post">
	<input type="hidden" name="name" value="${sessionScope.name}">
	<input type="hidden" name="grp" value="${r.grp}">
	<input type="hidden" name="num" value="${b.num}">  
	<h6 class="w3-class" style="font-weight:bold"><img class="w3-circle" src="../Expermember/picture/${sessionScope.picture}" style="height:50px; width:50px;"> ${sessionScope.name}</h6>
	<div>
	<textarea name="content"  rows="1" cols="200" style="resize:none; width:810px; height:100px;background-color:#F6F6F6;" placeholder="댓글을 입력해주세요 200자 이내만 가능합니다."></textarea></div>
	<input class="w3-button w3-grey w3-right" style="border-radius:10px" type="submit" value="등록">
	<a  class="w3-button w3-grey w3-right" 
	href="javascript:void(0);" onclick="document.getElementById('${r.seq}').style.display='none'"
	class="w3-bar-item w3-button w3-left" style="border-radius:10px">취소</a>
	<hr style="height:2px;">
	</form>
</div>	



</c:if>

<!-- 댓글의 답글일경우 -->
<c:if test="${r.seq ne r.grp}">
<div></div>
<div class="reply2">
<div class="rp_name">
<c:forEach var="m" items="${mem}">
<c:if test="${r.email eq m.email}">
<c:if test="${!empty m.picture}">
<img class="w3-circle" src="../Expermember/picture/${m.picture}" style="height:50px; width:50px;">${r.name}
</c:if>
<c:if test="${empty m.picture}">
<img class="w3-circle" src="../Expermember/img/user.png" style="height:50px; width:50px;">${r.name}
</c:if>
</c:if>
</c:forEach>
<!-- 게시글 작성자와 댓글 작성자가 같은경우 -->
<c:if test="${b.email eq r.email}">
<span style="color:red">(작성자)</span>
</c:if>
</div>
<div class="con" style="padding:10px;">
<font style="font-weight:bold"></font>${r.content}</div>
<!-- 댓글 답글 -->
<div class="rp_date"><fmt:formatDate var="rdate" value="${r.regdate}"
		pattern="yyyy.MM.dd HH:mm"/>${rdate}&nbsp;&nbsp;
		<a class="w3-hover-grey w3-xxxsmall" href="javascript:void(0);"
		onclick="document.getElementById('${r.seq}').style.display='block'"></a>
<!-- 댓글 수정,삭제 -->
<c:if test="${email eq r.email || login eq 'admin'}">	
<div class="w3-dropdown-click w3-right">
      <button onclick="dropDown${r.seq}()" class="w3-class w3-white" style="border:none;"><img src="../icons/menu.png" style="width:15px; hegiht:30px;"></button>
           <div id="${r.seq}btn" class="w3-dropdown-content w3-card-4">	
            <ul class="dropdown-menu" style="list-style:none">
			<li><a href="javascript:void(0);" onclick="document.getElementById('${r.seq}update').style.display='block'"
			class="w3-button">수정</a></li>
            <li><a href="repdelete.do?seq=${r.seq}" style="list-style-type:none" class="w3-button">삭제</a></li>
			</ul>
         </div>
</div>

<script>
function dropDown${r.seq}() {
	var x = document.getElementById("${r.seq}btn");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
<!-- 댓글 수정 modal start -->
	<div id="${r.seq}update" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 680px;height:">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('${r.seq}update').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
							
						<form class="w3-container" action="repupdate.do" method="post"
							name="f" onsubmit="return inputchk(this)">
							<input type="hidden" name="seq" value="${r.seq}">
							<input type="hidden" name="num" value="${r.num}">												
							<h5 class="w3-left"> ${sessionScope.name}</h5>
							<div>
								<textarea name="content"  rows="1" cols="200" 
								style="resize:none; width:650px; height:150px; font-size:20px;background-color:#F6F6F6;"
								 placeholder="댓글을 입력해주세요 200자 이내만 가능합니다.">${r.content}</textarea></div>
						<div class="w3-left" id="remainnum"></div>
								<input class="w3-button w3-grey w3-right" style="border-radius:10px" type="submit" value="등록">
							<hr style="height:2px;">
						</form>
			</div>	
		</div>
	</div>
<!-- 댓글 수정  end-->	
</c:if>
</div>
</div>
</c:if>


</div>
<hr style="height:1px">
</c:forEach>
<form class="w3-container" action="reply.do" method="post">
<input type="hidden" name="name" value="${sessionScope.name}">
<input type="hidden" name="num" value="${b.num}">  
<h6 class="w3-class" style="font-weight:bold"><img class="w3-circle" src="../Expermember/picture/${sessionScope.picture}" style="height:50px; width:50px;"> ${sessionScope.name}</h6>
<div>
<textarea name="content"  rows="1" cols="200" style="resize:none; width:830px; height:150px;background-color:#F6F6F6;" placeholder="댓글을 입력해주세요 200자 이내만 가능합니다."></textarea></div>
<div class="w3-left" id="remainnum"></div>
<input class="w3-button w3-grey w3-right" style="border-radius:10px" type="submit" value="등록">
<hr style="height:2px;">
</form>
</div>
<!---댓글 end -->

</div>
</div>

</body>
</html>