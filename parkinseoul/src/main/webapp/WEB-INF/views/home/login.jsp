<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="css/join.css">

<section class="sign-in">
	<div class="container">
		<div class="signin-content">
			<div class="signin-image">
				<figure>
					<img src="images/signin-image.jpg" alt="sing up image">
				</figure>
				<a href="join.htm" class="signup-image-link">Create an account</a>
			</div>

			<div class="signin-form">
				<h2 class="form-title">Sign In</h2>
				<c:url value="/login" var="loginURL"></c:url>
				<form class="register-form" id="login-form" action="${loginURL}"
					method="post">
					<div class="form-group">
						<label for="your_name"><i
							class="zmdi zmdi-account material-icons-name"></i></label> <input
							type="text" name="username" id="username" placeholder="Your ID" />
					</div>
					<div class="form-group">
						<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
							type="password" name="password" id="password"
							placeholder="Password" />
					</div>
					<!--   <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div> -->
					<div class="form-group form-button">
						<input type="submit" name="signin" id="signin" class="form-submit"
							value="Log in" />
					</div>
				</form>
				<div class="social-login">
					<span class="social-label">Or login with</span>
					<ul class="socials">
						<li><a id="kakao-login-btn"> <!-- <img src="images/login/kakao_btn_small.png"> -->
						</a></li>
						<li><a href="#"><i
								class="display-flex-center zmdi zmdi-naver">N</i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
  $(document).ready(function() {
    $('#login').click(function() {
      location.href = '${pageContext.request.contextPath}/member/list';
    });

    //사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d9e23a5363a7bc0c5284bc04e7e8dd07');
    //카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
            var parameter = JSON.stringify({
              'id': res.kakao_account.email,
              'password': res.id,
              'name': res.properties.nickname
            });
            $.ajax({
              url: 'memberrest.htm',
              data: parameter,
              contentType: 'application/json;charset=UTF-8',
              type: 'POST',
              success: function() {
                alert("Welcome to ParkinSeoul!");
                location.href = "home.htm";
              }
            });
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });

  });
</script>







