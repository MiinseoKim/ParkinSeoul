<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="css/join.css">

<body>
	<section class="sign-in" id="body"><br><br><br>
		<div class="container" id="container">
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
							<input type="submit" name="signin" id="signin"
								class="form-submit" value="Log in" />
						</div>
					</form>
					<div class="social-login">
						<span class="social-label">Or login with</span>
						<ul class="socials">
							<li><a id="custom-login-btn"
								href="javascript:loginWithKakao()"> <img
									src="images/login/kakao_btn_small.png">
							</a></li>
							<li>
							<!-- 네이버아이디로로그인 버튼 노출 영역 -->
								<div id="naver_id_login"></div> 
								<!-- //네이버아이디로로그인 버튼 노출 영역 --> 
								<script	type="text/javascript">
                  var naver_id_login = new naver_id_login("dcDbM7Yxxl3oWl91et2n",  "http://localhost:8090/parkinseoul/callback.jsp");
                  var state = naver_id_login.getUniqState();
                  naver_id_login.setButton("green", 1, 35);
                  naver_id_login.setDomain("http://localhost:8090");
                  naver_id_login.setState(state);
                  naver_id_login.setPopup();
                  naver_id_login.init_naver_id_login();
                </script></li>
						</ul>
					</div>
				</div>
			</div>
		</div><br><br><br>
	</section>

<script type="text/javascript">
 
//사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('d9e23a5363a7bc0c5284bc04e7e8dd07');
//카카오 로그인 버튼을 생성합니다.
function loginWithKakao() {
  
  Kakao.Auth.cleanup();
  Kakao.Auth.login({
    success: function(authObj) {
//       console.log(authObj);
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
          console.log(res);
          var parameter = JSON.stringify({
            'id': res.kakao_account.email,
            'password': res.id,
            'name': res.properties.nickname
          });
          var osc = {
                'username': res.kakao_account.email,
                'password': res.id
          };
          $.ajax({
            type:'POST',
            url:'idcheck.htm',
            data : {"id":res.kakao_account.email},
            contentType: 'application/json;charset=UTF-8',
            dataType:"json",
            success:function(data){
              console.log(data.cnt);
              if(data.cnt==0){
                console.log("insert ajax");
                $.ajax({
                  type:'POST',
                  contentType: 'application/json;charset=UTF-8',
                  url:'memberrest.htm',
                  data : parameter,
                  success:function(){
                    console.log("login");
                    $.ajax({
                      type:'post',
                      url:'login',
                      data : osc,
                      success:function(data){
                        location.href="home.htm"
                      }
                    });
                  }
                });
              }else{
                $.ajax({
                  type:'post',
                  url:'login',
                  data : osc,
                  success:function(){
                    location.href="home.htm"
                  }
                });
              }
            },
            error:function(error) {
              console.log(error);
              console.log(error.status);
            }
          }); 
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    }
  });
};

   
  </script>
</body>






