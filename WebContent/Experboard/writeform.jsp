<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</script>
</head>
<body>

<form action="write.do" method="post" 
	enctype="multipart/form-data" name="f" style="margin-left:20%;">
	<div style="width:100%; text-align:left;">
<h3 style="color:grey; height:15px; width:50%;">�۾���</h3>
<hr style="background-color:grey; height:5px; width:750px;">
</div>
<table class="w3-table-all w3-border" style="width:50%; height:50%;">
 <tr><td><select name="btype" >
 			<option value="0">�����ϼ���</option>
 			<option value="1" ${param.btype==1 ? 'selected':''}>�����Խ���</option>
 			<option value="2" ${param.btype==2 ? 'selected':''}>��������[�]</option>
 			<option value="3" ${param.btype==3 ? 'selected':''}>��������[�Ĵ�]</option>
 		</select></td><td style="text-align:left;"><input type="text" class="subject" name="subject" placeholder="������ �Է����ּ���."></td></tr>
 <tr><td colspan="2"><textarea style="resize:none" rows="15" cols="80" name="content" id="content1"
  class="w3-input w3-border" placeholder="������ �Է����ּ���."></textarea></td></tr>
 <script>
 CKEDITOR.replace("content1",{
  filebrowserImageUploadUrl : "imgupload.do",
  height : 400,
  width : 720

 });

   </script>

 <tr><td colspan="2"><input class="w3-button w3-left" type="file" name="file1"></td></tr>
 <tr><td colspan="2">
 	<a class="w3-button w3-green w3-right" href="javascript:inputcheck()">���</a></td></tr>
</table>
</form>
</body>
</html>