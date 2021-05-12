<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����Խ���</title>
<script type="text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
	function allchk(chk){
			$("input[name=deletechk]").prop("checked",chk.checked)
		}
	function inputchk(){
		//name�� deltechk�� üũ �ڽ��� üũ ���� �ʾ��� ���
		if($('input[name=deletechk]').is(":checked")==false){
			alert("���õ� �Խñ��� �����ϴ�.")
			return false;
		}else{
		var chk = confirm("������ �����Ͻðڽ��ϱ�?")
		if(chk){
			d.submit();
		}	
		else{
			return false;
			}
		}
	}
</script>
<style>
	.icon{
		weight:18px;
		height:18px;
	}
	.top_outter{
		width:100%;
		height:42px;
	}
	.line{
		background-color:grey;
		height:2px;
		margin-top:3px;
	}
	.outter{
		weight:1600px;
		height:1600px;
	}
	.inner{
		padding:20px 200px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var num = Math.floor(Math.random()*3)+1;
		var imgurl = "img/Exper" + num +".png"
		$("#banner").attr("src",imgurl)	
	})
</script>
</head>
<body>
<div class="outter">
<!-- ��� -->
<div class="w3-center" style="padding:10px;">
<img id="banner" src="" style="width:1000px; height:250px;">
</div>
<div class="inner">
<div class="top_outter">
<div class="w3-left">
<img src="../icons/contract.png" style="width:50px; height:50px;">
</div>
<div class="w3-left" style="font-size:25px; margin-top:10px;">
<c:if test="${login ne 'admin' }">
	<c:if test="${param.btype==0}">
	���������Խ���
	</c:if>
	<c:if test="${param.btype==1}">
	�����Խ���
	</c:if>
	<c:if test="${param.btype==2}">
	������Խ���
	</c:if>
	<c:if test="${param.btype==3}">
	�Ĵܰ����Խ���
	</c:if>
	<c:if test="${param.btype==4}">
	��ü�Խñ�
	</c:if>
</c:if>
<c:if test="${login eq 'admin' }">
	<c:if test="${param.btype==0}">
	�������� �Խ��� ����
	</c:if>
	<c:if test="${param.btype==1}">
	�����Խ��� ����
	</c:if>
	<c:if test="${param.btype==2}">
	������Խ��� ����
	</c:if>
	<c:if test="${param.btype==3}">
	�Ĵܰ����Խ��� ����
	</c:if>
	<c:if test="${param.btype==4}">
	��ü�Խñ�
	</c:if>
</c:if>
<div style="color:grey; font-size:14px;">
<span style="font-weight:bold">${boardcount}</span>���� �Խñ�</div></div>
</div>

<hr class="line">
<form action="partdelete.do" method="post" name="d">
<input type="hidden" name="btype" value="1">
<table class="w3-table-all w3-border" >

<c:if test="${boardcount == 0}">
<tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
</c:if>
<c:if test="${boardcount > 0}">
<tr><td colspan="6"></td></tr>
<!-- Admin�� ��� üũ�ڽ� ���̰� -->
<tr><c:if test="${login eq 'admin' }">
<th width="8%" style="text-align:center;">��ü����<input type="checkbox" onchange="allchk(this)"></th>
</c:if>
<c:if test="${login ne 'admin'}">
<th width="8%">��ȣ</th>
</c:if>
	<th width="50%">����</th>
	<th width="14%">�ۼ���
	</th><th width="17%">�����</th>
	<th width="5%">��ȸ��</th>
	<th width="5%">���ƿ�</th></tr>

<!--======================== ����Ʈ ����======================= -->
<c:forEach var="b" items="${list}">
<!--  �����Խ����� ��쿡�� ��� -->
<tr>
<c:if test="${login eq 'admin'}">
<td style="text-align:center;"><input type="checkbox" name="deletechk" value="${b.num}"></td>
</c:if>
<c:if test="${login ne 'admin' }">
	<!-- �Ϲݱ� -->
	<c:if test="${b.wtype == 2}">
		<td>${boardnum}</td>
	</c:if>
	<!-- ������ -->
	<c:if test="${b.wtype == 1 }">
		<td style="color:red;">[����]</td>
	</c:if>
</c:if>
<c:set var="boardnum" value="${boardnum-1}"/>
<td style="text-align:left;${b.email=='admin'? 'color:red;':''}">
<%-- ÷������ ǥ�� --%>
<a href="info.do?num=${b.num}">${b.subject}</a>
<c:if test="${!empty b.file1}">
	<a href="file/${b.file1}" style="text-decoration: none;"><img class="icon" src="../icons/paper-clip.png"></a>
	</c:if>
<%-- ��� �� �Է� --%>
<c:forEach var="n" items="${numcnt}">
<c:if test="${b.num == n.num}">
<img class="icon" src="../icons/comment.png"><font style="font-size:13px;color:grey;font-weight:bold">[${n.cnt}]</font>
</c:if>
</c:forEach>
</td>	
<td style="${b.email=='admin'? 'color:red;':''}">${b.name}</td>
<%-- ���� ��ϵ� �Խù� ��¥ format��� ����ϱ� --%>
<td style="${b.email=='admin'? 'color:red;':''}"><fmt:formatDate var="rdate" value="${b.regdate}"
		pattern="yyyy-MM-dd"/>
<c:if test="${today == rdate}">
	<fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
</c:if>
<c:if test="${today != rdate}">
	<fmt:formatDate value="${b.regdate}" pattern="yyyy.MM.dd."/>
</c:if>
</td>
<!-- ��ȸ�� -->
<td style="${b.email=='admin'? 'color:red;':''}">${b.readcnt}</td>
<!-- ���ƿ� -->
<td style="${b.email=='admin'? 'color:red;':''}">${b.recom}</td></tr>

<!-- =======================����Ʈ ��========================== -->

<%--������ ó�� --%>
</c:forEach>
<tr><td colspan="6" style="text-align:center">
	<c:if test="${pageNum <= 1}"><img class="icon" src="../icons/back.png"></c:if>
	<c:if test="${pageNum > 1}">
	<a href="javascript:listdo(${pageNum-1})"><img class="icon" src="../icons/back.png"></a></c:if>
	
	<c:forEach var="a" begin="${startpage}" end="${endpage}">
	<c:if test="${a==pageNum}">${a}</c:if>
	<c:if test="${a!=pageNum}">
		<a href="explist.do?btype=${param.btype}&pageNum=${a}">${a}</a>
	</c:if>
	</c:forEach>
	
	<c:if test="${pageNum >= maxpage}"><img class="icon" src="../icons/next.png"></c:if>
	<c:if test="${pageNum < maxpage}">
	<a href="explist.do?btype=${param.btype}&pageNum=${pageNum + 1}"><img class="icon" src="../icons/next.png"></a></c:if>	
	</td></tr>
</c:if>


<tr>
<c:if test="${login eq 'admin' }">
<td colspan="5" style="text-align:right;">
<input class="w3-button w3-ripple w3-red" type="button" onclick="return inputchk()" value="����"></td>
</c:if>
<c:if test="${login ne 'admin' }">
<td colspan="5" style="text-align:right;"></td>
</c:if>
<td><a href="writeform.do?btype=${param.btype}" class="w3-button w3-ripple w3-green">�۾���</a></td></tr>
</table>
</form>

<!-- �˻� -->
<form action="explist.do" method="post" name="sf">
<div style="display : flex; justify-content: center; marign-top:50px;">
<input type="hidden" name="pageNum" value="1">
<input type="hidden" name="btype" value="${btype}">
<select name="column" style="width:150px;">
	<option value="">�����ϼ���.</option> 
	<option value="subject,name,content" selected="selected">��ü</option>
	<option value="subject" >����</option>
	<option value="name">�ۼ���</option>
	<option value="content">����</option>
	<option value="subject,name">����+�ۼ���</option>
	<option value="subject,content">����+����</option>
	<option value="name,content">�ۼ���+����</option>
</select>
<script>document.sf.column.value="${param.column}";</script>
<input type="text" name="find" placeholder="�˻�� �Է����ּ���." value="${param.find}"
	style="width:250px">
<button class="w3-button" type="submit">
<img alt="�˻�" src="../icons/loupe.png" style="width:25px ;height:25px;">
</button>
</div>
</form>
</div>
</div>
</body>
</html>