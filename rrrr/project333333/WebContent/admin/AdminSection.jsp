<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<title>구역별 소비량</title>
</head>
<style>
</style>
<body>
	<div class="wrapper_admin">
		<div class="adminpage">
			<div class="adminNav">
				<div class="logo">
					<a href="AdminTotalPower.jsp" class="logoitem"><i
						class="fas fa-home fa-3x">Enf</i></a>
				</div>
				<div class="list_group">
					<div class="menu">
						<a href="AdminTotalPower.jsp" class="navitem"><i
							class="fas fa-charging-station fa-2x"></i>&nbsp; 전력 소비량</a>
					</div>
					<div class="menu">
						<a href="AdminSection.jsp" class="navitem"><i
							class="fas fa-chart-line fa-2x"></i>&nbsp; 구역별 소비량</a>
					</div>
					<div class="menu">
						<a href="AdminTotalPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; 게시판</a>
					</div>
					<div class="menu">
						<a href="AdminApprove.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; 회원 승인</a>
					</div>
				</div>
			</div>
			<div class="chart_section">
				<div class="public">공용기기 사용량</div>
				<div class="personal">방별 사용량</div>

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
</body>
</html>