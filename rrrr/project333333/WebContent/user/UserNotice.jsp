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
<!-- <link href="./Project3_css/approve.css" rel="stylesheet"> -->
<link href="/project333333/CSS/icon.css" rel="stylesheet">
<link href="/project333333/CSS/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
	crossorigin="anonymous"></script>
<title>게시물 내용</title>
<style>
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	color: white;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
	color: white;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 12px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
	color: white;
}

.tg .tg-cjtp {
	background-color: #ecf4ff;
	border-color: inherit;
	text-align: center;
	vertical-align: top color: white;
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top color: white;
}
</style>
</head>

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
						<a href="UserSection.jsp" class="navitem"><i
							class="fas fa-chart-line fa-2x"></i>&nbsp; 구역별 소비량</a>
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
			<div class="chart_board_list">

				<!-- </div> -->
				<h2>게시판</h2>
				<h3>게시물 목록</h3>


				<div class="board_list_table">
					<table>
						<thead>
							<tr class="board_list_column">
								<th class="num">번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="vo" items="${vo }" begin="0" end="1" step="1">  --%>
							<c:forEach var="vo" items="${vo }">
								<tr>
									<td class="tg-0pky">${vo.num }</td>
									<td class="tg-0pky"><a href="Content.do?num=${vo.num }">${vo.title }</a></td>
									<td class="tg-0pky">${vo.name }</td>
									<td class="tg-0pky">${vo.day }</td>
									<td class="tg-0pky">${vo.click }</td>

								</tr>
							</c:forEach>
							<form action="BoardList.do">
							<tr>
								<td colspan="5"><select name="category">
										<option value="none">=== 선택 ===</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="tc">제목+내용</option>
										<option value="name">글쓴이</option>
								</select> <input type="text" name="search" id=""> <input
									type="submit" value="검색"> <%--<c:forEach var="vo" items="${vo }" varStatus="status" begin="1" end= "${fn:length(vo)/20}" step="1"> --%>

									<c:choose>
										<%-- pnum이 0으로 끝날때 --%>
										<c:when test="${pnum%10 eq 0 }">
											<fmt:parseNumber var="start" value="${pnum/10 }"
												integerOnly="true" />
											<fmt:parseNumber var="end" value="${pnum/10 }"
												integerOnly="true" />
											<c:if test="${pnum>=11 }">
												<a href="BoardList.do?pnum=${start*10 }"> 이전 </a>
											</c:if>

											<c:forEach var="cnt" varStatus="status"
												begin="${start*10-9 }" end="${pnum-1 }">


												<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>


											</c:forEach>
											<strong>${pnum }</strong>





											<c:if test="${cnt > pnum }">
												<c:choose>
													<%-- 뒤에 10페이지까지 만들어주는 경우 --%>
													<c:when test="${cnt-pnum >10 }">
														<c:forEach var="cnt" varStatus="status" begin="${pnum+1 }"
															end="${end*10 }">
															<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
														</c:forEach>
													</c:when>
													<%--총페이지까지만 만들어주는 경우 --%>
													<c:otherwise>
														<c:choose>
															<c:when test="${end+10>cnt }">
																<c:forEach var="cnt" varStatus="status"
																	begin="${pnum+1 }" end="${cnt }">
																	<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
																</c:forEach>
															</c:when>
															<c:otherwise>

															</c:otherwise>
														</c:choose>


													</c:otherwise>
												</c:choose>

											</c:if>

										</c:when>




										<%-- pnum이 0으로 맞아떨어지지 않을 때  --%>
										<c:otherwise>
											<fmt:parseNumber var="start" value="${pnum/10 }"
												integerOnly="true" />
											<fmt:parseNumber var="end" value="${pnum/10 }"
												integerOnly="true" />

											<c:if test="${pnum>=11 }">
												<a href="BoardList.do?pnum=${start*10 }"> 이전 </a>
											</c:if>

											<c:forEach var="cnt" varStatus="status"
												begin="${start*10+1 }" end="${pnum-1 }">

												<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>

											</c:forEach>
											<strong>${pnum }</strong>

											<c:if test="${cnt > pnum}">

												<c:choose>
													<%-- 뒤에 10페이지까지 만들어주는 경우 --%>
													<c:when test="${cnt-pnum gt 10 }">

														<c:forEach var="cnt" varStatus="status" begin="${pnum+1 }"
															end="${end*10+10 }">
															<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
														</c:forEach>
													</c:when>
													<%--총페이지까지만 만들어주는 경우 --%>
													<c:otherwise>
														<c:choose>
															<c:when test="${end*10+10>cnt }">

																<c:forEach var="cnt" varStatus="status"
																	begin="${pnum+1 }" end="${cnt}">
																	<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<c:forEach var="cnt" varStatus="status"
																	begin="${pnum+1 }" end="${end*10+10}">
																	<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
																</c:forEach>
															</c:otherwise>
														</c:choose>

													</c:otherwise>
												</c:choose>

											</c:if>



										</c:otherwise>
									</c:choose> <c:if test="${cnt>start*10 and cnt>=11 }">
										<a href="BoardList.do?pnum=${start*10+11 }"> >> </a>
									</c:if>
									</form>
						</tbody>

					</table>
				</div>


				<div>
					<!-- <div class="post">
						<a href="/project333333/user/UserNoticeInsert.jsp">게시물 올리기</a>
					</div> -->
					<button
							onclick="location.href='/project333333/user/UserNoticeInsert.jsp'"
							class="post">게시물 올리기</button>
				<!-- 	<div class="post">
						<a href="/project333333/user/UserNoticeInsert.jsp">게시물 삭제</a>
					</div> -->
					<button
							onclick="location.href='/project333333/user/UserNoticeInsert.jsp'"
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
		<script src="/project333333/JS/icon.js" charset="UTF-8"></script>
</body>

</html>