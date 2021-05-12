<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>
<style type="text/css">
.subject{
	width:500px;
	height:28px;
	font-size:16px;
}
.ck.ck-editor{
	max-width:10px;
}
.ck.ck-editable{
	min-height:10px;
}
</style>
<script type="text/javascript"
   src="http://cdn.ckeditor.com/4.5.1/standard/ckeditor.js"></script>   

<script type="text/javascript">
	function inputcheck(){
		f = document.f;		
		if(f.btype.value==0){
			alert("�Խ��� ������ �������ּ���")
			f.btype.focus()
			return false;
		}
		
		if(f.subject.value==""){
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return false;	
		}	
		f.submit();
}
	 function file_delete(){
	      document.f.file2.value="";   //������ ÷������ ���� ����
	      file_desc.style.display="none";   //������ �ʵ��� ����
	   }
</script>
</head>
<body>

<form action="update.do" method="post" 
	enctype="multipart/form-data" name="f" style="margin-left:20%;">
<input type="hidden" name="num" value="${e.num}">
<input type="hidden" name="file2" value="${e.file1}">
	<div style="width:100%; text-align:left;">
<h3 style="color:grey; height:15px; width:50%;">�ۼ���</h3>
<hr style="background-color:grey; height:10px; width:670px;">
</div>
<table class="w3-table-all w3-border" style="width:50%; height:50%;">
 <tr><td><select name="btype" >
 			<option value="0" >�����ϼ���</option>
 			<option value="1" ${e.btype==1 ? "selected":""}>�����Խ���</option>
 			<option value="2" ${e.btype==2 ? "selected":""}>��������[�]</option>
 			<option value="3" ${e.btype==3 ? "selected":""}>��������[�Ĵ�]</option>
 		</select></td><td style="text-align:left;"><input type="text" class="subject" name="subject" value="${e.subject}" placeholder="������ �Է����ּ���."></td></tr>
 <tr><td colspan="2"><textarea style="resize:none" rows="15" cols="80" name="content" id="content1"
  class="w3-input w3-border" placeholder="������ �Է����ּ���.">${e.content}</textarea></td></tr>
 <script>
 CKEDITOR.replace("content1",{
  filebrowserImageUploadUrl : "imgupload.do",
  height : 400,
  width : 670

 });
   </script>
  <tr><td colspan="2" style="text-align:right">
 <c:if test="${!empty e.file1}">
    <div id="file_desc">${e.file1}
    <a href="javascript:file_delete()">[÷������ ����]</a></div>
   </c:if>
    <input type="file" name="file1"></td></tr>
 <tr><td colspan="2">
 	<a href="javascript:inputcheck()">[����]</a></td></tr>
</table>
</form>
</body>
</html>