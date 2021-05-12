<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
input[type=submit] {
	align: center;
	
input:invalid {
  border: 3px solid red;
}

}
</style>
<script type="text/javascript">
	function inputcheck(f) {
		if (f.email.value == "") {
			alert("�̸����� �Է����ּ���.")
			f.email.focus();
			return false;
		}
		if (f.pass.value == "") {
			alert("��й�ȣ�� �Է����ּ���.")
			f.pass.focus();
			return false;
		}
		if (f.name.value == "") {
			alert("�̸��� �Է����ּ���.")
			f.name.focus();
			return false;
		}

		if (f.pwque.value == "") {
			alert("pwã�� ������ �������ּ���.")
			f.pwque.focus();
			return false;
		}
		if (f.pwans.value == "") {
			alert("pwã�� �亯�� �Է����ּ���.")
			f.pwans.focus();
			return false;
		}
	}
//�̸��� �ߺ�Ȯ��
	$(function(){
		$("#btn").click(function(){
			if($('#email').val()==''){
				alert("�̸����� �Է����ּ���.");
				$('#email').focus()
			}else{
			var param = {email:$("#email").val()}
			
			$.ajax({
				url : "idcheck.jsp",
					type : "POST",
					data : param,
					success : function(data){
						if($("h1").is(".find")){
							alert("�̹� ������ �̸����Դϴ�.");
							$("#email").val("");
						}else{
							alert("��� ������ �̸����Դϴ�.")
						}
					},
					error : function(e){
						alert("��������:"+e.status)
					}
				})
			}
		})
	})
</script>
</head>
<body>
	<div class="w3-container w3-half w3-margin-left"
		style="width: 100%; height: 100%; padding: 2% 38%;">
		<form class="w3-container w3-card-4 w3-white"
			style="width: 500px; height: 600px padding-top:40px;;" action="join.do" name="f"
			method="post" onsubmit="return inputcheck(this)">
			<input type="hidden" name="picture" value="${param.fname}">
			<table class="w3-table-all w3-border w3-white w3-center">
				<tr>
					<td rowspan="5" valign="bottom">
					<c:if test="${param.fname == null}">
					<img src="img/user.png" width="100" height="120" id="pic"><br> 
					</c:if>
					<c:if test="${param.fname != null}">
					<img src="picture/${param.fname}" width="100" height="120" id="pic"><br> 
					</c:if>
					<font size="1">
					<a class="w3-button" href="javascript:void(0);" onclick="document.getElementById('addpicture').style.display='block'"
							style="text-align: center">�������</a></font></td>
				<tr>
					<th>Email</th>
					<td><input class="w3-input w3-border" type="email" id="email" name="email">
					<input class="w3-button" type="button" value="�ߺ�Ȯ��" id="btn" >
					</td>
				</tr>
				<tr>
					<th>password</th>
					<td><input class="w3-input w3-border" type="password" name="pass"></td>
				</tr>
				<tr>
					<th style="font-size:14px;">�̸�(����)</th>
					<td><input class="w3-input w3-border" type="text" name="name"></td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="radio" name="gender" value="1" checked>��
						<input type="radio" name="gender" value="2">��</td>
				</tr>
				<tr>
					<td></td>
					<th>Ű</th>
					<td><input class="w3-input w3-border" type="text" name="height" 
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<td></td>
					<th>������</th>
					<td><input class="w3-input w3-border" type="text" name="weight"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<td></td>
					<th>PW ã�� ����</th>
					<td colspan="2"><select class="w3-select" name="pwque">
							<option selected="selected">�����ϼ���</option>
							<option>���� ���� �����ϴ� ���</option>
							<option>���� ����(���� 0130)</option>
							<option>���� ���� �Ƴ��� ����</option>
							<option>���� ��� �ʵ��б�</option>
							<option>���� �����ϴ� ����</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<th>PW ã�� �亯</th>
					<td colspan="2"><input class="w3-input w3-border" type="text" name="pwans"></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center; border-radius: 20px;">
						<input type="submit" class="w3-submit w3-black w3-round"
						value="ȸ������">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<!-- ����÷�� -->
	<div id="addpicture" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('addpicture').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="â �ݱ�">&times;</span>
			</div>
			<table>
				<tr>
					<td><img id="preview" src="img/user.png" width="240px" height="200px"></td>
				</tr>
				<tr>
					<td>
						<form class="w3-container" action="picture.do" method="post"
							name="p" onsubmit="return inputchk(this)"
							enctype="multipart/form-data">
							<input type="file" name="picture" id="imageFile" accept="img/*">
							<input type="submit" value="�������">
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		//<input type="file"
		//id='imageFile', 'preview'
		let imagefile = document.querySelector('#imageFile');
		let preview = document.querySelector('#preview');
		//addEventListener : �̺�Ʈ�� ���.
		imagefile.addEventListener('change', function(e) {
			let get_file = e.target.files; //���õ� �̹��� ����
			let reader = new FileReader(); //���ϼ���.
			reader.onload = (function(Img) {
				return function(e) {
					Img.src = e.target.result;
				}
			})(preview);
			if (get_file) {
				reader.readAsDataURL(get_file[0]);
			}
		})

	</script>
</body>
</html>
