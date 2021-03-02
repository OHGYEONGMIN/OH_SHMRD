<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/calendar.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>Userpage_���¼Һ�</title>
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
							<table class="cal-table" style="height:100px">
								<thead>
									<tr>
										<th>S</th>
										<th>M</th>
										<th>T</th>
										<th>W</th>
										<th>T</th>
										<th>F</th>
										<th>S</th>
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
					<div class="chart-div" >
						<canvas id="barChartCanvas" width="700px" height="320px"></canvas>
					</div>
				</div>
			</div>

			<aside>
				<button class="logout">�α׾ƿ�</button>
				<div class="profile">
					<div class="profile_img">
						<img src="../image/man.png" class="about_img" alt="">
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
		<script src="../JS/UserCalendar.js" charset="UTF-8"></script>
		<script src="../JS/monthreset.js" charset="UTF-8"></script>
		<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>