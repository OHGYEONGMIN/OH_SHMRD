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
<title>멤버리스트/승인</title>
</head>
<style>
</style>
<body>
	<div class="wrapper_admin">


		<div class="adminpage">
			<div class="adminNav">
				<div class="logo">Logo</div>
				<a href="adminpage1.html">
					<div class="link">
						<img src="/Page/image/setting.png" width="20px">
						<h2>전력소비량</h2>
					</div> <a href="adminpage2.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>구역별 소비량</h2>
						</div>
				</a> <a href="adminpage3.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>납부관리</h2>
						</div>
				</a> <a href="adminpage4_list.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>게시판</h2>
						</div>
				</a> <a href="adminpage5.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>가입승인</h2>
						</div>
				</a>
			</div>
			<div class="member">
				<div class="accept_list">승인 리스트</div>
				<div class="member_list">
					<h3>멤버 리스트</h3>
					<table>
						<thead>
							<tr>
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
						<tbody>
							<!-- 멤버리스트 출력 -->
							<%for(int i= 0; i <View.size(); i++){	%>
							<tr>
							<td><%=View.get(i).getNum() %></td>
							<td><%=View.get(i).getId() %></td>
							<td><%=View.get(i).getPw() %></td>
							<td><%=View.get(i).getName() %></td>
							<td><%=View.get(i).getSex() %></td>
							
							<td><%=View.get(i).getTel() %></td>
							<td><%=View.get(i).getAddr() %></td>
							<td><%=View.get(i).getMail() %></td>
							<td><%=View.get(i).getRoom() %></td>
							</tr>
							<%} %>
							
						</tbody>
					</table>
				</div>
			</div>

			<aside>
				<button class="logout">로그아웃</button>
				<div class="profile">
					<div class="profile_img">
						<img src="../image/woman.png" class="about_img" alt="">
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
</body>
</html>