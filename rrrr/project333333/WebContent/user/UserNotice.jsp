<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link href="./Project3_css/approve.css" rel="stylesheet"> -->
<link href="../CSS/icon.css" rel="stylesheet">
<link href="../CSS/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/377e1f4283.js"
   crossorigin="anonymous"></script>
<title>�Խù� ����</title>
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
                     class="fas fa-charging-station fa-2x"></i>&nbsp; ���� �Һ�</a>
               </div>
               <div class="menu">
                  <a href="adminpage2.html" class="navitem"><i
                     class="fas fa-chart-line fa-2x"></i>&nbsp; ������ �Һ�</a>
               </div>
               <div class="menu">
                  <a href="adminpage3_userpay.html" class="navitem"><i
                     class="fas fa-hand-holding-usd fa-2x"></i>&nbsp; ���� ����</a>
               </div>
               <div class="menu">
                  <a href="adminpage4_list.html" class="navitem"><i
                     class="far fa-comment-dots fa-2x"></i>&nbsp; �Խ���</a>
               </div>
               <div class="menu">
                  <a href="adminpage5_approve.html" class="navitem"><i
                     class="fas fa-users-cog fa-2x"></i>&nbsp; ȸ�� ����</a>
               </div>
            </div>
         </div>
         <div class="chart_board_list">
           
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
                           <tbody class="board_list_tbl">
                            <tr>
                              <td class="num">����</td>
                              <td>�����������񳪿��¶�</td>
                              <td>�۾���(���̵�)</td>
                              <td>�����(��¥)</td>
                              <td>��ȸ��</td>
                           </tr>
                         
                         <tr>
                          <td class="num">����</td>
                          <td>�����������񳪿��¶�</td>
                          <td>�۾���(���̵�)</td>
                          <td>�����(��¥)</td>
                          <td>��ȸ��</td>
                       </tr>
                              <tr>
                                 <td class="num">1</td>
                                 <td>�����������񳪿��¶�</td>
                                 <td>�۾���(���̵�)</td>
                                 <td>�����(��¥)</td>
                                 <td>��ȸ��</td>
                              </tr>
                              <tr>
                                 <td class="num">2</td>
                                 <td>�����������񳪿��¶�</td>
                                 <td>�۾���(���̵�)</td>
                                 <td>�����(��¥)</td>
                                 <td>��ȸ��</td>
                              </tr>
                              <tr>
                                 <td class="num">3</td>
                                 <td>�����������񳪿��¶�</td>
                                 <td>�۾���(���̵�)</td>
                                 <td>�����(��¥)</td>
                                 <td>��ȸ��</td>
                              </tr>
                              <tr>
                                 <td class="num">4</td>
                                 <td>�����������񳪿��¶�</td>
                                 <td>�۾���(���̵�)</td>
                                 <td>�����(��¥)</td>
                                 <td>��ȸ��</td>
                              </tr>
                              <tr>
                                 <td class="num">5</td>
                                 <td>�����������񳪿��¶�</td>
                                 <td>�۾���(���̵�)</td>
                                 <td>�����(��¥)</td>
                                 <td>��ȸ��</td>
                              </tr>
                              <tr>
                                <td class="num">6</td>
                                <td>�����������񳪿��¶�</td>
                                <td>�۾���(���̵�)</td>
                                <td>�����(��¥)</td>
                                <td>��ȸ��</td>
                             </tr>
                             <tr>
                              <td class="num">7</td>
                              <td>�����������񳪿��¶�</td>
                              <td>�۾���(���̵�)</td>
                              <td>�����(��¥)</td>
                              <td>��ȸ��</td>
                           </tr>
                            
                            
                
            </tbody>
              </tbody>
                </tbody>
                  </tbody>
                    </tbody>
                      </tbody>
                        </tbody>
                          </tbody>
                           </tbody>
                           <tfoot>
                            
                             <tr>
                              
                               <td class="search" colspan="5"><input type="search">
                               <input type="button" value="�˻�">
                               ������ ��ȣ ������ ����</td>
                              </tr>
                            
                         </tfoot>
                        </table>
                     </div>
                 
               </form>
            
            <div>
               <button onclick="location.href='./UserNoticeInsert.jsp'"
                  class="post">�Խù� �ø���</button>
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
      <script src=".,/JS/icon.js" charset="UTF-8"></script>
</body>

</html>