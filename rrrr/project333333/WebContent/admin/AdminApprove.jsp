<%@page import="Model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
MemberDAO dao = new MemberDAO();

ArrayList<MemberVO> View = dao.View();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/approve.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>멤버리스트/승인</title>
</head>


<body>
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
			<div class="member">
				<div class="accept_list">
					<h3>승인 리스트</h3>

				</div>

				<div class="member_list">
					<h3>멤버 리스트</h3>
					<div class="member_table">
						<table>
							<thead>
								<tr class="member_list_column">
									<th>번호</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>전화번호</th>
									<th>주소</th>
									<th>이메일</th>
									<th>방번호</th>
								</tr>
							</thead>
							<tbody class="member_list_tbl">
								<!-- 멤버리스트 출력 -->

								<%
								for (int i = 0; i < View.size(); i++) {
								%>
								<tr>
									<td><%=View.get(i).getNum()%></td>
									<td><%=View.get(i).getId()%></td>
									<td><%=View.get(i).getPw()%></td>
									<td><%=View.get(i).getName()%></td>
									<td><%=View.get(i).getSex()%></td>

									<td><%=View.get(i).getTel()%></td>
									<td><%=View.get(i).getAddr()%></td>
									<td><%=View.get(i).getMail()%></td>
									<td><%=View.get(i).getRoom()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
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