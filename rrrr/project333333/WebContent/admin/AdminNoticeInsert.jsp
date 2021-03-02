<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<title>게시물 내용</title>
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
                        <a href="adminpage1.html" class="navitem"><i class="fas fa-charging-station fa-2x"></i>&nbsp; 전력
                            소비량</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage2.html" class="navitem"><i class="fas fa-chart-line fa-2x"></i>&nbsp; 구역별
                            소비량</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage3_userpay.html" class="navitem"><i
                                class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage4_list.html" class="navitem"><i class="far fa-comment-dots fa-2x"></i>&nbsp;
                            게시판</a>
                    </div>
                    <div class="menu">
                        <a href="adminpage5_approve.html" class="navitem"><i class="fas fa-users-cog fa-2x"></i>&nbsp;
                            회원 승인</a>
                    </div>
                </div>
            </div>
			<div class="chart_board_content">
				<div>게시판</div>
				<div>게시물 제목</div>
				<div>게시물 내용</div>
				<div>
					<button onclick="location.href='./adminpage4_list.html'"
						class="post">게시물올리기</button>
				</div>
			</div>
			<aside>
				<button class="logout">로그아웃</button>
				<div class="profile">
					<div class="profile_img">
						<img src="../image/woman.png" class="about_img" alt="">
					</div>

					<div>USER NAME</div>
				</div>
				<div class="alert_msg">
					<div class="alert">알림</div>
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