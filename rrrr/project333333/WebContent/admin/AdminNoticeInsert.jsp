<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<title>�Խù� ����</title>
</head>
<style>
</style>
<body>
	<div class="wrapper_admin">

		<div class="adminpage">
			   <div class="adminNav">
                <div class="logo">
                    <a href="adminpage1.html" class="logoitem"><i class="fas fa-home fa-3x">Enf</i></a>
                </div>
                <div class="list_group">
                    <div class="menu">
                        <a href="adminpage1.html" class="navitem"><i class="fas fa-charging-station fa-2x"></i>&nbsp; ����
                            �Һ�</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage2.html" class="navitem"><i class="fas fa-chart-line fa-2x"></i>&nbsp; ������
                            �Һ�</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage3_userpay.html" class="navitem"><i
                                class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; ���� ����</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage4_list.html" class="navitem"><i class="far fa-comment-dots fa-2x"></i>&nbsp;
                            �Խ���</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage5_approve.html" class="navitem"><i class="fas fa-users-cog fa-2x"></i>&nbsp;
                            ȸ�� ����</a>
                    </div>
                </div>
            </div>
			<div class="chart_board_content">
				<div>�Խ���</div>
				<div>�Խù� ����</div>
				<div>�Խù� ����</div>
				<div>
					<button onclick="location.href='./adminpage4_list.html'"
						class="post">�Խù��ø���</button>
				</div>
			</div>
			<aside>
				<button class="logout">�α׾ƿ�</button>
				<div class="profile">
					<div class="profile_img">
						<img src="../image/woman.png" class="about_img" alt="">
					</div>

					<div>USER NAME</div>
				</div>
				<div class="alert_msg">
					<div class="alert">�˸�</div>
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