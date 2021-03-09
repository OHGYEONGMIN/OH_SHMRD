<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/calendar.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"
	charset="UTF-8"></script>
<script src="http://code.jquery.com/jquery-latest.js" charset="UTF-8"></script>

<title>AdminPage_전력소비량</title>
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

			<div class="chart_electric">
				<div class="electric_month">
					<div class="my-calendar">
						<div class="calendar-box">
							<div class="ctr-box">
								<button type="button" title="prev" class="btn-cal prev">
								</button>
								<span class="cal-month"></span> <span class="cal-year"></span>
								<button type="button" title="next" class="btn-cal next">
								</button>
							</div>
							<table class="cal-table" style="height: 100px">
								<thead>
									<tr>
										<th class="red">S</th>
										<th class="black">M</th>
										<th class="black">T</th>
										<th class="black">W</th>
										<th class="black">T</th>
										<th class="black">F</th>
										<th class="blue">S</th>
									</tr>
								</thead>
								<tbody class="cal-body"></tbody>
							</table>
						</div>
					</div>


				</div>
				<div class="electric_yesterday">
					<div class="chart-div">
						<canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
					</div>
				</div>
				<div class="electric_week">
					<div></div>
					<div class="week_h3">
						<h3>각 방별 사용량</h3>
					</div>
					<div></div>
					<div></div>
					<div class="chart-div">
						<canvas id="barChartCanvas" width="780px" height="280px"></canvas>
					</div>
					<div></div>
				</div>
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
			</aside>
		</div>
	</div>

	<script src="../JS/AdminCalendar.js" charset="UTF-8"></script>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>