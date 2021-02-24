<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../CSS/style.css" rel="stylesheet">
    <title>게시판</title>
</head>
<style>


  </style>
<body>
  <div class="wrapper_admin">
    
    <div class="adminpage">
      <div class="adminNav">
        <div class="logo">Logo</div>
        <a href="UserTotalPower.jsp">
          <div class="link">
            <img src="../image/setting.png" width="20px">
            <h2>전력소비량</h2>
          </div>
          <a href="UserSection.jsp">
            <div class="link">
              <img src="../image/setting.png" width="20px">
              <h2>구역별 소비량</h2>
            </div>
        </a>
        <a href="UserPay.jsp">
          <div class="link">
            <img src="../image/setting.png" width="20px">
            <h2>납부관리</h2>
          </div>
      </a>
      <a href="UserNotice.jsp">
        <div class="link">
          <img src="../image/setting.png" width="20px">
          <h2>게시판</h2>
        </div>
    </a>
  </div>
    <div class="chart_board_content">
      <div>게시판</div>
      <div>게시물 제목</div>
      <div>게시물 내용</div>
      <div><button onclick="location.href='./userpage4_list.html'" class="post">게시물 올리기</button></div>
    </div>
      
    <aside>
      <button class="logout">로그아웃</button>
      <div class="profile">
        <div class="profile_img">
          <img src="../image/woman.png" class="about_img" alt="">
          </div>
        
        <div>USER NAME</div>
      </div>
        <div class="alert_msg">
          <div class="alert">알림</div>
          <div class="alert1">1</div>
          <div class="alert2">2</div>
          <div class="alert3">3</div>
          <div class="alert4">4</div>
        </div>
      </aside>
    </div>
</body>
</html>