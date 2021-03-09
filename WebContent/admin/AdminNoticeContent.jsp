<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/project333333/CSS/style.css" rel="stylesheet">
<link href="/project333333/CSS/icon.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>게시물 내용 ${vo.content }</title>
<%
String id = (String) session.getAttribute("id");
String room = (String) session.getAttribute("room");
String name = (String) session.getAttribute("name");
%>
</head>
<body>
	<div class="wrapper_admin">
		<div class="adminpage">
			<div class="adminNav">
				<div class="logo">
					<a href="admin/AdminTotalPower.jsp" class="logoitem"><i
						class="fas fa-home fa-3x">Enf</i></a>
				</div>
				<div class="list_group">
					<div class="menu">
						<a href="admin/AdminTotalPower.jsp" class="navitem"><i
							class="fas fa-charging-station fa-2x"></i>&nbsp; 전력 소비량</a>
					</div>
					<div class="menu">
						<a href="admin/AdminTotalPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; 납부 관리</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; 게시판</a>
					</div>
					<div class="menu">
						<a href="admin/AdminApprove.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; 승인 목록</a>
					</div>
				</div>
			</div>
			<div class="chart_board_post">
				<div>
					<h2>게시판</h2>
				</div>
				<div>
					<h3>게시물 제목</h3>
					<div id="" style="width: 99.5%; height: 40px;">${vo.title }</div>
				</div>
				<div>
					<br>
					<h3>게시글 내용</h3>
					<form action="" method="POST">
						<div class="board_list"></div>
						<div>
							<div id="" style="width: 99.5%; height: 450px;">
								<p>${vo.content }</p>
							</div>
						</div>
					</form>
				</div>
				<div>
					<form action="/project333333/BoardEdit.do" method="POST">
						<input type="hidden" name="num" value="${vo.num }"> <input
							type="hidden" name="title" value="${vo.title }"> <input
							type="hidden" name="content" value="${vo.content }">
						<c:if test="${sessionScope.id eq 'admin' }">
							<input type="submit" value="수정">
						</c:if>
					</form>
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
		</div>
		</aside>
	</div>
	<script src="../JS/icon.js" charset="UTF-8"></script>
</body>
</html>