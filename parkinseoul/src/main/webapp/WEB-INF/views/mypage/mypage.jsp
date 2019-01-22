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
<!-- 	  <div class="col-sm-12"> -->
	  <div class="text-center col-md-6 col-sm-6">
	    <br><br><p><img width="350" height="300" src="images/home/clients.png" style="margin: auto;float: unset;" class="img-responsive"></p>
	  </div>
	  
		<div class="col-md-4 col-sm-12" style="margin: 70px;float: left;">
			<div class="contact-form bottom">
				<h2 align="left">회원 정보 수정</h2>
				<form id="main-contact-form" name="contact-form" method="post"
					action="sendemail.php">
					<div class="form-group" style="width: 300px">
						<input type="text" name="name" style="width: 210px;float: left;"
							class="form-control" required="required" placeholder="닉네임">
						<input type="button" name="submit" class="check" style="font-size: 13px;" value="중복확인">
					</div>
					<div class="form-group" style="width: 300px">
						<input type="email" name="email" class="form-control"
							required="required" placeholder="비밀번호">
					</div>
					<div class="form-group" style="width: 300px">
					  <input type="email" name="email" class="form-control"
              required="required" placeholder="비밀번호확인">
					</div>
					<div class="form-group" style="width: 300px">
						<input type="submit" name="submit" class="btn btn-submit"
							value="수 정">
					</div>
				</form>
		</div>
	</div>
	</div>
	</div>
</div>
