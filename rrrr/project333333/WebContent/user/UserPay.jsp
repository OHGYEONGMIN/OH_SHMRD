<%@page import="java.io.Console"%>
<%@page import="CalculationE.Calculation"%>
<%@page import="Model.ElectricVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ElectricDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String room = (String) session.getAttribute("room");
ElectricDAO dao = new ElectricDAO();
ArrayList<String> Eview = dao.room_wh(room);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<title>납부 관리</title>
</head>
<style>
</style>
<body>
	<%
	int rm1 = Integer.parseInt(Eview.get(0));
	int rm2 = Integer.parseInt(Eview.get(1));
	int rm3 = Integer.parseInt(Eview.get(2));
	int total = rm1 + rm2 + rm3;

	Calculation cal = new Calculation();
	int basicpay = cal.Calculater_basic(total);
	int totalpay = cal.Calculater_total(total);
	int taxpay = cal.Calculater_taxpay(total);
	int fundpay = cal.Calculater_fundpay(total);

	int room_num = Integer.parseInt(room.toString().substring(2));
	int temp = 0;
	if (room_num == 1) {
		temp = rm1;
	}
	if (room_num == 2) {
		temp = rm2;
	}
	if (room_num == 3) {
		temp = rm3;
	}
	int re = totalpay*temp/total;
	%>
	
	<div class="wrapper_admin">
		<div class="adminpage">
			<div class="adminNav">
				<div class="logo">Logo</div>
				<a href="UserTotalPower.jsp">
					<div class="link">
						<img src="../image/setting.png" width="20px">
						<h2>전력소비량</h2>
					</div> <a href="UserSection.jsp">
						<div class="link">
							<img src="../image/setting.png" width="20px">
							<h2>구역별 소비량</h2>
						</div>
				</a> <a href="UserPay.jsp">
						<div class="link">
							<img src="../image/setting.png" width="20px">
							<h2>납부관리</h2>
						</div>
				</a> <a href="UserNotice.jsp">
						<div class="link">
							<img src="../image/setting.png" width="20px">
							<h2>게시판</h2>
						</div>
				</a> <a href="userpage5_chooseroom.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>방 선택</h2>
						</div>
				</a>
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

							<td><%=total%>Kwh</td>
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
							<td class="radius2"><%=fundpay%></td>
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
								<td><%=rm1%>Kwh</td>
							</tr>
							<tr>
								<td>Room 102</td>
								<td><%=rm2%>Kwh</td>
							</tr>

							<tr>
								<td>Room 103</td>
								<td><%=rm3%>Kwh</td>
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
								<td><%=total%>Kwh</td>
								<td><%=temp %>Kwh</td>
							</tr>
							<tr>
								<th>납부 금액</th>
								<th><%=re %> 원</th>
							</tr>
						</table>
					</div>

				</div>

			</div>

			<aside>
				<button class="logout">
					<a>LOGOUT</a>
				</button>
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
</body>

</html>
