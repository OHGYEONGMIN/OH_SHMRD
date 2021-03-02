<%@page import="java.io.Console"%>
<%@page import="CalculationE.Calculation"%>
<%@page import="Model.ElectricVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ElectricDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String room = (String) session.getAttribute("room");
String mm = (String) session.getAttribute("mm");
ElectricDAO dao = new ElectricDAO();
ArrayList<String> perview = dao.wh_month_room(room, mm);
ArrayList<String> monthview = dao.wh_month(room, mm);
ArrayList<String> r1view = dao.wh_month_room1(room, mm);
ArrayList<String> r2view = dao.wh_month_room2(room, mm);
ArrayList<String> r3view = dao.wh_month_room3(room, mm);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<title>납부 관리</title>
</head>
<style>
</style>
<body>

	<%
	//전체사용량
	int sumview = 0;
	for (int i = 0; i < monthview.size(); i++) {
		int a = Integer.parseInt(monthview.get(i));
		sumview += a;
	}
	//로그인한 개인사용량
	int persum = 0;
	for (int i = 0; i < perview.size(); i++) {
		int a = Integer.parseInt(perview.get(i));
		persum += a;
	}
	//각 방 사용량
	//room1
	int room1 = 0;
	for (int i = 0; i < r1view.size(); i++) {
		int a = Integer.parseInt(r1view.get(i));
		room1 += a;
	}
	//room2
	int room2 = 0;
	for (int i = 0; i < r2view.size(); i++) {
		int a = Integer.parseInt(r2view.get(i));
		room2 += a;
	}
	//room3
	int room3 = 0;
	for (int i = 0; i < r3view.size(); i++) {
		int a = Integer.parseInt(r3view.get(i));
		room3 += a;
	}
	//계산편하게 하기
	/* 	sumview = sumview/10;
		persum = persum/10;
		room1 = room1/10;
		room2 = room2/10;
		room3 = room3/10; */

	//요금계산
	Calculation cal = new Calculation();
	int basicpay = cal.Calculater_basic(sumview);
	int totalpay = cal.Calculater_total(sumview);
	int taxpay = cal.Calculater_taxpay(sumview);
	int fundpay = cal.Calculater_fundpay(sumview);

	//내 요금 계산
	int total = (totalpay * persum) / sumview;
	%>

	<div class="wrapper_admin">
		<div class="adminpage">
			<div class="adminNav">
				<div class="logo">
					<a href="adminpage1.html" class="logoitem"><i
						class="fas fa-home fa-3x">Enf</i></a>
				</div>
				<div class="list_group">
					<div class="menu">
						<a href="adminpage1.html" class="navitem"><i
							class="fas fa-charging-station fa-2x"></i>&nbsp; 전력 소비량</a>
					</div>
					<div class="menu">
						<a href="adminpage2.html" class="navitem"><i
							class="fas fa-chart-line fa-2x"></i>&nbsp; 구역별 소비량</a>
					</div>
					<div class="menu">
						<a href="adminpage3_userpay.html" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
					</div>
					<div class="menu">
						<a href="adminpage4_list.html" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; 게시판</a>
					</div>
					<div class="menu">
						<a href="adminpage5_approve.html" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; 회원 승인</a>
					</div>
				</div>
			</div>
			<div class="chart_usage">
				<div class="table">
					<h3>납부 금액 표</h3>
					<table class="payment_tbl">
						<th>내용</th>
						<th>가격</th>
						<tr>
							<td>계약 종별</td>
							<td>주택용(고압)-주거용</td>
						</tr>
						<tr>
							<td>사용량</td>

							<td><%=sumview%>Kwh</td>
						</tr>
						<th colspan="2">청구 금액</th>
						<tr>
							<td>기본요금</td>
							<td><%=basicpay%> 원</td>
						</tr>
						<tr>
							<td>전력량 요금</td>
							<td><%=totalpay%> 원</td>
						</tr>
						<th colspan="2">부가가치세 계산 내역</th>
						<tr>
							<td>부가 가치세</td>
							<td><%=taxpay%> 원</td>
						</tr>
						<th colspan="2">전력산업 기반 기금</th>
						<tr>
							<td class="radius1">전력산업기반기금</td>
							<td class="radius2"><%=fundpay%> 원</td>
						</tr>
					</table>
				</div>

				<div class="room_usage">
					<div class="room_payment">
						<h3>100호 사용량</h3>
						<table class="room_tbl">
							<th>방 번호</th>
							<th>사용량</th>
							<tr>
								<td>Room 101</td>
								<td><%=room1%>Kwh</td>
							</tr>
							<tr>
								<td>Room 102</td>
								<td><%=room2%>Kwh</td>
							</tr>

							<tr>
								<td>Room 103</td>
								<td><%=room3%>Kwh</td>
							</tr>
							<tr>
								<th class="radius1">전체 요금</th>
								<th class="radius2"><%=totalpay%> 원</th>
							</tr>

						</table>
					</div>
					<div class="personal_payment">
						<h3>총 납부 금액</h3>
						<table class="total_payment">
							<tr>
								<th>총사용량</th>
								<th>개인사용량</th>
							</tr>
							<tr>
								<td><%=sumview%>Kwh</td>
								<td><%=persum%>Kwh</td>
							</tr>
							<tr>
								<th>납부 금액</th>
								<th><%=total%> 원</th>
							</tr>
						</table>
					</div>

				</div>

			</div>

			<aside>
				<button class="logout"
					onClick="location.href='/project333333/main/MainPage.jsp'">
					LOGOUT</button>
				<div class="profile">
					<div class="profile_img">
						<img src="../image/man.png" class="about_img" alt="">
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
	</div>
	<script src="../JS/monthreset.js" charset="UTF-8"></script>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>

</html>
