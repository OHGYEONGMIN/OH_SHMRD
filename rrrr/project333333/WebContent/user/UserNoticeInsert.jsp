<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../CSS/style.css" rel="stylesheet">
    <title>�Խ���</title>
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
            <h2>���¼Һ�</h2>
          </div>
          <a href="UserSection.jsp">
            <div class="link">
              <img src="../image/setting.png" width="20px">
              <h2>������ �Һ�</h2>
            </div>
        </a>
        <a href="UserPay.jsp">
          <div class="link">
            <img src="../image/setting.png" width="20px">
            <h2>���ΰ���</h2>
          </div>
      </a>
      <a href="UserNotice.jsp">
        <div class="link">
          <img src="../image/setting.png" width="20px">
          <h2>�Խ���</h2>
        </div>
    </a>
  </div>
    <div class="chart_board_content">
      <div>�Խ���</div>
      <div>�Խù� ����</div>
      <div>�Խù� ����</div>
      <div><button onclick="location.href='./userpage4_list.html'" class="post">�Խù� �ø���</button></div>
    </div>
      
    <aside>
      <button class="logout">�α׾ƿ�</button>
      <div class="profile">
        <div class="profile_img">
          <img src="../image/woman.png" class="about_img" alt="">
          </div>
        
        <div>USER NAME</div>
      </div>
        <div class="alert_msg">
          <div class="alert">�˸�</div>
          <div class="alert1">1</div>
          <div class="alert2">2</div>
          <div class="alert3">3</div>
          <div class="alert4">4</div>
        </div>
      </aside>
    </div>
</body>
</html>