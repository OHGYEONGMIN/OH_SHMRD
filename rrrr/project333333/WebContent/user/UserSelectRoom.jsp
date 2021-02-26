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
<title>���� ����</title>
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
						<h2>���¼Һ�</h2>
					</div> <a href="adminpage2.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>������ �Һ�</h2>
						</div>
				</a> <a href="adminpage3.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>���ΰ���</h2>
						</div>
				</a> <a href="adminpage4_list.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>�Խ���</h2>
						</div>
				</a> <a href="approve.html">
						<div class="link">
							<img src="/Page/image/setting.png" width="20px">
							<h2>���Խ���</h2>
						</div>
				</a>
			</div>
			<div class="selroom">
				<div class="roomtable">
					<h3 class="room_select_title">ȣ�� ����</h3>
					<table class="room_select_tbl">
						<th class="floor">��</th>
						<th class="roomnumber" colspan="3">�� ��ȣ</th>
						<tr>
							<td class="1F">100ȣ</td>
							<td><input id="ho101" class="room" type="button" name="roomnum"
								value="101ȣ" onclick="roomcheck(101)"></input></td>
							<td><input id="ho102"  class="room" type="button" name="roomnum"
								value="102ȣ" onclick="roomcheck(102)"></input></td>
							<td><input id="ho103" class="room" type="button" name="roomnum"
								value="103ȣ" onclick="roomcheck(103)"></input></td>
						</tr>
						<tr>
							<td class="2F">200ȣ</td>
							<td><input id="ho201" class="room" type="button" name="roomnum"
								value="201ȣ" onclick="roomcheck(201)"></input></td>
							<td><input id="ho201" class="room" type="button" name="roomnum"
								value="202ȣ" onclick="roomcheck(202)"></input></td>
							<td><input id="ho201" class="room" type="button" name="roomnum"
								value="203ȣ" onclick="roomcheck(203)"></input></td>
						</tr>
						<tr>
							<td class="3F">300ȣ</td>
							<td><input id="ho301" class="room" type="button" name="roomnum"
								value="301ȣ" onclick="roomcheck(301)"></input></td>
							<td><input id="ho302" class="room" type="button" name="roomnum"
								value="302ȣ" onclick="roomcheck(302)"></input></td>
							<td><input id="ho303" class="room" type="button" name="roomnum"
								value="303ȣ" onclick="roomcheck(303)"></input></td>
						</tr>
					</table>

					<div class="about_select">
						<div class="select_complete"></div>
						<div class="complete">���ð���</div>
						<div class="select"></div>
						<div class="select_room">����</div>
						<div class="select_disable"></div>
						<div class="disable">���úҰ�</div>

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
					<h3>�˸�</h3>
					<div class="alert1">1</div>
					<div class="alert2">2</div>
					<div class="alert3">3</div>
					<div class="alert4">4</div>
				</div>
			</aside>
		</div>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			function roomcheck(num) {
				$.ajax({
							url : '/project333333/SelectRoom.do?roomnum=' + num,
							success : function(result) {
								if (confirm(num + "ȣ�� ��û �Ͻðڽ��ϱ�?") == true) {
									if (result=="true") {
										alert("�� ���� �ƴմϴ�.");
									} else {
										$.ajax({
													url : '/project333333/InsertRoom.do?roomnum='
															+ num,
													success : function(data) {
														var rom = 
														alert(num+"�� ��û �Ϸ� �Ǿ����ϴ�.")
														
														
													},
													error : function() {
													}
												}); 
									}
								} else {
								}
							},
							error : function() {
								console.log("����")
							}
						});
			}
		</script>
</body>

</html>