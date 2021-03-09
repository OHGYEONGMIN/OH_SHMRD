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
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>Userpage_���¼Һ�</title>
<%
String name = (String) session.getAttribute("name");
String room = (String) session.getAttribute("room");
%>
</head>
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
						<h3>�ְ� ���·� ������</h3>
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
						<img src="../image/woman.png" class="about_img" alt="">
					</div>

					<div class="user_name">
						<h3>
							<%=name%>��,&nbsp;ȯ���մϴ�!<br>
							�� ���� : <%=room%>ȣ
						</h3>
					</div>
				</div>
				<div class="alert_msg">
					<h3><i class="fas fa-bullhorn"></i>&nbsp;�˸�</h3>
					<div class="alert1">- ��������� ������!</div>
					<div class="alert2">- �̿����� ���� ����!</div>
					<div class="alert3">
						- ��Ź�� ���ð� :<br>&nbsp;&nbsp;&nbsp;���� 9�� ~ ���� 9��
					</div>
					<div class="alert4">
						- ��Ȱ��ǰ ������ :<br>&nbsp;&nbsp; ȭ,��(�� 2ȸ)
					</div>
				</div>
			</aside>
		</div>
	</div>
	<script type="text/javascript">
		let ctx = document.getElementById('pieChartCanvas').getContext('2d');

		let pieChartData = {
			labels : [ 'A', 'B'],
			datasets : [ {
				data : [ 4, 2 ],
				backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)'
						 ]
			} ]
		};

		var chart = new Chart(ctx, {
			type : 'pie',
			data : pieChartData,
			options : {
				plugins : {
					labels : {
						render : 'percentage',
						showActualPercentages : true
					}
				}
			}
		});

		//bar chart
		let ctx2 = document.getElementById('barChartCanvas').getContext('2d');
		var myBarChart = new Chart(ctx2, {
			type : 'bar',
			data : {
				labels : [ "7��", "8��", "9��", "10��", "11��", "12��", "13��" ],
				datasets : [ {

					data : [ 13, 11, 14, 15, 12, 17, 19, 17, 16 ],
					backgroundColor : [ "rgba(255,1,1,0.5)", "rgb(255, 159, 64)", "rgb(255, 100, 100)", "rgba(1,255,1,0.5)",
						"rgba(100,255,100,0.5)", "rgba(1,1,255,0.5)", "rgb(25,42,86)"],
				} ]
			},
			options : {
				legend : {
					display : false
				},
				hover : {
					mode : 'index'
				},
				responsive : false,
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : "rgba(225,225,225)",
							fontSize : 20
						},
						gridLines : {
							color : "rgba(0,0,0,0)"
						}
					} ],
					yAxes : [ {

						gridLines : {
							color : "rgba(0,0,0,0)"
						},
						ticks : {
							beginAtZero : true,
							stepSize : 10,
							fontColor : "rgba(225,225,225)",
							fontSize : 20
						}
					} ]
				}
			}
		});
	</script>
	<script src="../JS/UserCalendar.js" charset="UTF-8"></script>
	<script src="../JS/monthreset.js" charset="UTF-8"></script>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>