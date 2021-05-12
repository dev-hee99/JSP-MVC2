<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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
			alert("이메일을 입력해주세요.")
			f.email.focus();
			return false;
		}
		if (f.pass.value == "") {
			alert("비밀번호를 입력해주세요.")
			f.pass.focus();
			return false;
		}
		if (f.name.value == "") {
			alert("이름을 입력해주세요.")
			f.name.focus();
			return false;
		}

		if (f.pwque.value == "") {
			alert("pw찾기 질문을 선택해주세요.")
			f.pwque.focus();
			return false;
		}
		if (f.pwans.value == "") {
			alert("pw찾기 답변을 입력해주세요.")
			f.pwans.focus();
			return false;
		}
	}
//이메일 중복확인
	$(function(){
		$("#btn").click(function(){
			if($('#email').val()==''){
				alert("이메일을 입력해주세요.");
				$('#email').focus()
			}else{
			var param = {email:$("#email").val()}
			
			$.ajax({
				url : "idcheck.jsp",
					type : "POST",
					data : param,
					success : function(data){
						if($("h1").is(".find")){
							alert("이미 가입한 이메일입니다.");
							$("#email").val("");
						}else{
							alert("사용 가능한 이메일입니다.")
						}
					},
					error : function(e){
						alert("서버오류:"+e.status)
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
							style="text-align: center">사진등록</a></font></td>
				<tr>
					<th>Email</th>
					<td><input class="w3-input w3-border" type="email" id="email" name="email">
					<input class="w3-button" type="button" value="중복확인" id="btn" >
					</td>
				</tr>
				<tr>
					<th>password</th>
					<td><input class="w3-input w3-border" type="password" name="pass"></td>
				</tr>
				<tr>
					<th style="font-size:14px;">이름(별명)</th>
					<td><input class="w3-input w3-border" type="text" name="name"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="gender" value="1" checked>남
						<input type="radio" name="gender" value="2">여</td>
				</tr>
				<tr>
					<td></td>
					<th>키</th>
					<td><input class="w3-input w3-border" type="text" name="height" 
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<td></td>
					<th>몸무게</th>
					<td><input class="w3-input w3-border" type="text" name="weight"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
				</tr>
				<tr>
					<td></td>
					<th>PW 찾기 질문</th>
					<td colspan="2"><select class="w3-select" name="pwque">
							<option selected="selected">선택하세요</option>
							<option>내가 가장 존경하는 사람</option>
							<option>나의 생일(예시 0130)</option>
							<option>내가 가장 아끼는 물건</option>
							<option>나의 출신 초등학교</option>
							<option>내가 좋아하는 게임</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<th>PW 찾기 답변</th>
					<td colspan="2"><input class="w3-input w3-border" type="text" name="pwans"></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center; border-radius: 20px;">
						<input type="submit" class="w3-submit w3-black w3-round"
						value="회원가입">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 사진첨부 -->
	<div id="addpicture" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('addpicture').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
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
							<input type="submit" value="사진등록">
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
		//addEventListener : 이벤트의 등록.
		imagefile.addEventListener('change', function(e) {
			let get_file = e.target.files; //선택된 이미지 파일
			let reader = new FileReader(); //파일선택.
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
