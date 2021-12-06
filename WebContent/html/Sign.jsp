<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign</title>
    <link rel="stylesheet" href="../Css/sign-style.css">
    <script type="text/javascript">
function fn_sendJoin(){
   var frmJoin=document.frmJoin;
   var userId=frmJoin.userId.value;
   var userPassword=frmJoin.userPassword.value;
   var userName = frmJoin.userName.value;
   var userGender = frmJoin.userGender.value;
   var userEmail = frmJoin.userEmail.value;
   if(userId.length==0 ||userId==""){
      alert("아이디를 입력해주세요");
   }else if(userPassword.length==0 ||userPassword==""){
      alert("비밀번호를 입력해주세요");
   }else if(userName.length==0 ||userName==""){
      alert("이름 입력해주세요");
   }else if(userGender.length==0 ||userGender==""){
      alert("이메일을 입력해주세요");
   }else if(userEmail.length==0 ||userEmail==""){
      alert("성별을 입력해주세요");
   }else{
	   frmJoin.method="post";
	   frmJoin.action="signAction.jsp";
	   frmJoin.submit();
   } 
}
</script>
</head>
<body>
    <header class="header">
        <div class="header_top">
            <a href="../html/Login.jsp">LOGIN</a>
            <a href="../html/Sign.jsp">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../jhtmlsp/Mainpage.jsp">
                <img src="../Img/big-log.jpg" alt="logo">
            </a>
        </div>
</header>

<div class="content">
    <h2>Sign</h2>
    <section class="sign">
        <form accept-charset="utf-8" name="frmJoin">
            <!-- name -->
            <div>
                <h3 class="title"><label for="id">아이디</label></h3>
                <span class="name box">
                    <input type="text" name="userId" id="id" class="int" maxlength="20"placeholder="ID">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- password -->
            <div>
                <h3 class="title"><label for="password">비밀번호</label></h3>
                <span class="password box">
                    <input type="password" name="userPassword" id="password" class="int" maxlength="20"placeholder="Password">
                    <span id="alerTxt">사용불가</span>
                    <img src="../Img/lock-solid.svg" id="pswd_img" class="pswdimg" alt="">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- password_check -->
            <div>
                <h3 class="title"><label for="check">비밀번호 확인</label></h3>
                <span class="check box">
                    <input type="password" name="password_check" id="check" class="int" maxlength="20"placeholder="Password_check">
                    <img src="../Img/user-lock-solid.svg" id="check_img" class="pswdimg" alt="">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- name -->
            <div>
                <h3 class="title"><label for="name">이름</label></h3>
                <span class="name box">
                    <input type="text" name="userName" id="name" class="int" maxlength="20" placeholder="name">  
                </span>
                <span class="error_next_box"></span>
            </div>

			<!-- gender -->
            <div>
                <h3 class="title"><label for="gender">성별</label></h3>
                <select name="userGender">
				<option value="남">남자</option>
				<option value="여">여자</option>
				</select>
                <span class="error_next_box"></span>
            </div>

            <!-- email -->
            <div>
                <h3 class="title"><label for="email">이메일</label></h3>
                <span class="email box">
                    <input type="text" name="userEmail" id="email" class="int" placeholder="####@naver.com">
                </span>   
                <span class="error_next_box">이메일 주소를 다시 확인해주세요</span>
            </div>

           <!-- button -->
            <div class="sumit">
        	    <input type="button" value="회원가입" onclick="fn_sendJoin()" id="btnsign">
        
            </div>
            
            
        </form>

    </section>
</div>
</div>
    <!-- wrapper -->
    <script src="../js/sign.js"></script>
</body>
</html>