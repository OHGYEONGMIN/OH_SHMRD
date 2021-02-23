<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/modal.css">
    <title>Document</title>
</head>

<body>
    <header>        <h2>The modal</h2>
        <p>Scroll down to see the modal</p>
    </header>
    <div class="subcribe-section">
        <h2>This is the modal</h2>
        <p>Ipas aauwehfowjfowiejfj s woiefjiowejf oajweoifj</p>
        <button class="modal-btn">Modal</button>
        <button class="login-btn">login</button>
    </div>

    <div class="modal-bg">
        <div class="modal">
            <h2>회원가입</h2>
            <table class="table">
                <tr>
                    <td><label for="id"> 아이디 : </label></td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td><label for="pw"> 패스워드 : </label></td>
                    <td><input type="text" name="pw"></td>
                </tr>
                <tr>
                    <td><label for="name"> 이름 : </label></td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td><label for="sex"> 성별 : </label></td>
                    <td><input type="text" name="sex"></td>
                </tr>
                <tr>
                    <td><label for="tel"> 전화번호 : </label></td>
                    <td><input type="text" name="tel"></td>
                </tr>
                <tr>
                    <td><label for="addr"> 주소 : </label></td>
                    <td><input type="text" name="addr"></td>
                </tr>
                <tr>
                    <td><label for="email"> 이메일 : </label></td>
                    <td><input type="text" name="email"></td>
                </tr>
                <tr>
                    <td><label for="room"> 방번호 : </label></td>
                    <td><input type="text" name="room"></td>
                </tr>
            </table>
            <button>Subscribe</button>
            <span class="modal-close">X</span>

        </div>

    </div>

    <div class="modal-login">
        <div class="modal_log">
            <h2>로그인</h2>
            <table class="table">
                <tr>
                    <td><label for="id"> 아이디 : </label></td>
                    <td><input type="text" name="loginid"></td>
                </tr>
                <tr>
                    <td><label for="pw"> 패스워드 : </label></td>
                    <td><input type="text" name="loginpw"></td>
                </tr>
            </table>
            <button>Subscribe</button>
            <span class="login-close">X</span>
        </div>
    </div>


    <script src="../JS/modal.js"></script>
</body>

</html>