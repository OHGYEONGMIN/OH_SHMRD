<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/project333333/CSS/style.css" rel="stylesheet">
<link href="/project333333/CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>게시물 내용 ${vo.content }</title>
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
							class="fas fa-charging-station fa-2x"></i>&nbsp; 전력 소비량</a>
					</div>
					<div class="menu">
						<a href="UserSection.jsp" class="navitem"><i
							class="fas fa-chart-line fa-2x"></i>&nbsp; 구역별 소비량</a>
					</div>
					<div class="menu">
						<a href="UserPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; 게시판</a>
					</div>
					<div class="menu">
						<a href="UserSelectRoom.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; 방 선택</a>
					</div>
				</div>
			</div>
			<div class="chart_board_post">
				<div>
					<h2>게시판</h2>
				</div>
				<div>
					<h3>게시물 제목</h3>
					<div id="" style="width: 99.5%; height: 40px;">${vo.title }</div>
				</div>
				<div>
					<br>
					<h3>게시글 내용</h3>
					<form action="" method="POST">
						<div class="board_list"></div>
						<div>
							<div id="" style="width: 99.5%; height: 450px;">
								<p>${vo.content }</p>
							</div>
						</div>
					</form>
				</div>
				<div>
					<button onclick="location.href='./adminpage4_list.html'"
						class="post">게시물 올리기</button>
				</div>
			</div>

			<aside>
				<div class="container" id="container">
					<div class="on-off" id="on-off">
						<i class="fas fa-power-off fa-2x"></i>
					</div>
				</div>
				<div class="profile">
					<div class="profile_img">
						<img src="../image/woman.png" class="about_img" alt="">
					</div>

					<div class="user_name">
						<h3>USER NAME</h3>
					</div>
				</div>
				<div class="alert_msg">
					<h3>알림</h3>
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