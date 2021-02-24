<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/choose_room.css" rel="stylesheet">
<title>납부 관리</title>
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
				</a> <a href="approve.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>가입승인</h2>
						</div>
				</a>
			</div>
			<div class="selroom">
				<div class="roomtable">
					<h3 class="room_select_title">호실 선택</h3>
					<table class="room_select_tbl">
						<th class="floor">층</th>
						<th class="roomnumber" colspan="3">방 번호</th>
						<form method="post" action="/project333333/SelectRoom.do">
							<tr>
								<td class="1F">100호</td>
								<td><input type="submit" name="roomnum" value="101호"></input></td>
								<td><input type="submit" name="roomnum" value="102호"></input></td>
								<td><input type="submit" name="roomnum" value="103호"></input></td>
							</tr>
							<tr>
								<td class="2F">200호</td>								<td><input type="submit" name="roomnum" value="201호"></input></td>
								<td><input type="submit" name="roomnum" value="202호"></input></td>
								<td><input type="submit" name="roomnum" value="203호"></input></td>
							</tr>
							<tr>
								<td class="3F">300호</td>
								<td><input type="submit" name="roomnum" value="301호"></input></td>
								<td><input type="submit" name="roomnum" value="302호"></input></td>
								<td><input type="submit" name="roomnum" value="303호"></input></td>
							</tr>
						</form>
					</table>

					<div class="about_select">
						<div class="select_complete"></div>
						<div class="complete">선택가능</div>
						<div class="select"></div>
						<div class="select_room">선택</div>
						<div class="select_disable"></div>
						<div class="disable">선택불가</div>

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
</body>

</html>