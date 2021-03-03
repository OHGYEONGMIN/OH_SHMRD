<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@page import="CalculationE.Calculation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ElectricDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous" charset="UTF-8"></script>
<link href="../CSS/calendar.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<title>납부 관리</title>
</head>
<%
String mm = (String) session.getAttribute("mm");
ElectricDAO dao = new ElectricDAO();
ArrayList<String> monthview101 = dao.wh_month_room1("101", mm);
ArrayList<String> monthview102 = dao.wh_month_room2("102", mm);
ArrayList<String> monthview103 = dao.wh_month_room3("103", mm);
ArrayList<String> monthview201 = dao.wh_month_room1("201", mm);
ArrayList<String> monthview202 = dao.wh_month_room2("202", mm);
ArrayList<String> monthview203 = dao.wh_month_room3("203", mm);
ArrayList<String> monthview301 = dao.wh_month_room1("301", mm);
ArrayList<String> monthview302 = dao.wh_month_room2("302", mm);
ArrayList<String> monthview303 = dao.wh_month_room3("303", mm);
%>


<body>
	<%
	// 101~303까지 전체 사용량
	int[] sumview = new int[9];
	for (int i = 0; i < monthview101.size(); i++) {
		int a = Integer.parseInt(monthview101.get(i));
		sumview[0] += a;
	}
	for (int i = 0; i < monthview102.size(); i++) {
		int a = Integer.parseInt(monthview102.get(i));
		sumview[1] += a;
	}
	for (int i = 0; i < monthview103.size(); i++) {
		int a = Integer.parseInt(monthview103.get(i));
		sumview[2] += a;
	}
	for (int i = 0; i < monthview201.size(); i++) {
		int a = Integer.parseInt(monthview201.get(i));
		sumview[3] += a;
	}
	for (int i = 0; i < monthview202.size(); i++) {
		int a = Integer.parseInt(monthview202.get(i));
		sumview[4] += a;
	}
	for (int i = 0; i < monthview203.size(); i++) {
		int a = Integer.parseInt(monthview203.get(i));
		sumview[5] += a;
	}
	for (int i = 0; i < monthview301.size(); i++) {
		int a = Integer.parseInt(monthview301.get(i));
		sumview[6] += a;
	}
	for (int i = 0; i < monthview302.size(); i++) {
		int a = Integer.parseInt(monthview302.get(i));
		sumview[7] += a;
	}
	for (int i = 0; i < monthview303.size(); i++) {
		int a = Integer.parseInt(monthview303.get(i));
		sumview[8] += a;
	}
	//-------------------------------------------------
	//호실별 사용량
	int sum100 = sumview[0] + sumview[1] + sumview[2];
	int sum200 = sumview[3] + sumview[4] + sumview[5];
	int sum300 = sumview[6] + sumview[7] + sumview[8];
	int sumAll = sum100 + sum200 + sum300;
	%>



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
			<div class="admin_chart_usage">


				<div class="room_payment">
					<h3>100호 사용량</h3>
					<table class="room_tbl">
						<th>방 번호</th>
						<th>사용량</th>
						<tr>
							<td>101호</td>
							<td><%=sumview[0]%>Kwh</td>
						</tr>
						<tr>
							<td>102호</td>
							<td><%=sumview[1]%>Kwh</td>
						</tr>

						<tr>
							<td>103호</td>
							<td><%=sumview[2]%>Kwh</td>
						</tr>
						<tr class="total_hover">

							<th>총 사용량</th>
							<th><%=sum100%>Kwh</th>

						</tr>

					</table>
				</div>

				<div class="room_payment">
					<h3>200호 사용량</h3>
					<table class="room_tbl">
						<th>방 번호</th>
						<th>사용량</th>
						<tr>
							<td>201호</td>
							<td><%=sumview[3]%>Kwh</td>
						</tr>
						<tr>
							<td>202호</td>
							<td><%=sumview[4]%>Kwh</td>
						</tr>

						<tr>
							<td>203호</td>
							<td><%=sumview[5]%>Kwh</td>
						</tr>
						<tr>
							<th class="radius1">총 사용량</th>
							<th class="radius2"><%=sum200%>Kwh</th>
						</tr>

					</table>
				</div>

				<div class="room_payment">
					<h3>300호 사용량</h3>
					<table class="room_tbl">
						<th>방 번호</th>
						<th>사용량</th>
						<tr>
							<td>301호</td>
							<td><%=sumview[6]%>Kwh</td>
						</tr>
						<tr>
							<td>302호</td>
							<td><%=sumview[7]%>Kwh</td>
						</tr>

						<tr>
							<td>303호</td>
							<td><%=sumview[8]%>Kwh</td>
						</tr>
						<tr>
							<th class="radius1">총 사용량</th>
							<th class="radius2"><%=sum300%>Kwh</th>
						</tr>

					</table>
				</div>

				<div class="room_payment">
					<h3>전체 사용량</h3>
					<table class="room_tbl">
						<th>방 호실</th>
						<th>전체 사용량</th>
						<tr>
							<td>100호</td>
							<td><%=sum100%>Kwh</td>
						</tr>
						<tr>
							<td>200호</td>
							<td><%=sum200%>Kwh</td>
						</tr>

						<tr>
							<td>300호</td>
							<td><%=sum300%>Kwh</td>
						</tr>
						<tr>
							<th class="radius1">총 사용량</th>
							<th class="radius2"><%=sumAll%>Kwh</th>
						</tr>

					</table>
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
						<img src="../image/man.png" class="about_img" alt="">
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
	</div>
	<script src="../JS/icon.js" charset="UTF-8"></script>
	<script src="../JS/AdminCalendar.js" charset="UTF-8"></script>
</body>

</html>