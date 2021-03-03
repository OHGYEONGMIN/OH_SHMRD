<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>�Խù� ����</title>
</head>
<style>
</style>
<body>
	<div class="wrapper_admin">
		<div class="adminpage">
			<div class="adminNav">
				<div class="logo">
					<a href="UserTotalPower.jsp" class="logoitem"><i
						class="fas fa-home fa-3x">Enf</i></a>
				</div>
				<div class="list_group">
					<div class="menu">
						<a href="UserTotalPower.jsp" class="navitem"><i
							class="fas fa-charging-station fa-2x"></i>&nbsp; ���� �Һ�</a>
					</div>
					<div class="menu">
						<a href="UserSection.jsp" class="navitem"><i
							class="fas fa-chart-line fa-2x"></i>&nbsp; ������ �Һ�</a>
					</div>
					<div class="menu">
						<a href="UserPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; ���� ����</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; �Խ���</a>
					</div>
					<div class="menu">
						<a href="UserSelectRoom.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; �� ����</a>
					</div>
				</div>
			</div>
			<div class="chart_board_post">
				<div>
					<h2>�Խ���</h2>
				</div>
				<div>
					<h3>���</h3>
					<form action="/smgrid/Write.do" method="POST"></form>
					<textarea name="title" id="" style="width: 99.5%; height: 40px;"
						rows="2">Re : ${title }</textarea>
				</div>
				<div>
					<br>
					<h3>�Խù� ����</h3>
					<form action="" method="POST">
						<div class="board_list"></div>
						<div>
							<textarea name="content" id=""
								style="width: 99.5%; height: 300px;" rows="8"
								placeholder="������ �Է��ϼ���.">���� �ȿ� ���� ���� ������</textarea>
							<br>�� �Ʒ��� -------------���ִ� ����� �����Ѱ�?
						</div>
					</form>
				</div>
				<div>�����ϱ�</div>
			</div>

			<aside>
				<div class="container" id="container">
					<div class="on-off" id="on-off">
						<i class="fas fa-power-off fa-2x"></i>
					</div>
				</div>
				<div class="profile">
					<div class="profile_img">
						<img src="./image/woman.png" class="about_img" alt="">
					</div>

					<div class="user_name">
						<h3>USER NAME</h3>
					</div>
				</div>
				<div class="alert_msg">
					<h3>�˸�</h3>
					<div class="alert1">1</div>
					<div class="alert2">2</div>
					<div class="alert3">3</div>
					<div class="alert4">4</div>
				</div>
			</aside>
		</div>
		<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>