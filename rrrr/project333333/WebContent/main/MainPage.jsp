<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/main.css" rel="stylesheet">
<link href="../CSS/modal.css" rel="stylesheet">
<title>mainpage</title>
</head>
<style>
</style>

<body>
	<div class="wrapper">
		<div class="header">
			<div class="logo">�ΰ�</div>
			<div class="nav">
				<button class="login">�α���</button>
				<button class="signup">ȸ������</button>
			</div>
			<%-- ��� â --%>
			<form method="post" action="/project333333/member.do">
				<div class="modal-bg">
					<div class="modal">
						<h2>ȸ������</h2>
						<table class="table">
							<tr>
								<td><label for="id"> ���̵� : </label></td>
								<td><input type="text" name="id"></td>
							</tr>
							<tr>
								<td><label for="pw"> �н����� : </label></td>
								<td><input type="password" name="pw"></td>
							</tr>
							<tr>
								<td><label for="name"> �̸� : </label></td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td><label for="sex"> ���� : </label></td>
								<td><input type="text" name="sex"></td>
							</tr>
							<tr>
								<td><label for="tel"> ��ȭ��ȣ : </label></td>
								<td><input type="text" name="tel"></td>
							</tr>
							<tr>
								<td><label for="addr"> �ּ� : </label></td>
								<td><input type="text" name="addr"></td>
							</tr>
							<tr>
								<td><label for="email"> �̸��� : </label></td>
								<td><input type="text" name="email"></td>
							</tr>
							<tr>
								<td><label for="room"> ���ȣ : </label></td>
								<td><input type="text" name="room"></td>
							</tr>
						</table>
						<button>�Ϸ�</button>
						<input class="cancel" type="button" value="���"> <span
							class="modal-close">X</span>
					</div>
				</div>
			</form>

			<form method="post" action="/project333333/Login.do">
				<div class="modal-login">
					<div class="modal_log">
						<h2>�α���</h2>
						<table class="table">
							<tr>
								<td><label for="id"> ���̵� : </label></td>
								<td><input type="text" name="loginid"></td>
							</tr>
							<tr>
								<td><label for="pw"> �н����� : </label></td>
								<td><input type="password" name="loginpw"></td>
							</tr>
						</table>
						<button>�α���</button>
						<span class="login-close">X</span>
					</div>
				</div>
			</form>



			<%-- ��� â --%>
		</div>
		<div class="main">
			<div class="title"></div>
		</div>
		<div class="main2">
			<div class="title2">ABOUT</div>
			<div class="content">
				<div class="img-bg">
					<div class="image"></div>
					<div class="imgtext"></div>
				</div>
				<div class="img-bg">
					<div class="image"></div>
					<div class="imgtext"></div>
				</div>
				<div class="img-bg">
					<div class="image"></div>
					<div class="imgtext"></div>
				</div>
				<div class="img-bg">
					<div class="image"></div>
					<div class="imgtext"></div>
				</div>
			</div>

		</div>
	</div>




	<script src="../JS/modal.js"></script>
</body>

</html>