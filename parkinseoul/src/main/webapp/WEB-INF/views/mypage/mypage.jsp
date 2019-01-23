<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">My Page</h1>
						<p>개인정보 수정 페이지 입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="container text-center">
	<div class="row">
		<div class="col-md-3 col-sm-5">
			<br>
			<br>
			<div class="sidebar blog-sidebar">
				<div class="sidebar-item categories">
					<h3>Categories</h3>
					<ul class="nav navbar-stacked">
						<li><a href="#">회원 정보 수정</a></li>
						<li><a href="hearts.htm">좋아요 리스트</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="text-center col-md-4 col-sm-6">
			<br> <br>
			<p>
				<img width="350" height="300" src="images/home/clients.png"
					style="margin: auto; float: unset;" class="img-responsive">
			</p>
		</div>

		<div class="col-md-3 col-sm-12" style="margin: 70px; float: left;">
			<div class="contact-form bottom">
				<h2 align="left">회원 정보 수정</h2>
				<form id="main-contact-form" name="contact-form" method="post"
					action="sendemail.php">
					<div class="form-group" style="width: 300px">
						<input type="text" id="name" style="width: 210px; float: left;"
							class="form-control" required="required" placeholder="닉네임"
							value="${sessionScope.dto.name}"> <input type="button"
							id="idcheck" class="check" style="font-size: 13px;" value="중복확인">
					</div>
					<div class="form-group" style="width: 300px">
						<input type="password" id="password" name="pass"
							class="form-control" required="required" placeholder="비밀번호">
					</div>
					<div class="form-group" style="width: 300px">
						<input type="password" id="pwd" name="re-pass"
							class="form-control" required="required" placeholder="비밀번호확인">
					</div>
					<div class="form-group" style="width: 300px">
						<input type="button" id="update" class="btn btn-submit"
							value="수 정">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
  var id = ('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}');
  //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
  var idck = 0;
  $('#update').click(function() {
    var name = $("#name").val();
    var password = $("#password").val();
    if("${sessionScope.dto.name}"==name){
      idck=1;
    }
    
    if ($("#pwd").val() == "" || password == "" || name == "") {
      swal('Oops...', '정보를 모두 입력해주세요.', 'error')
    } else if (password != $("#pwd").val()) {
      swal('Oops...', '비밀번호를 확인해주세요.', 'error')
    } else if (idck == 0) {
      swal('Oops...', 'ID 중복 확인을 해주세요.', 'error')
    } else {
      var parameter = JSON.stringify({
        'id': id,
        'name': name,
        'password': password
      });

      $.ajax({
        type: 'PUT',
        url: 'memberrest.htm',
        data: parameter,
        contentType: 'application/json;charset=UTF-8',
        success: function() {
          swal('ParkinSeoul', '회원 정보가 수정되었습니다.', 'success')
          $('#name').val('');
          $('#password').val('');
          $('#pwd').val('');
        }
      });
    }
  });

  //idck 버튼을 클릭했을 때 
  $("#idcheck").click(function() {
    var name = $("#name").val();

    if (name.trim() == '') {
      swal('Oops...', '아이디를 입력해주세요.', 'error')
    } else {
      $.ajax({
        async: true,
        type: 'POST',
        data: name,
        url: "namecheck.htm",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        success: function(data) {
          //           console.log("hello ajax", data.cnt);
          if (data.cnt > 0) {
            swal('Oops...', '닉네임이 존재합니다. 다른 닉네임을 입력해주세요.', 'error')
          } else {
            swal({
              title: "멋진 닉네임이네요!",
              text: "사용가능한 닉네임 입니다.",
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
</script>






