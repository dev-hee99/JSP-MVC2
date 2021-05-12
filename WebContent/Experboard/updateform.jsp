<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
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
			alert("게시판 종류를 선택해주세요")
			f.btype.focus()
			return false;
		}
		
		if(f.subject.value==""){
		alert("제목을 입력하세요");
		f.subject.focus();
		return false;	
		}	
		f.submit();
}
	 function file_delete(){
	      document.f.file2.value="";   //기존의 첨부파일 정보 제거
	      file_desc.style.display="none";   //보이지 않도록 설정
	   }
</script>
</head>
<body>

<form action="update.do" method="post" 
	enctype="multipart/form-data" name="f" style="margin-left:20%;">
<input type="hidden" name="num" value="${e.num}">
<input type="hidden" name="file2" value="${e.file1}">
	<div style="width:100%; text-align:left;">
<h3 style="color:grey; height:15px; width:50%;">글수정</h3>
<hr style="background-color:grey; height:10px; width:670px;">
</div>
<table class="w3-table-all w3-border" style="width:50%; height:50%;">
 <tr><td><select name="btype" >
 			<option value="0" >선택하세요</option>
 			<option value="1" ${e.btype==1 ? "selected":""}>자유게시판</option>
 			<option value="2" ${e.btype==2 ? "selected":""}>정보공유[운동]</option>
 			<option value="3" ${e.btype==3 ? "selected":""}>정보공유[식단]</option>
 		</select></td><td style="text-align:left;"><input type="text" class="subject" name="subject" value="${e.subject}" placeholder="제목을 입력해주세요."></td></tr>
 <tr><td colspan="2"><textarea style="resize:none" rows="15" cols="80" name="content" id="content1"
  class="w3-input w3-border" placeholder="내용을 입력해주세요.">${e.content}</textarea></td></tr>
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
    <a href="javascript:file_delete()">[첨부파일 삭제]</a></div>
   </c:if>
    <input type="file" name="file1"></td></tr>
 <tr><td colspan="2">
 	<a href="javascript:inputcheck()">[수정]</a></td></tr>
</table>
</form>
</body>
</html>