<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LOGIN</title>
    <link rel="stylesheet" href="../Css/login-style.css">
    <script type="text/javascript">
function fn_sendLogin(){
   var frmLogin=document.frmLogin;
   var userId=frmLogin.userId.value;
   var userPassword=frmLogin.userPassword.value;
   if(userId.length==0 ||userId==""){
      alert("아이디를 입력해주세요");
   }else if(userPassword.length==0 ||userPassword==""){
      alert("비밀번호를 입력해주세요");
   }else{
	   frmLogin.method="post";
	   frmLogin.action="loginAction.jsp";
	   frmLogin.submit();
   } 
}
function fn_join(){

}
</script>
</head>
<body>
    <header class="header">
        <div class="header_top">
            <a href="../jsp/Login.jsp">LOGIN</a>
            <a href="../jsp/Sign.jsp">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../jsp/Mainpage.jsp">
                <h1>CSHD</h1>
                <p>blog</p>
            </a>
        </div>
</header>

<!-- login -->
<div class="content">
    <h2>LOGIN</h2>
    <section class="login">
        <form accept-charset="utf-8" name="frmLogin">
            <!-- id -->
        <div class="id">
            <div class="ico"><img src="../Img/id-card-solid-wh.svg" alt="id-ico" class="ico-img"></div>
            <span class="box">
                <input type="text" name="userId" class="int" maxlength="20" placeholder="ID">
            </span>
        </div>

            <!-- password -->
        <div class="password">
            <div class="ico"><img src="../Img/lock-solid-wh.svg" alt="pa-ico" class="ico-img"></div>
            <span class="box">
                <input type="password" name="userPassword" class="int" maxlength="20" placeholder="PASSWORD">
            </span>
        </div>

        <!--login-button-->
        <div class="sumit">
        
            
                <input type="button" value="로그인" onclick="fn_sendLogin()" class="login-btn">
            
            <a href="../jsp/Sign.jsp">회원가입</a>
        </div>
        </form>
    </section>
</div>
    
</body>
</html>