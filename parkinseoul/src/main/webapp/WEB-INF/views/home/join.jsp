<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="css/join.css">

<!--  <script src="vendor/jquery/jquery.min.js"></script> 
 <script src="js/join.js"></script>-->
	 
<script type="text/javascript">
  $(document).ready(function() {
    //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
    var idck = 0;
    //idck 버튼을 클릭했을 때 
    $("#idcheck").click(function() {
      //userid 를 param.
      var memberid = $("#id").val();
      var parameter = JSON.stringify({
        'id' : memberid
      });
      if (memberid.trim() == '') {
        $('#myModalLabel').text("아이디 중복체크");
        
        var str = '<div class="well row text-center">';
        str += '<label class="col-xs-12 control-label">아이디를 입력해주세요.</label>'
        str += '</div>';
        $('.modal-body').html(str);
        
        str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
        
        $('.modal-footer').html(str);
        
        $('#myModal').modal();
        
      } else { 
        $.ajax({
          async: true,
          type: 'POST',
          data: parameter,
          url: "idcheck.htm",
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          success: function(data) {
            if (data.cnt > 0) {
              $('#myModalLabel').text("아이디 중복체크");
              
              var str = '<div class="well row text-center">';
              str += '<label class="col-xs-12 control-label">아이디가 존재합니다. 다른 아이디를 입력해주세요.</label>'
              str += '</div>';
              $('.modal-body').html(str);
              
              str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
              
              $('.modal-footer').html(str);
              
              $('#myModal').modal();
              $("#userid").focus();

            } else {
              $('#myModalLabel').text("아이디 중복체크");
              
              var str = '<div class="well row text-center">';
              str += '<label class="col-xs-12 control-label">사용 가능한 아이디입니다.</label>'
              str += '</div>';
              $('.modal-body').html(str);
              
              str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
              
              $('.modal-footer').html(str);
              
              $('#myModal').modal();
              $("#userid").focus();
              idck = 1;
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
          console.log("success");
          alert("Welcome to ParkinSeoul!");
          location.href='home.htm'
        },
        error : function(error) {
          console.log("no good "+JSON.stringify(error));
        }
      });       
    });
    
    
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



<section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form class="register-form" >
                            <div class="form-group">        
                                <label for="id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id" placeholder="Your ID"/>
                                <button id="idcheck" type="button" class="btn btn-common">중복확인</button>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="password" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="password2" placeholder="Repeat your password"/>
                            </div>
                           <!--  <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
                            <div class="form-group form-button">
                                <input type="button" name="signup" id="insertBtn" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                      <!--   <a href="#" class="signup-image-link">I am already member</a> -->
                    </div>
                </div>
            </div>
        </section>





<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-lg modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div><!-- 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>
