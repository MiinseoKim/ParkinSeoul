<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="css/join.css">
	 
<script type="text/javascript">
  $(document).ready(function() {
    var re = /^[a-zA-Z0-9]{8,16}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]{2,16}$/; // 닉네임 패스워드가 적합한지 검사할 정규식
    
    //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
    var idck = 0;
    //idck 버튼을 클릭했을 때 
    $("#idcheck").click(function() {
      //userid 를 param.
      var memberid = $("#id").val();
      
      if(!check(re, memberid, "아이디는 8~16자의 영문 대소문자와 숫자로만 입력해주세요")){
        return false;
      }
      
      if (memberid.trim() == '') {
        swal(
                'Oops...',
                '아이디를 입력해주세요.',
                'error'
             )
      } else { 
        $.ajax({
          async: true,
          type: 'POST',
          data: {'id' : memberid},
          url: "idcheck.htm",
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          success: function(data) {
            if (data.cnt > 0) {
              swal(
                      'Oops...',
                      '아이디가 이미 존재합니다. 다른 아이디를 입력해주세요.',
                      'error'
                    )

            } else {
              swal({
                title: "좋아요!",
                text: "사용가능한 아이디 입니다.",
                icon: "success",
              });
              idck = 1;
            }
          },
          error: function(error) {

            console.log("error : " + JSON.stringify(error));
          }
        });
      }
    });
    
    //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
    var nameck = 0;
    //idck 버튼을 클릭했을 때 
    $("#namecheck").click(function() {
      var name = $("#name").val();
      
      if(!check(re2, name, "닉네임은 2~16자의 한글 영문 대소문자와 숫자로만 입력해주세요")){
        return false;
      }
      
      if (name.trim() == '') {
        swal(
             'Oops...',
             '닉네임을 입력해주세요.',
             'error'
            )
      } else { 
        $.ajax({
          async: true,
          type: 'POST',
          data: name,
          url: "namecheck.htm",
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          success: function(data) {
//             console.log("hello ajax", data.cnt);
            if (data.cnt > 0) {
              swal(
                    'Oops...',
                    '닉네임이 존재합니다. 다른 닉네임을 입력해주세요.',
                    'error'
                  )
            } else {
              swal({
                title: "멋진 닉네임이네요!",
                text: "사용가능한 닉네임 입니다.",
                icon: "success",
              });
              nameck = 1;
            }
          },
          error: function(error) {

            console.log("error : " + JSON.stringify(error));
          }
        });
      }
    });
    
    
    $("#insertBtn").click(function() {

      var id = $("#id").val();
      var name = $("#name").val();
      var password = $("#password").val();
      var password2 = $("#password2").val();
      
      
      
      if(id=="" || name==""|| password==""){
        swal(
                'Oops...',
                '정보를 모두 입력해주세요.',
                'error'
              )
      }else if(password!=$("#password2").val()){
        swal(
                'Oops...',
                '비밀번호를 확인해주세요.',
                'error'
              )
      }else if(idck==0){
        swal(
                'Oops...',
                'ID 중복 확인을 해주세요.',
                'error'
              )
      }else if(nameck==0){
        swal(
                'Oops...',
                '닉네임 중복 확인을 해주세요.',
                'error'
              )
      }else{
        
        if(!check(re, password, "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력해주세요")){
          return false;
        }
        
        if(!check(re, password2, "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력해주세요")){
          return false;
        }
        
        var parameter = JSON.stringify({
          'id' : id,
          'name' : name,
          'password' : password
        });
        
        console.log(parameter);
        
        $.ajax({
          url:'memberrest.htm',
          data: parameter,
          contentType: 'application/json;charset=UTF-8',
          type: 'POST',
          success: function() {
            swal({
              title: "Welcome to ParkinSeoul!",
              button: true,
              icon: "success",
            })
            .then((willDelete) => {
              if (willDelete) {
                location.href='home.htm'
              }
            });
          },
          error : function(error) {
            console.log("no good "+JSON.stringify(error));
          }
        }); 
      }
      
    });
    
    
    function check(re, what, message) {
      if(re.test(what)) {
          return true;
      }
      swal(
              'Oops...',
              message,
              'error'
            )
    }
    
    
  });
</script>

<!-- <section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Sing Up</h1>
						<p>회원가입 페이지 입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> -->
<!--/#page-breadcrumb-->



<section class="signup" id="body"><br><br><br>
	<div class="container" id="container">
		<div class="signup-content">
			<div class="signup-form">
				<h2 class="form-title">Sign up</h2>
				<form class="register-form">
					<div class="form-group">
						<label for="id"><i
							class="zmdi zmdi-account material-icons-name"></i></label> <input
							type="text" name="id" id="id" placeholder="Your ID" style="width: 200px;float: left;">
						<button id="idcheck" type="button" class="check-submit">중복 확인</button>
					</div>
					<div class="form-group">
						<label for="name"><i
							class="zmdi zmdi-account material-icons-name"></i></label> <input
							type="text" name="name" id="name" placeholder="Your Name" style="width: 200px;float: left;">
							<button id="namecheck" type="button" class="name-submit">닉네임확인</button>
					</div>
					<div class="form-group">
						<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
							type="password" name="pass" id="password" placeholder="Password" />
					</div>
					<div class="form-group">
						<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
						<input type="password" name="re_pass" id="password2"
							placeholder="Repeat your password" />
					</div>
					<!--  <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
					<div class="form-group form-button">
						<input type="button" name="signup" id="insertBtn"
							class="form-submit" value="Register" />
					</div>
				</form>
			</div>
			<div class="signup-image">
				<figure>
					<img src="images/signup-image.jpg" alt="sing up image">
				</figure>
				<a href="login.htm" class="signup-image-link">I am already
					member</a>
			</div>
		</div>
	</div><br><br><br>
</section>

