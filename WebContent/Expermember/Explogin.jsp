<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script type="text/javascript">
	function inputchk(f) {
		if (f.email.value == '') {
			alert("이메일을 입력하세요.")
			f.id.focus()
			return false;
		}
		if (f.pass.value == '') {
			alert("비밀번호를 입력하세요.")
			f.pass.focus()
			return false;
		}
	}
</script>
</head>
<body>
	<div class="w3-container w3-half w3-margin-left"
		style="width: 100%; height: 100%; padding: 5% 40%;">

		<form class="w3-container w3-card-4"
			style="width: 350px; height: 350px;" action="login.do" method="post"
			name="f" onsubmit="return inputchk(this)">
			<p>
				<label>Email</label> <input class="w3-input" type="text"
					name="email" style="width: 90%" required>
			</p>
			<p>
				<label>Password</label> <input class="w3-input" type="password"
					name="pass" style="width: 90%" required>
			</p>
			<p style="text-align: center;">
				<input class="w3-button w3-section w3-teal w3-ripple w3-black"
					style="border-radius: 25px; width: 150px" type="submit" value="로그인">
			</p>
			<input class="w3-bar-item w3-button"
				style="border-radius: 25px; width: 150px" type="button" value="회원가입"
				onclick="location.href='Expjoin.do'"> 
				<input
				class="w3-bar-item w3-button"
				style="border-radius: 25px; width: 150px" type="button"
				value="비밀번호 찾기"
				onclick="document.getElementById('pwsearch').style.display='block'">
		</form>
	</div>
	<div id="pwsearch" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 600px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('pwsearch').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
			</div>

			<form class="w3-container" action="pw.do" method="post">
				<div class="w3-section">
					<label><b>이메일</b></label> 
					<input class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="이메일을 입력하세요" name="email" required>
						<label><b>비밀번호찾기 질문</b></label>
					<select name="pwque">
							<option>선택하세요</option>
							<option>내가 가장 존경하는 사람</option>
							<option>나의 생일(예시 0130)</option>
							<option>내가 가장 아끼는 물건</option>
							<option>나의 출신 초등학교</option>
							<option>내가 좋아하는 게임</option>
					</select>
					<input class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="비밀번호 찾기 답변을 입력하세요." name="pwans" required>
						<button class="w3-button w3-block w3-green w3-section w3-padding"
							type="submit">비밀번호 찾기</button>
				</div>
			</form>

			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button
					onclick="document.getElementById('pwsearch').style.display='none'"
					type="button" class="w3-button w3-red">취소</button>
			</div>

		</div>

	</div>

</body>
</html>