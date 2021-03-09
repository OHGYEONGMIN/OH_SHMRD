<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.Console"%>
<%@page import="CalculationE.Calculation"%>
<%@page import="Model.ElectricVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ElectricDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String room = (String) session.getAttribute("room");
String name = (String) session.getAttribute("name");
String mm = (String) session.getAttribute("mm");
ElectricDAO dao = new ElectricDAO();
ArrayList<String> perview = dao.wh_month_room(room, mm);
ArrayList<String> monthview = dao.wh_month(room, mm);
ArrayList<String> r1view = dao.wh_month_room1(room, mm);
ArrayList<String> r2view = dao.wh_month_room2(room, mm);
ArrayList<String> r3view = dao.wh_month_room3(room, mm);
String id = (String) session.getAttribute("id");
DecimalFormat formatter = new DecimalFormat("0.#");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>���� ����</title>
</head>
<style>
</style>
<body>

	<%
	//��ü��뷮
	double sumview = 0;
	for (int i = 0; i < monthview.size(); i++) {
		double a = Double.parseDouble(monthview.get(i));
		sumview += a;
	}
	//�α����� ���λ�뷮
	double persum = 0;
	for (int i = 0; i < perview.size(); i++) {
		double a = Double.parseDouble(perview.get(i));
		persum += a;
	}
	//�� �� ��뷮
	//room1
	double room1 = 0;
	for (int i = 0; i < r1view.size(); i++) {
		double a = Double.parseDouble(r1view.get(i));
		room1 += a;
	}
	//room2
	double room2 = 0;
	for (int i = 0; i < r2view.size(); i++) {
		double a = Double.parseDouble(r2view.get(i));
		room2 += a;
	}
	//room3
	double room3 = 0;
	for (int i = 0; i < r3view.size(); i++) {
		double a = Double.parseDouble(r3view.get(i));
		room3 += a;
	}
	//������ϰ� �ϱ�
	/* 	sumview = sumview/10;
		persum = persum/10;
		room1 = room1/10;
		room2 = room2/10;
		room3 = room3/10; */

	//��ݰ��
	Calculation cal = new Calculation();
	int basicpay = cal.Calculater_basic(sumview);
	int totalpay = cal.Calculater_total(sumview);
	int taxpay = cal.Calculater_taxpay(sumview);
	int fundpay = cal.Calculater_fundpay(sumview);

	//�� ��� ���
	int total = (int) ((totalpay * persum) / sumview);
	%>

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
			<div class="chart_usage">
				<div class="table">
					<h3>���� �ݾ� ǥ</h3>
					<table class="payment_tbl">
						<th>����</th>
						<th>����</th>
						<tr>
							<td>��� ����</td>
							<td>���ÿ�(���)-�ְſ�</td>
						</tr>
						<tr>
							<td>��뷮</td>

							<td><%=formatter.format(sumview)%>Kwh</td>

						</tr>
						<th colspan="2">û�� �ݾ�</th>
						<tr>
							<td>�⺻���</td>
							<td><%=basicpay%> ��</td>
						</tr>
						<tr>
							<td>���·� ���</td>
							<td><%=totalpay%> ��</td>
						</tr>
						<th colspan="2">�ΰ���ġ�� ��� ����</th>
						<tr>
							<td>�ΰ� ��ġ��</td>
							<td><%=taxpay%> ��</td>
						</tr>
						<th colspan="2">���»�� ��� ���</th>
						<tr>
							<td class="radius1">���»����ݱ��</td>
							<td class="radius2"><%=fundpay%> ��</td>
						</tr>
					</table>
				</div>

				<div class="room_usage">
					<div class="room_payment">
						<h3>100ȣ ��뷮</h3>
						<table class="room_tbl">
							<th>�� ��ȣ</th>
							<th>��뷮</th>
							<tr>
								<td>Room 101</td>
								<td><%=formatter.format(room1)%>Kwh</td>
							</tr>
							<tr>
								<td>Room 102</td>
								<td><%=formatter.format(room2)%>Kwh</td>
							</tr>

							<tr>
								<td>Room 103</td>
								<td><%=formatter.format(room3)%>Kwh</td>
							</tr>
							<tr>
								<th class="radius1">��ü ���</th>
								<th class="radius2"><%=totalpay%> ��</th>
							</tr>

						</table>
					</div>
					<div class="personal_payment">
						<h3>�� ���� �ݾ�</h3>
						<table class="total_payment">
							<tr>
								<th>�ѻ�뷮</th>
								<th>���λ�뷮</th>
							</tr>
							<tr>
								<td><%=formatter.format(sumview)%>Kwh</td>
								<td><%=formatter.format(persum)%>Kwh</td>
							</tr>
							<tr>
								<th>���� �ݾ�</th>
								<th><%=total%> ��</th>
							</tr>
						</table>
					</div>

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
	<script src="../JS/monthreset.js" charset="UTF-8"></script>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>

</html>
