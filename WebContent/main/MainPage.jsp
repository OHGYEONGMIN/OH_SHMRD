<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Parallax Scrolling Effect</title>
<link rel="stylesheet" href="../CSS/main.css">
<link rel="stylesheet" href="../CSS/modal.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>


	<header>
		<nav>
			<div class="container">
				<div class="logo">Enf</div>

				<button class="login">Login</button>
				<button class="signup">Sign up</button>
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
					<div class="int-area2">
					<label>성별</label>
						<label class="man"> <input
							type="radio" name="sex" autocomplete="off" value="남"
							checked>남자
						</label> <label class="woman"> <input type="radio"
							name="sex" autocomplete="off" value="여" checked>여자
						</label>
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
		<div class="big-title translate" data-speed="0.1">
			나의 전력관리를<br>누구보다 현명하고, 손쉽게.
		</div>
		<img src="../image/share1.png" class="person translate"
			data-speed="-0.25" alt=""> <img src="../image/building1.PNG"
			class="mountain1 translate" data-speed="-0.2" alt=""> <img
			src="../image/building2.PNG" class="mountain2 translate"
			data-speed="0.2" alt=""> <img src="../image/sky.PNG"
			class="mountain3 translate" data-speed="0.3" alt="">
	</header>

	<section>
		<div class="shadow"></div>

		<div class="container ">
			<div class="titleo opacity">
				<h1>About</h1>
				<h3>
					전력 제어 & 사용량 관리 <br>'알뜰살뜰' 의 선두 아이템
				</h3>
			</div>
		</div>
		<div class="glass_morphism">
			<div class="card">
				<div class="card_content">
					<h2>01</h2>
					<div class="img">
						<lottie-player
							src="https://assets4.lottiefiles.com/packages/lf20_OKUNmn.json"
							background="transparent" speed="1"
							style="width: 300px; height: 300px; " loop autoplay>
						</lottie-player>
					</div>
					<h1>스마트 홈 기능</h1>
					<p>
						어플리케이션을 통한<br> 스마트한 전력 제어
					</p>
				</div>
			</div>
			<div class="card">
				<div class="card_content">
					<h2>02</h2>
					<div class="img">
						<lottie-player
							src="https://assets2.lottiefiles.com/packages/lf20_yJ8wNO.json"
							background="transparent" speed="1"
							style="width: 300px; height: 300px;" loop autoplay>
						</lottie-player>
					</div>
					<h1>전력 사용량 데이터 제공</h1>
					<p>
						웹 기반 전력 사용량+납부금액<br> 데이터 제공
					</p>
				</div>
			</div>
			<div class="card">
				<div class="card_content">
					<h2>03</h2>
					<div class="img">
						<lottie-player
							src="https://assets6.lottiefiles.com/packages/lf20_YETVW1.json"
							background="transparent" speed=".5"
							style="width: 300px; height: 300px;" loop autoplay>
						</lottie-player>
					</div>
					<h1>설정 금액 초과 시 알람</h1>
					<p>
						앱의 알람으로 나의 전력 사용량 <br>관리 용이
					</p>
				</div>
			</div>
			<div class="card">
				<div class="card_content">
					<h2>04</h2>
					<div class="img">
						<lottie-player
							src="https://assets8.lottiefiles.com/packages/lf20_uk8Lwf.json"
							background="transparent" speed="0.8"
							style="width: 300px; height: 300px; " loop autoplay>
						</lottie-player>
					</div>
					<h1>새로운 친구와 다양한 기회</h1>
					<p>
						웹 게시판 & 앱 채팅으로 <br>룸메이트간의 커뮤니티 형성
					</p>
				</div>

			</div>
		</div>

	</section>
	<script src="../JS/card.js"></script>
	<script>
		VanillaTilt.init(document.querySelectorAll(".card_content"), {
			max : 7,
			speed : 50,
			glare : true,
			"max-glare" : 0.5,
		});
	</script>
	<script src="../JS/scroll.js"></script>
	<script src="../JS/main.js"></script>
	<script src="../JS/modal.js"></script>

	<script
		src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
</body>
</html>