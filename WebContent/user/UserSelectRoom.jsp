<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/choose_room.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>납부 관리</title>
<%
String name = (String) session.getAttribute("name");
String room = (String) session.getAttribute("room");
%>
</head>
<style>
</style>

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
							class="fas fa-charging-station fa-2x"></i>&nbsp; 전력 소비량</a>
					</div>
					<div class="menu">
						<a href="UserPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; 게시판</a>
					</div>
					<div class="menu">
						<a href="UserSelectRoom.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; 방 선택</a>
					</div>
				</div>
			</div>


			<div class="chart_section">
				<div class="public">
					<div class="buttonContainer">
						<button id="1F" class="tablinks" onclick="showPanel(0,'rgba(225,225,225,0.3)')">
							<h3>1F</h3>
						</button>
						<button id="2F" class="tablinks" onclick="showPanel(1, 'rgba(225,225,225,0.3)')">
							<h3>2F</h3>
						</button>
						<button id="3F" class="tablinks" onclick="showPanel(2, 'rgba(225,225,225,0.3)')">
							<h3>3F</h3>
						</button>
					</div>
					<div id="F1" class="tabPanel">
						<img class="F1" src="../image/FLOOR1.png" alt="">
					</div>
					<!-- <div id="F1" class="tabPanel">
          <img class="F1" src="./image/F2.png" alt="">
        </div> -->
					<div id="F2" class="tabPanel">
						<img class="F2" src="../image/F2.png" alt="">
					</div>
					<div id="F1" class="tabPanel">
						<img class="F1" src="../image/3FLOOR.png" alt="">
					</div>
					<!-- <div id="F3" class="tabPanel">
            <img class="F3" src="./image/FLOOR1.png" alt="">
          </div> -->


				</div>
				<div class="personal">
					<h3>선택 가능 호수</h3>
					<div class="possible-room-tbl">
						<tr>
							<th class="floor1">
								<h3>1F</h3>
							</th>
							<th class="floor2">
								<h3>2F</h3>
							</th>
							<th class="floor3">
								<h3>3F</h3>
							</th>
						</tr>
						<td><button class="roomnum1F" name="roomnum"
								onclick="roomcheck(101)">101호</button></td>
						<td><button class="roomnum2F" name="roomnum"
								onclick="roomcheck(201)">201호</button></td>
						<td><button class="roomnum3F" name="roomnum"
								onclick="roomcheck(301)">301호</button></td>
						<td><button class="roomnum1F" name="roomnum"
								onclick="roomcheck(102)">102호</button></td>
						<td><button class="roomnum2F" name="roomnum"
								onclick="roomcheck(202)">202호</button></td>
						<td><button class="roomnum3F" name="roomnum"
								onclick="roomcheck(302)">302호</button></td>
						<td><button class="roomnum1F" name="roomnum"
								onclick="roomcheck(103)">103호</button></td>
						<td><button class="roomnum2F" name="roomnum"
								onclick="roomcheck(203)">203호</button></td>
						<td><button class="roomnum3F" name="roomnum"
								onclick="roomcheck(303)">303호</button></td>

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
							<%=name%>님,&nbsp;환영합니다!<br>
							방 정보 : <%=room%>호
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
		function roomcheck(num) {
			$.ajax({
				url : '/project333333/SelectRoom.do?roomnum=' + num,
				success : function(result) {
					if (confirm(num + "호를 신청 하시겠습니까?") == true) {
						if (result == "true") {
							alert("빈 방이 아닙니다.");
						} else {
							$.ajax({
								url : '/project333333/InsertRoom.do?roomnum='
										+ num,
								success : function(data) {
									alert(num + "방 신청 완료 되었습니다.")

								},
								error : function() {
								}
							});
						}
					} else {
					}
				},
				error : function() {
					console.log("실패")
				}
			});
		}
	</script>
	<script src="../JS/icon.js"></script>
	<script src="../JS/user_choose_room.js"></script>
</body>

</html>