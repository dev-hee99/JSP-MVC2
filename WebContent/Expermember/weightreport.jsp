<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü���</title>
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
 
 
<%-- ��ư  style --%>
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
			alert("������ �����ϼ���.")
			f.part.focus();
			return false;
		}
		if(f.setnum.value==''){
			alert("�� ��Ʈ���� �Է��ϼ���")
			f.setnum.focus();
			return false;
		}
		if(f.weight.value==''){
			alert("���Ը� �Է��ϼ��� ��������Ʈ�� ��� 0")
			f.weight.focus();
			return false;
		}
		if(f.count.value==''){
			alert("������ �Է��ϼ���")
			f.count.focus();
			return false;
		}
	}
	function chgEname(type){
		var opt = $("#ename option").length;
		if(type == ''){
			var name=["������ �������ּ���"];
		}else if(type == '����'){
			var name = ['�ȱ������','�÷� ��ġ������','��Ŭ���� ��ġ ������','��Ŭ���� ��ġ ������',"�����ö���",'���� ������','����','�嵦 �ö���'];
		}else if(type == '��'){
			var name = ['Ǯ��','��Ǯ�ٿ�','��Ƽ ��ο�',"T�� �ο�",'���� ����Ʈ','��Ʈ���� �����ο�','���� �����ο�'];
		}else if(type == '���'){
			var name = ['���� ���������','�ӽ� ���������','���̵� ���ͷ� ������','���� ����Ʈ ������',"������ �嵦�ö���",'�и��͸� ������','���̽� �и��͸� ������','��Ʈ���� ���ͷ� ������'];
		}else if(type == '��'){
			var name = ['=======�̵�=======(����X)','���� ��','�ٺ� ��',"���ͳ����� ���� ��",'������ ����Ʈ���̼� ��','=======���=======(����X)','���� ű��','������� ���� ������','���� Ʈ���̼� �ͽ��ټ�'];
		}else if(type == '��ü'){
			var name = ['��������Ʈ ����Ʈ','����','���� �ͽ��ټ�','���� ��','���� ������'];
		}else if(type == '����'){
			var name = ['�˾�','ũ��ġ','���׷�����','���� ���׷�����','���̽�Ŭ ũ��ġ'];
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
<!-- list layout���� -->
<div class="inner_list">
<div class="datemoa">
<form action="weightreport.do" method="post">
<input class="w3-date w3" id="now_date1" name="date1" type="date">-<input class="w3-date w3" id="now_date2" name="date2" type="date">
<input class="w3-button w3-black" type="submit" value="ã��">
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
${e.setnum}��Ʈ
<c:choose>
<c:when test="${e.weight==0}">�Ǹ�</c:when>
<c:otherwise> ${e.weight}kg </c:otherwise>
</c:choose>
 ${e.count}ȸ
 <a href="exdelete.do?no=${e.no}&" class="w3-button"><i style="color:red" class="fa fa-remove"></i></a>
 </div>
</c:forEach>
</div>
</div>
<!-- input layout -->
<div class="inner_input">
<form action="exreport.do" method="post" onsubmit="return inputchk(this)">
<table class="w3-table">
<tr><td><b>��¥</b></td><td><input class="w3-date" name="date" id="now_date3" type="date"></td></tr>

<tr><td><b>����</b></td>
<td>
<select class="w3-select" id="part" name="part" onchange="chgEname(this.value)">
	<option value="" selected>����</option>
	<option value="����">����</option>
	<option value="��">��</option>
	<option value="��">��</option>
	<option value="���">���</option>
	<option value="��ü">��ü</option>
	<option value="����">����</option>
</select>
</td></tr>
<tr><td><b>���</b></td><td>
<select class="w3-select" id="ename" name="ename" style="width:200px">
</select
></td></tr>
<tr><td><b>��Ʈ</b></td><td><input class="w3-number" name="setnum" type="number" min="1">Set</td></tr>
<tr><td><b>����</b></td><td><input class="w3-number" name="weight" type="number" min="0">kg(�Ǹ� ��� �� 0���� ����)</td></tr>
<tr><td><b>����</b></td><td><input class="w3-number" name="count" type="number" min="1">��</td></tr>
<tr><td colspan="2" style="text-align:center"><input class="w3-button w3-green" type="submit" value="����ϱ�"></td></tr>
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