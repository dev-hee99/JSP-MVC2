<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script type="text/javascript">
	function inputchk(f) {
		if (f.email.value == '') {
			alert("�̸����� �Է��ϼ���.")
			f.id.focus()
			return false;
		}
		if (f.pass.value == '') {
			alert("��й�ȣ�� �Է��ϼ���.")
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
					style="border-radius: 25px; width: 150px" type="submit" value="�α���">
			</p>
			<input class="w3-bar-item w3-button"
				style="border-radius: 25px; width: 150px" type="button" value="ȸ������"
				onclick="location.href='Expjoin.do'"> 
				<input
				class="w3-bar-item w3-button"
				style="border-radius: 25px; width: 150px" type="button"
				value="��й�ȣ ã��"
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
					title="â �ݱ�">&times;</span>
			</div>

			<form class="w3-container" action="pw.do" method="post">
				<div class="w3-section">
					<label><b>�̸���</b></label> 
					<input class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="�̸����� �Է��ϼ���" name="email" required>
						<label><b>��й�ȣã�� ����</b></label>
					<select name="pwque">
							<option>�����ϼ���</option>
							<option>���� ���� �����ϴ� ���</option>
							<option>���� ����(���� 0130)</option>
							<option>���� ���� �Ƴ��� ����</option>
							<option>���� ��� �ʵ��б�</option>
							<option>���� �����ϴ� ����</option>
					</select>
					<input class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="��й�ȣ ã�� �亯�� �Է��ϼ���." name="pwans" required>
						<button class="w3-button w3-block w3-green w3-section w3-padding"
							type="submit">��й�ȣ ã��</button>
				</div>
			</form>

			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button
					onclick="document.getElementById('pwsearch').style.display='none'"
					type="button" class="w3-button w3-red">���</button>
			</div>

		</div>

	</div>

</body>
</html>