<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../CSS/style.css" rel="stylesheet">
<link href="../CSS/icon.css" rel="stylesheet">
<link href="../CSS/approve.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>게시물 내용</title>
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
			<div class="chart_board_content">
				<div>
					<h2>게시판</h2>
				</div>
				<div></div>
				<div>
					<h3>게시물 목록</h3>
					<br>
					<form action="" method="POST">
						<div class="board_list">
							<div class="member_table">
								<table>
									<thead>
										<tr class="member_list_column">
											<th>번호</th>
											<th>제목</th>
											<th>글쓴이</th>
											<th>등록일</th>
											<th>조회</th>
										</tr>
									</thead>
									<tbody class="member_list_tbl">
										<tr>
											<td>글번호1</td>
											<td>제목제목제목나오는란</td>
											<td>글쓴이(아이디)</td>
											<td>등록일(날짜)</td>
											<td>조회수</td>
										</tr>
										<tr>
											<td>글번호2</td>
											<td>제목제목제목나오는란</td>
											<td>글쓴이(아이디)</td>
											<td>등록일(날짜)</td>
											<td>조회수</td>
										</tr>
										<tr>
											<td>글번호3</td>
											<td>제목제목제목나오는란</td>
											<td>글쓴이(아이디)</td>
											<td>등록일(날짜)</td>
											<td>조회수</td>
										</tr>
										<tr>
											<td>글번호4</td>
											<td>제목제목제목나오는란</td>
											<td>글쓴이(아이디)</td>
											<td>등록일(날짜)</td>
											<td>조회수</td>
										</tr>
										<tr>
											<td>글번호4</td>
											<td>제목제목제목나오는란</td>
											<td>글쓴이(아이디)</td>
											<td>등록일(날짜)</td>
											<td>조회수</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td></td>
											<td><input type="search"></td>
											<td><input type="button" value="검색"></td>
											<td>페이지 번호 나오는 구간</td>
										</tr>
									</tfoot>
								</table>
							</div>


						</div>
					</form>
				</div>
				<div>
					<button onclick="location.href='./UserNoticeInsert.jsp'"
						class="post">게시물 올리기</button>
					<button onclick="location.href='./UserNoticeInsert.jsp'"
						class="post">게시물 삭제</button>
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