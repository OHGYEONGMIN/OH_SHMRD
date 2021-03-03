<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Parallax Scrolling Effect</title>
<link rel="stylesheet" href="../CSS/modal.css">
<link rel="stylesheet" href="../CSS/main.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<header>
		<nav>
			<div class="container">
				<button class="login">로그인</button>
				<button class="signup">회원가입</button>
			</div>
		</nav>
		
		<form method="post" action="/project333333/member.do">
			<div class="modal-bg">
				<div class="modal">
					<h2>SIGN UP</h2>
					<div class="int-area">
						<input type="text" name="id" class="id" autocomplete="off"
							required> <label for="id">아이디</label>
					</div>
					<div class="int-area">
						<input type="password" name="pw" class="pw" autocomplete="off"
							required> <label for="pw">비밀번호</label>
					</div>
					<div class="int-area">
						<input type="text" name="name" class="name" autocomplete="off"
							required> <label for="name">이름</label>
					</div>
					<div class="int-area">
					<!-- 이부분 CSS 만들어야함!! -->
						<label> <input type="radio" name="sex" autocomplete="off" value="male" checked>남자 </label> 
						<label> <input type="radio" name="sex" autocomplete="off" value="female" checked>여자</label>
					</div>
					<div class="int-area">
						<input type="text" name="tel" class="tel" autocomplete="off"
							required> <label for="tel">전화번호</label>
					</div>
					<div class="int-area">
						<input type="text" name="addr" class="addr" autocomplete="off"
							required> <label for="addr">주소</label>
					</div>
					<div class="int-area">
						<input type="text" name="email" class="email" autocomplete="off"
							required> <label for="email">이메일</label>
					</div>
				<!-- 	<div class="int-area">
						<input type="text" name="room" class="room" autocomplete="off"
							required> <label for="room">방번호</label>
					</div> -->
					<div class="btn-area">
						<button class="btn" type="submit">완료</button>
						<button class="cancel" type="button">취소</button>
					</div>
					<span class="modal-close">X</span>
				</div>
			</div>
		</form>

		<form class='bod' method="post" action="/project333333/Login.do">
			<div class="modal-login">
				<div class="modal_log">
					<h2>LOGIN</h2>
					<div class="int-area">
						<input type="text" name="loginid" class="id" autocomplete="off"
							required> <label for="id">USER NAME</label>
					</div>
					<div class="int-area">
						<input type="password" name="loginpw" class="pw"
							autocomplete="off" required> <label for="pw">PASSWORD</label>
					</div>
					<div class="btn-area">
						<button class="btn" type="submit">로그인</button>
						<button class="cancel2" type="button">취소</button>
					</div>
					<span class="login-close">X</span>
				</div>
			</div>
		</form>
		<div class="big-title translate" data-speed="0.1">Scroll down</div>
		<img src="../image/share1.png" class="person translate"
			data-speed="-0.25" alt=""> <img src="../image/building1.PNG"
			class="mountain1 translate" data-speed="-0.2" alt=""> <img
			src="../image/building2.PNG" class="mountain2 translate"
			data-speed="0.2" alt=""> <img src="../image/sky.PNG"
			class="mountain3 translate" data-speed="0.3" alt="">
	</header>

	<section>
		<div class="shadow"></div>

		<div class="container">

			<div class="content opacity">
				<h3 class="title">
					ABOUT
					<div class="border"></div>
				</h3>

			</div>
			<div>
				<lottie-player
					src="https://assets4.lottiefiles.com/packages/lf20_OKUNmn.json"
					background="transparent" speed="1"
					style="width: 300px; height: 300px;" loop autoplay></lottie-player>
			</div>

			<div>
				<lottie-player
					src="https://assets2.lottiefiles.com/packages/lf20_yJ8wNO.json"
					background="transparent" speed="1"
					style="width: 300px; height: 300px;" loop autoplay></lottie-player>
			</div>

			<div class="chat">
				<lottie-player
					src="https://assets1.lottiefiles.com/private_files/lf30_kk8qfour.json"
					background="transparent" speed="1"
					style="width: 300px; height: 300px;" loop autoplay></lottie-player>

			</div>
			<div>
				<lottie-player
					src="https://assets8.lottiefiles.com/packages/lf20_uk8Lwf.json"
					background="transparent" speed="0.8"
					style="width: 300px; height: 300px;" loop autoplay></lottie-player>
			</div>
			<div class="smarthome">
				<h2>스마트 홈 기능</h2>
				<br>
				<h3>
					어플리케이션을 통한<br> 스마트한 전력 제어
				</h3>
			</div>
			<div class="data">
				<h2>전력 사용량 데이터 제공</h2>
				<br>
				<h3>웹 기반 전력 사용량+납부금액 데이터 제공</h3>
			</div>
			<div class="alarm">
				<h2>생활비 절감</h2>
				<br>
				<h3>
					알뜰살뜰!<br> 내가 설정한 금액을 초과 시 알람
				</h3>
			</div>
			<div class="alarm">
				<h2>새로운 친구와 다양한 기회</h2>
				<br>
				<h3>
					웹 게시판 & 앱 채팅으로 <br>룸메이트간의 커뮤니티 형성
				</h3>
			</div>
		</div>
	</section>

	<script src="../JS/main.js"></script>
	<script src="../JS/modal.js"></script>
	<script
		src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
</body>
</html>