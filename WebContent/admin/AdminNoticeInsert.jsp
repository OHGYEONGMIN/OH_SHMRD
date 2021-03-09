<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>게시물 내용</title>
</head>
<%
String room = (String) session.getAttribute("room");
String name = (String) session.getAttribute("name");
%>
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
						<a href="AdminTotalPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; 게시판</a>
					</div>
					<div class="menu">
						<a href="AdminApprove.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; 승인 목록</a>
					</div>
				</div>
			</div>
			<div class="chart_board_post">
				<form action="/project333333/BoardInsert.do" method="POST">
					<div>
						<h2>게시판</h2>
					</div>
					<div>
						<h3>게시물 제목</h3>
						<textarea name="title" id="" style="width: 99.5%; height: 40px;"
							rows="2" placeholder="제목을 입력하세요."></textarea>
					</div>
					<div>
						<br>
						<h3>게시물 내용</h3>

						<div class="board_list"></div>
						<div>
							<textarea name="content" id=""
								style="width: 99.5%; height: 400px;" rows="8"
								placeholder="내용을 입력하세요."></textarea>
						</div>

					</div>
					<div>
						<input type="submit" value="게시물 올리기" class="post">
					</div>
				</form>
			</div>

			<aside>
				<div class="container" id="container">
					<div class="on-off" id="on-off">
						<i class="fas fa-power-off fa-2x" onClick="location.href='/project333333/main/MainPage.jsp'"></i>
					</div>
				</div>
				<div class="profile">
					<div class="profile_img">
						<img src="/project333333/image/man.png" class="about_img" alt="">
					</div>

					<div class="user_name">
						<h3>
						<%=name%>님,&nbsp;환영합니다!<br>
						</h3>
					</div>
				</div>
			<div class="alert_msg">
					<h3><i class="fas fa-bullhorn"></i>&nbsp;알림</h3>
					<div class="alert1">- 공용공간은 깨끗이!</div>
					<div class="alert2">- 이웃간의 소음 주의!</div>
					<div class="alert3">
						- 세탁실 사용시간 :<br>&nbsp;&nbsp;&nbsp;오전 9시 ~ 오후 9시
					</div>
					<div class="alert4">
						- 재활용품 수거일 :<br>&nbsp;&nbsp; 화,금(주 2회)
					</div>
				</div>
		</div>
		</aside>
	</div>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>
s
