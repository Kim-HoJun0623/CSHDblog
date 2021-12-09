<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="../Css/login-style.css">
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	function fn_sendLogin() {
		var frmLogin = document.frmLogin;
		var userId = frmLogin.userId.value;
		var userPassword = frmLogin.userPassword.value;
		if (userId.length == 0 || userId == "") {
			alert("아이디를 입력해주세요");
		} else if (userPassword.length == 0 || userPassword == "") {
			alert("비밀번호를 입력해주세요");
		} else {
			frmLogin.method = "post";
			frmLogin.action = "loginAction.jsp";
			frmLogin.submit();
		}
	}
	function fn_join() {

	}

	Kakao.init('40309a1811930cc2bfe4c85edb1be137'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		var kakao_Login = document.kakaoLogin;
		Kakao.Auth.login({
			scope : 'profile_nickname,account_email',
			success : function(authObj) {
				window.Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						const email = response.kakao_account.email;
						const name = response.properties.nickname;

						console.log(email);
						console.log(name);
						console.log("로그인성공");

						document.getElementById('kakaoemail').value = email;
						document.getElementById('kakaoname').value = name;
						//$('#kakaoEmail').val(email);
						//$('#kakaoName').val(name);
						kakao_Login.method = "post"
						kakao_Login.action = "kakaoLoginAction.jsp";
						kakao_Login.submit();
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>
</head>
<body>

	<header class="header">
		<div class="header_top">
			<a href="../html/Login.jsp">LOGIN</a> <a href="../html/Sign.jsp">SIGN</a>
		</div>
		<div class="header_logo">
            <a href="../html/Mainpage.jsp">
                <img src="../Img/big-log.jpg" alt="logo">
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
					<div class="ico">
						<img src="../Img/id-card-solid-wh.svg" alt="id-ico"
							class="ico-img">
					</div>
					<span class="box"> <input type="text" name="userId"
						class="int" maxlength="20" placeholder="ID">
					</span>
				</div>

				<!-- password -->
				<div class="password">
					<div class="ico">
						<img src="../Img/lock-solid-wh.svg" alt="pa-ico" class="ico-img">
					</div>
					<span class="box"> <input type="password"
						name="userPassword" class="int" maxlength="20"
						placeholder="PASSWORD">
					</span>
				</div>

				<!--login-button-->
				<div class="sumit">



					<input type="button" value="로그인" onclick="fn_sendLogin()"
						class="login-btn">
				</div>
				
			</form>
			<form name="kakaoLogin">
				<ul>
					<li><a href="javascript:kakaoLogin()">
							<img alt="kakaoImg" src="../Img/kakao_login_medium_narrow.png">
					</a></li>
					<!-- <li onclick="kakaoLogout();"><a href="javascript:void(0)">
							<span>카카오 로그아웃</span>
					</a></li>-->
				</ul>

				<div class="kakobtn" id="kakaologin">
					<input type="hidden" name="kakaoemail" id="kakaoemail">
					<input type="hidden" name="kakaonamee" id="kakaoname">
				</div>
				 <a href="../html/Sign.jsp">회원가입</a>
			</form> 
		</section>
	</div>

</body>
</html>