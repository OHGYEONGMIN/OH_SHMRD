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
<title>�Խù� ����</title>

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
					<a href="AdminTotalPower.jsp" class="logoitem"><i
						class="fas fa-home fa-3x">Enf</i></a>
				</div>
				<div class="list_group">
					<div class="menu">
						<a href="AdminTotalPower.jsp" class="navitem"><i
							class="fas fa-charging-station fa-2x"></i>&nbsp; ���� �Һ�</a>
					</div>
					<div class="menu">
						<a href="AdminSection.jsp" class="navitem"><i
							class="fas fa-chart-line fa-2x"></i>&nbsp; ������ �Һ�</a>
					</div>
					<div class="menu">
						<a href="AdminTotalPay.jsp" class="navitem"><i
							class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; ���� ����</a>
					</div>
					<div class="menu">
						<a href="/project333333/BoardList.do" class="navitem"><i
							class="far fa-comment-dots fa-2x"></i>&nbsp; �Խ���</a>
					</div>
					<div class="menu">
						<a href="AdminApprove.jsp" class="navitem"><i
							class="fas fa-users-cog fa-2x"></i>&nbsp; ȸ�� ����</a>
					</div>
				</div>
			</div>
			<div class="chart_board_list">

				<!-- </div> -->
				<h2>�Խ���</h2>
				<h3>�Խù� ���</h3>

				<form action="" method="POST">

					<div class="board_list_table">
						<table>
							<thead>
								<tr class="board_list_column">
									<th class="num">��ȣ</th>
									<th>����</th>
									<th>�۾���</th>
									<th>�����</th>
									<th>��ȸ</th>
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
								<form action="/smgrid/BoardList.do">
									<tr>
										<td colspan="5"><select name="category">
												<option value="none">=== ���� ===</option>
												<option value="title">����</option>
												<option value="content">����</option>
												<option value="tc">����+����</option>
												<option value="name">�۾���</option>
										</select> <input type="text" name="search" id=""> <input
											type="submit" value="�˻�"> <%--<c:forEach var="vo" items="${vo }" varStatus="status" begin="1" end= "${fn:length(vo)/20}" step="1"> --%>

											<c:choose>
												<%-- pnum�� 0���� ������ --%>
												<c:when test="${pnum%10 eq 0 }">
													<fmt:parseNumber var="start" value="${pnum/10 }"
														integerOnly="true" />
													<fmt:parseNumber var="end" value="${pnum/10 }"
														integerOnly="true" />
													<c:if test="${pnum>=11 }">
														<a href="BoardList.do?pnum=${start*10 }"> ���� </a>
													</c:if>

													<c:forEach var="cnt" varStatus="status"
														begin="${start*10-9 }" end="${pnum-1 }">


														<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>


													</c:forEach>
													<strong>${pnum }</strong>





													<c:if test="${cnt > pnum }">
														<c:choose>
															<%-- �ڿ� 10���������� ������ִ� ��� --%>
															<c:when test="${cnt-pnum >10 }">
																<c:forEach var="cnt" varStatus="status"
																	begin="${pnum+1 }" end="${end*10 }">
																	<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
																</c:forEach>
															</c:when>
															<%--�������������� ������ִ� ��� --%>
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




												<%-- pnum�� 0���� �¾ƶ������� ���� ��  --%>
												<c:otherwise>
													<fmt:parseNumber var="start" value="${pnum/10 }"
														integerOnly="true" />
													<fmt:parseNumber var="end" value="${pnum/10 }"
														integerOnly="true" />

													<c:if test="${pnum>=11 }">
														<a href="BoardList.do?pnum=${start*10 }"> ���� </a>
													</c:if>

													<c:forEach var="cnt" varStatus="status"
														begin="${start*10+1 }" end="${pnum-1 }">

														<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>

													</c:forEach>
													<strong>${pnum }</strong>

													<c:if test="${cnt > pnum}">

														<c:choose>
															<%-- �ڿ� 10���������� ������ִ� ��� --%>
															<c:when test="${cnt-pnum gt 10 }">

																<c:forEach var="cnt" varStatus="status"
																	begin="${pnum+1 }" end="${end*10+10 }">
																	<a href="BoardList.do?pnum=${status.index } ">${status.index }</a>
																</c:forEach>
															</c:when>
															<%--�������������� ������ִ� ��� --%>
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

				</form>

				<div>
					<a href="/project333333/user/UserNoticeInsert.jsp" class="post">�Խù�
						�ø���</a>
					<button onclick="location.href='./UserNoticeInsert.jsp'"
						class="post">�Խù� ����</button>
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
					<h3>�˸�</h3>
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