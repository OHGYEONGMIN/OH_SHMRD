<%@page import="Model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
MemberDAO dao = new MemberDAO();

ArrayList<MemberVO> View = dao.View();
ArrayList<MemberVO> apview = dao.apview();
String room = (String) session.getAttribute("room");
String name = (String) session.getAttribute("name");

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
			<div class="member">
				<div class="accept_list">
					<h3>승인 리스트</h3>
					<div class="approve_table">
						<table>
							<thead>
								<tr class="approve_list_column">
									<th>아이디</th>
									<th>이름</th>
									<th>성별</th>
									<th>전화번호</th>
									<th>주소</th>
									<th>이메일</th>
									<th>방번호</th>
									<th colspan=2>승인 / 취소</th>
								</tr>
							</thead>
							<tbody class="approve_list_tbl">
								<!-- 멤버리스트 출력 -->
								<%
								for (int i = 0; i < apview.size(); i++) {
								%>
								<tr>
									<td><%=apview.get(i).getId()%></td>
									<!-- name ="accept" -->
									<td><%=apview.get(i).getName()%></td>
									<td><%=apview.get(i).getSex()%></td>
									<td><%=apview.get(i).getTel()%></td>
									<td><%=apview.get(i).getAddr()%></td>
									<td><%=apview.get(i).getMail()%></td>
									<td><%=apview.get(i).getRoom()%></td>
									<td><input type="button" name="accept" value="승인"
										onclick="location.href='/project333333/Approve.do?accept=2&num=<%=apview.get(i).getNum()%>'"></input></td>
									<td><input type="button" name="accept" value="취소"
										onclick="location.href='/project333333/Approve.do?accept=0&num=<%=apview.get(i).getNum()%>'"></input></td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
					</div>


				</div>

				<div class="member_list">
					<h3>멤버 리스트</h3>
					<div class="member_table">
						<table>
							<thead>
								<tr class="member_list_column">
									<th>아이디</th>
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
									<td><%=View.get(i).getId()%></td>
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		function appro(num) {
			$.ajax({
				url : '/project333333/Approve.do?accept=' + num,
				success : function() {
					console.log("연결성공")
				},
				error : function() {
					console.log("연결실패")
				}

			});
		}
	</script>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>