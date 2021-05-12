<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<c:set var="login" value="${sessionScope.login}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
input[type=text] {
	text-align: right;
}

td{
	width:auto;
	text-align:left;
}
</style>
<!-- bmi jquery -->
<script type="text/javascript">
//비만도 계산기에서 숫자키만 가능 
	function fn_onlyNumber(){
		if((event.keyCode < 48) || (event.keyCode > 57))
			//.은 제외 
			if(event.keyCode == 46){
				return true;
			}else{
				return false;	
			}	
		return true;
	}
	function fn_calBMI(height, weight){
		var BMIresult = $('#searchWeight').val() / ( ( $('#searchHeight').val() / 100) * ( $('#searchHeight').val() / 100) );
		var BMItext = "";
		if(BMIresult < 18.5) BMItext = '저체중';
		if(BMIresult >= 18.5 && BMIresult < 23) BMItext = '정상체중';
		if(BMIresult >= 23 && BMIresult < 25) BMItext = '위험체중';
		if(BMIresult >= 25 && BMIresult < 30) BMItext = '비만 1단계';
		if(BMIresult >= 30 && BMIresult < 35) BMItext = '비만 2단계';
		if(BMIresult >= 35) BMItext = '비만 3단계(고도비만)';
		$('#bmi').val(BMIresult.toFixed(2));
		$('#bmiTxt').val(BMItext) ;
	}

	//리셋
	function fn_reset(){
		$('#searchAge').val('');
		$('#bmi').val('');
		$('#bmiTxt').val('') ;
	}
	//input체크
	function inputchk(f){
		if(f.nowpass.value == f.pass){
			alert("현재 비밀번호와 변경하실 비밀번호가 다릅니다.")
			f.pass.focus();
			return false;
		}
		if(f.pass.value == f.pass2){
			alert("변경하실 비밀번호와 재입력 비밀번호가 다릅니다.")
			f.pass.focus();
			return false;
		}
		
	}
</script>
</head>
<body>
	<!-- 구현 화면 -->
	<div class="w3-container w3-half w3-margin-left"
		style="width: 800px; height: 40%; padding: 1% 3%;">

		<form class="w3-container w3-card-6 w3-grey"
			style="width: 700px; height: 300px; padding: 6% 5%;"
			action="mempicture.do" method="post" onsubmit="return inputchk(this)" enctype="multipart/form-data">
			<input type="hidden" name="email" value="${mem.email}">
			<table class="w3-table-all w3-border w3-white w3-center">
				<tr>
					<td rowspan="5" valign="top" style="text-align: center; width:100px; height:150px;">
					<div class="w3-center" style="border:1px solid grey; border-radius:40px; width:180px; height:160px;">
				<c:if test="${!empty mem.picture}">
    			<img class="w3-round w3-center" id="preview" src="picture/${mem.picture}" style="width:120px;height:150px; padding-top:10px">
    			</c:if>
    			<c:if test="${empty mem.picture}">
    			<img class="w3-round w3-center" id="preview" src="img/user.png" style="width:120px;height:150px; padding-top:10px">
    			</c:if>
    			</div>
							<input type="file" name="picture" id="imageFile" accept="img/*" style="display:none">
							<div style="width:200px"><div class="w3-button" onclick="onclick=document.all.imageFile.click()">사진추가</div>
							<input class="w3-button" type="submit" value="사진변경"></div>	
    			</td>
				<tr>
					<th>Email</th>
					<td>${mem.email}</td>
				</tr>
				<tr>
					<th>이름(별명)</th>
					<td>${mem.name}</td>
				</tr>
				<tr>
					<th>키</th>
					<td>${mem.height}cm</td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td>${mem.weight}kg</td>
				</tr>
			</table>
		</form>

	</div>
			<div class="w3-class" style="padding: 1%;">
			<p>
				<a class="w3-button w3-hover-green" href="javascript:void(0);"
					onclick="document.getElementById('update').style.display='block'"
					style="color: green;"> <i class="fa fa-refresh"></i>수정
				</a>
			</p>
		<c:if test="${mem.email ne 'admin'}">
				<p>
					<a class="w3-button w3-hover-red" href="javascript:void(0);"
						onclick="document.getElementById('delete').style.display='block'"
						style="color: red;"> <i class="fa fa-remove"></i>탈퇴
					</a>
				</p>
		</c:if>
	</div>

	<!-- 회원탈퇴 -->
	<div id="delete" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('delete').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
			</div>
			<form class="w3-container" action="delete.do" method="post">
				<input type="hidden" name="email" value="${mem.email}">
				<div class="w3-section">

					<label><b>비밀번호</b></label>
					<c:if test="${login eq 'admin'}">
						<input class="w3-input w3-border w3-margin-bottom" type="password"
							placeholder="관리자 비밀번호를 입력하세요" name="pass" required>
					</c:if>
					<c:if test="${login ne 'admin'}">
						<input class="w3-input w3-border w3-margin-bottom" type="password"
							placeholder="비밀번호를 입력하세요" name="pass" required>
					</c:if>
					<button class="w3-button w3-block w3-red w3-section w3-padding"
						type="submit">탈퇴</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 회원정보 수정 -->
	<div id="update" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('update').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
					<span onclick="document.getElementById('update').style.display='none';document.getElementById('pwchange').style.display='block'"
					class="w3-button w3-transparent w3-display-topleft"
					title="비밀번호변경">비밀번호변경</span>
			</div>
		
			<form class="w3-container" action="update.do" method="post">
				<div class="w3-section">
					<table class="w3-table-all w3-border w3-white w3-center">
					
					<caption style="text-align:center">회원정보수정</caption>
					<tr><th>Email</th>
					<td><input type="text" name="email" value="${mem.email}"
								readonly><font size="2" style="color:grey">변경 불가</font></td>
				</tr>
				<tr>
					<th>이름(별명)</th>
					<td><input type="text" name="name" value="${mem.name}"></td>
				</tr>
				<tr>
					<th>키</th>
					<td><input type="text" name="height" value="${mem.height}"  onKeyPress="return fn_onlyNumber();">cm</td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td><input type="text" name="weight" value="${mem.weight}"  onKeyPress="return fn_onlyNumber();">kg</td>
				</tr>
			</table>
			<br>
					<label><b>비밀번호</b></label> <c:if test="${login eq 'admin'}">
					<input class="w3-input w3-border w3-margin-bottom" type="password"
										placeholder="관리자 비밀번호를 입력하세요" name="pass" required>
						</c:if>
					<c:if test="${login ne 'admin'}">
					<input class="w3-input w3-border w3-margin-bottom" type="password"
										placeholder="비밀번호를 입력하세요" name="pass" required>
						</c:if>
						<button class="w3-button w3-block w3-green w3-section w3-padding"
									type="submit">수정</button>
				
						</div>
			</form>
		</div>
	</div>
<!-- 비밀번호 변경 -->
		<div id="pwchange" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('pwchange').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
					<span onclick="document.getElementById('pwchange').style.display='none';document.getElementById('update').style.display='block'"
					class="w3-button w3-transparent w3-display-topleft"
					title="회원정보수정">회원정보수정</span>
			</div>
			<form class="w3-container" action="pwchange.do" method="post" name="f"
			onsubmit="return inputchk(this)">
				<input type="hidden" name="email" value="${mem.email}">
				<div class="w3-section">
				
				<table class="w3-table-all w3-border w3-white w3-center">
				<caption style="text-align:center">비밀번호변경</caption></table>
				
					<label><b>현재 비밀번호</b></label>
						<input class="w3-input w3-border w3-margin-bottom" type="password"
							placeholder="현재 비밀번호를 입력하세요" name="nowpass" required>
					<label><b>변경 비밀번호</b></label>
						<input class="w3-input w3-border w3-margin-bottom" type="password"
							placeholder="변경하실 비밀번호를 입력하세요" name="pass" required>
					<label><b>변경 비밀번호 재입력</b></label>
						<input class="w3-input w3-border w3-margin-bottom" type="password"
							placeholder="비밀번호를 재입력 해주세요" name="pass2" required>
					<button class="w3-button w3-block w3-green w3-section w3-padding"
						type="submit">변경</button>
				</div>
			</form>
		</div>
	</div>
	
	
	
	
<!--  bmi측정기 -->
	<c:if test="${sessionScope.login ne 'admin'}">
		<div class="w3-container w3-half w3-margin-left"
			style="width: 60%; padding: 1% 3%;">
			<form class="w3-container w3-card-4 w3-grey"
				style="width: 700px; height: 320px;">
				<p>BMI계산기</p>
				<table class="w3-table w3-white">
					<tr>
						<td colspan="2">성별정보</td>
						<td colspan="2" style="text-align: center;">신체정보</td>
						<td colspan="2" style="text-align: center;">비만도결과</td>
					</tr>
					<tr>
						<th colspan="2">성별</th>

						<th>키(cm)</th>
						<td><input type="text" name="searchHeight" size="10"
							maxlength="5" value="${mem.height}" id="searchHeight"
							title="키를 입력해주세요" style="ime-mode: disabled;"
							onKeyPress="return fn_onlyNumber();"></td>
						<th>체질량지수</th>
						<td><input type="text" name="bmi" size="20" maxlength="100"
							value="" id="bmi" title="체질량지수를 입력해주세요" readonly></td>
					</tr>
					<tr>
						<td colspan="2"><label>남자<input type="radio"
								title="성별" name="searchSexFlag" id="searchSexFlagM"
								style="width: 25px;" checked>
						</label></td>

						<th>몸무게(kg)</th>
						<td><input type="text" name="searchWeight" size="10"
							maxlength="5" value="${mem.weight}" id="searchWeight"
							title="몸무게를 입력해주세요" style="ime-mode: disabled;"
							onKeyPress="return fn_onlyNumber();"></td>
						<th>비만도</th>
						<td><input type="text" name="bmiTxt" size="20"
							maxlength="100" value="" id="bmiTxt" title="검색결과를 입력해주세요"
							readonly></td>
					</tr>
					<tr>
						<td colspan="2"><label>여자<input type="radio"
								title="성별" name="searchSexFlag" id="searchSexFlagF"
								style="width: 25px; ">
						</label></td>
						<th></th>
						<td></td>
						<td></td>
						<td><a href="javascript:;" class="btn btn-default btn-block"
							onClick="javascript:fn_reset();"
							style="text-align:center;width:auto;">초기화</a></td>
					</tr>
					<tr>
						<td colspan="6" style="text-align: center"><a
							href="javascript:fn_calBMI();" class="btn btn-default btn-block">계산하기</a></td>
					</tr>
				</table>
			</form>
			
		</div>
		
	</c:if>
	
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