<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
  $("#submit").click(function() {
    var param = JSON.stringify({
      "b_title" : $("#b_title").val(),
      "b_content":$("#b_content").val(),
      "seq":${sessionScope.dto.seq}
    });
    $.ajax({
      url:'writeproc.htm',
      data: param,
      contentType: 'application/json;charset=UTF-8',
      type: 'POST',
      success: function(data) {
        location.href='boardlist.htm';
      },
      error : function(error) {
        console.log("no good "+JSON.stringify(error));
      }
    });
  });
  
})

</script>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Write</h1>
						<p>게시글을 등록 해주세요.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section id="about-company" class="padding-top wow">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center display">
				<div class="contact-form bottom">
					<h2></h2>
					<form id="write" name="contact-form" >
						<div class="form-group">
							<input type="hidden" name="seq" value="${sessionScope.dto.seq}">
							<input type="text"  id="b_title" class="form-control"
								required="required" placeholder="글 제목">
						</div>
						<div class="form-group">
							<textarea name="b_content" id="b_content" required="required"
								class="form-control" rows="20" placeholder="내용"></textarea>
						</div>
						<div class="form-group">
							<a class="btn btn-submit" style="width: auto;"
								href="boardlist.htm">&nbsp;취소&nbsp;</a>&nbsp; <input type="button"
								id="submit" class="btn btn-submit" style="width: auto;"
								value="등록하기">

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>